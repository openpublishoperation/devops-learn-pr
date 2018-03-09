---
title: Achieving No Downtime Through Versioned Service Updates
description: What is version control? If you're developing code, building websites, or writing documentation, using version control is essential to protect your work.
ms.prod: vs-devops-alm
ms.technology: vs-devops-articles
ms.topic: article
ms.manager: douge
ms.author: buckh
ms.date: 11/09/2017
---

# Achieving No Downtime Through Versioned Service Updates
> By: Buck Hodges

With on-premises software like Team Foundation Server (TFS), it often
means taking the server offline for updates and upgrades. Visual Studio
Team Services (VSTS) and TFS share the same code-base, so operating like
TFS would mean downtime. Downtime is a complete nonstarter for global
24×7 service. VSTS is a critical dependency for our customers. They
count on it in order to ship their own software. There’s never a good
time for everybody. So how did we decide to handle upgrades for
VSTS?

> [!VIDEO https://www.youtube.com/embed/wTYoW41U2n8]

## Update Layers Separately

We have to be able to upgrade online. With a distributed online service
in multiple datacenters and separate data storage, not everything can
change simultaneously. If you broadly split the VSTS service into
application code and databases, which are versioned independently of
each other, one of those needs to absorb the complexity of handling
versioning.

We chose to handle it in the application code. VSTS and TFS have a lot
of SQL in the databases. Lots of IF statements are possible with SQL,
but never fun. So instead of further complicating our SQL, we handle
this complexity in our application code. Specifically, we created a set
of factory classes that understand the SQL versioning.

Every sprint we create a new interface with that version. That way
there’s always code that matches each database version. This allows
for easy rollback of binaries during deployment. The first thing we do
is deploy the binaries. If we deploy the new binaries and something goes
wrong, we can very quickly roll back binaries. After we deploy the
binaries, we kick off the database servicing.

So how does this actually work? Let’s say we’re currently deploying
Sprint 123. The binaries understand Sprint 123 database schema and they
understand Sprint 122 schema. The general pattern is to work with both
versions (sprints) N and N-1 of the SQL Schema. The binaries query the
database, determine what schema version they are talking to, and then
load the appropriate binding. Then, the application code handles the
case when the new data schema is not yet available. Once the new version
is available, the application code can start making use of the new
functionality that is enabled by the latest database version.

## Roll Forward Only with Data Tier

Once we upgrade the databases, we’re in a roll-forward situation if we
encounter a problem. Online database migrations are pretty complex and
often multi-step – therefore rolling forward is usually the best way to
address a problem. To look at it another way, if you can’t get upgrade
right, what leads you to believe you could get rollback right as well?
On top of that, you’d end up testing code (rollback) that you hope never
to use and would almost always be wasted work.

## Deployment Sequence

Now let’s look at how we sequence the database changes while remaining
online. For example, consider a case where we want to add a set of
columns into the database and maybe transform the data. We have to do
this invisibly to the user, which means avoiding table locks as much as
possible and then holding locks for the shortest time possible so that
it is not perceptible to the end user.

The first thing we do is to manipulate the data, possibly in parallel
tables using a SQL trigger to keep the data in sync. This also means
that large data migrations and transformations sometimes have to be
multi-step over several deployments across multiple sprints.

Once we’ve created the extra data or new schema in parallel, we go into
what we call “deployment mode” for the application code. In deployment
mode, when the code makes a call to the database, it first grabs a lock
on the schema and then releases it after running the stored procedure to
keep the database from changing between the time the call to the
database is issued and when the stored procedure runs.

The upgrade code acts as a schema writer and requests a writer lock on
the schema. The application code takes priority in taking a reader lock,
and the upgrade code sits in the background trying to acquire the writer
the lock. Under the writer lock, only a small number of very fast
operations are allowed on the tables. Then the lock is released and the
application records the new version of the database is in use and uses
the interfaces that match the new database version.

The database upgrades are all performed using a migration pattern – we
have a set of code and scripts that look at the version of the database
and then make the incremental changes to migrate the schema between from
the old to the new version. All migrations are automated and rolled out
via the Release Management service in VSTS.

We also need to update the web UI without disrupting users. When we
upgrade the Javascript files, style sheets or images, we don’t want a
mix of old and new being loaded by the client, as that can lead to
errors that could lose work in progress, such as a description you are
editing in a work item. Therefore, we version all the Javascript, CSS
and image files by having all files associated with a deployment in a
separate, versioned folder. When the web UI makes calls back to the
application tier, it’s loading assets with a specified version. Only
when a user action results in a full page refresh does the new web UI
get loaded into the browser. This ensures that the user’s experience is
never disrupted by the upgrade.

|             |                           |
|-------------|---------------------------|
|![Image: Buck Hodges, MSFT](https://secure.gravatar.com/avatar/baad17c3a2d3ea8fffc392f9dd209426?s=130&d=mm&r=g)|Buck Hodges is Director of Engineering for Visual Studio Team Services. He's been a member of the team since the beginning of TFS, starting as a developer on Team Foundation Version Control for the first version of TFS. He's helped lead the transition of the team to the cloud and DevOps.|