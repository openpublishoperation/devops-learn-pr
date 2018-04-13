---
title: Moving 65,000 Microsofties to DevOps on the Public Cloud
description: "Moving 65,000 Microsofties to DevOps on the Public Cloud Author: Sam Guckenheimer Last Update: 8/4/2017 Interview and Transcript At Build 2017, I hosted an open Q&A session with me leaders from four engineering groups in Microsoft. We have been on a move for the last three years toward one engineering system in Microsoft. This is a decision"
ms.topic: devops
ms.topic: devops-learn
ms.topic: conceptual
ms.manager: douge
ms.author: samgu
ms.date: 08/04/2017
---
# Moving 65,000 Microsofties to DevOps on the Public Cloud
> By: Sam Guckenheimer

## Interview and Transcript
At Build 2017, I hosted an open Q\&A session with me leaders from four
engineering groups in Microsoft. We have been on a move for the last
three years toward one engineering system in Microsoft. This is a
decision from the Senior Leadership Team, Satya and his reports, that we
were going to reverse a practice we had for the previous two decades of
each division determining its own engineering system. The decision was
that Microsoft would invest in the best engineering system, use it and
then productive it as VSTS. In fact, the morning of the Build session,
Satya had his monthly town hall for employees. A large part of that town
hall was Satya’s discussion with Gabe Aul, Windows and Devices Group
Engineering VP, about Windows’ move to VSTS, where 90% of Windows is now
under VSTS. Here’s the session from Build. The transcript
follows.

> [!VIDEO https://www.youtube.com/embed/M7mHOhUQjmU]

## Introductions
SAM GUCKENHEIMER \[SG\]: I have with me some very experienced, energetic
folks. From furthest to nearest, Tony Seeley from Windows and Devices,
Jordan Edwards from Bing, Jen Perret from Skype and Mike Kippen from
Azure. I’m going to let each of them introduce themselves for a couple
of minutes. Then it will literally be open Q\&A. You’re allowed to ask
anything about how we work. Let’s start with introductions. Why don’t we
start with you, Tony?

TONY SEELEY \[TS\]: Okay. Good morning. My name is Tony Seeley. I’ve
been at Microsoft for around 17 years. Prior to that I was with Great
Plains Software based out at North Dakota. Prior to that, I was in the
British Armed Forces for 9 years and 58 days. The last 58 days being the
best for sure. Within the Windows and Devices Group or WDG, I’m the GPM,
the group program manager, for the engineering system that owns source
control. We’re responsible for the old Source Depot solution we used to
have. We’ve just migrated 3,500 engineers to a 270 gig repo in Git. Been
in the job for two years and the sole request when I took the job was
get everybody on Git. So we have around 6,500 engineers in total, around
2,000 of them working in smaller repos, and we’ve got another 500 to get
on to this very, very large repo, this 270 gig repo. So that’s me.

JORDAN EDWARDS \[JE\]: Sure. I’m Jordan Edwards. I’m a program manager
on the AI\&R Engineering Experiences team, so that means we work on the
engineering systems for Bing, Cortana, and Microsoft Advertising. Inside
of that space I own the source control, build, and CICD experience that
our engineers interact with on a daily basis. As far as what we build,
we have around 10,000 cloud services today, and a slew of mobile
applications as well. As far as our size goes, we’re running on over a
million ACU. We generate tens of petabytes or telemetry on a daily
basis. We’re receiving tens of thousands of queries every second. What
are our biggest problem spaces we’re working on solving? One of them is
how to be better at data driven experimentation. Another is how do we
decompose our monolithic services into containerized microservices. The
third one is how do we foster a culture where it’s easier to share a
code across organizational boundaries.

JENNIFER PERRET \[JP\]: I’m coming up on 25 years with Microsoft, so Old
Woman River here. Let’s see. I started actually in the last five years
in a role from Azure working with Skype, helping them re-architect the
original Skype consumer peer-to-peer architecture onto the cloud, so
that we could actually keep up with the billions of devices that we
wanted to make sure Skype could run on. So we had to re-architect that.
I’m really excited to say that that also included a transition to
DevOps, it also included a transition to micro-services, and that we
also got an opportunity to push the heck out of Azure. When we
originally started, IaaS wasn’t out, it was 20 minutes to deploy, and we
need to actually educate all of our engineers on how to build on Azure
and how to expect it to go away. So super high availability on real time
audio video, four nines, and then in a DevOps mode.

Areas that I now own are still the microservices, Azure compliance and
security, because our backend infra also now ships with Microsoft teams
and Skype for Business, so it’s our next generation calling that’s built
on Azure. I also own the service build validation deployment CICD
pipeline and our client build and validation pipelines. This includes
our transition to VSTS and Git. We still have a mixed mode where we
actually do within our backend infra. We have literally multiple clouds,
so we still have the original Skype consumer, what we call our DCs, that
are our Linux Postgres solutions on our bare metal, this original Skype
consumer. We have Azure. We have Azure AutoPilot Then we also have our
Skype for Business infra running on bare metal. So a whole bunch of
different things there.

MIKE KIPPEN \[MK\]: You said you didn’t prepare that.
JP: I tried. Then I started scrambling, so I was worried I went too far.

SG: No pressure, Mike.

MK: Hi, guys. My name is Mike Kippen. I’ve been with Microsoft for only
12 years. I am an engineering manager on the Engineering Pipeline team.
We are part of the Cloud Engineering Services org. As you could tell, a
lot of engineering involved in what we do. More or less, the Engineering
Pipeline team, we have a goal which is to get developer changes from a
local environment into cloud as quickly and efficiently as possible but
with a key difference of maintaining governance, security, and
compliance to meet the Azure cloud requirements. We have to go in front
of auditors on a regular basis. We have a responsibility to our
customers to meet certain goals in security and compliance. Really, that
pipeline is about stitching those things together so that developers
have the right way to get into production without making mistakes. As
part of this, we’re part of the Cloud Engineering Services. This
organization is a great place to work, by the way. And yeah, we are
hiring.

MK: Really, it’s an organization that’s designed about making cloud
first services to support scale and run the cloud. This includes
monitoring, diagnostics, logging, ICM (Incident Management and
Performance Management), and also the pipeline that I described. When
you look at Cloud ES as a whole, it’s actually many of the parts we use
across all of Microsoft. ICM for example is used across all of
Microsoft. The scope is really growing from Azure and from the cloud to
now being really let’s get this out to all of Microsoft called Cloud and
Enterprise. Then let’s take these things to all of Microsoft. Then if we
can, let’s also bring these things outside of Microsoft to make them
first party options, things like Azure Advisor, and some other things
that you’re seeing pop up really started from Cloud ES.

Just to give you an idea of some of our scale, I did a quick query on
just last week in terms of looking at what we do. Just last week we had
35,000 pushes to our Git service. Across that was from 5,000 developers
across 1200 repositories. This resulted in about 9,000 official builds
and 15,000 merge validation pull requests. So every single piece of code
that hits a server, you need to make sure it doesn’t contain the
credentials, it doesn’t contain viruses, that these things are verified
that we’re not breaking everybody else on different types of platforms.
We actually do validation on everything that hits the server. The really
positive note about this is just as the scale of the cloud’s been going,
we were able to do just last week 7,000 releases that went into the
cloud. So that’s about me. My first time at Build I just got an
opportunity to walk through the hub, pretty exciting, and thanks for
letting us be part of this.

SG: That’s great. Okay, anyone want to start us? Great. Okay. You got
the first question.

JP: Thank you sir for breaking the ice.

## Moving to Git

QUESTIONER 1: My question maybe one that nobody else is asking because
I’m sort of an old troglodyte, but I was in the NT Kernel team for 20
years. I remember the transition from SLIME to Source Depot. Everybody
was excited about that because it was clear benefit. I’ve seen the
posters up at Microsoft about the five stages of grief moving to Git.
I’ve talked to a few folks still over there. They’re not sure what
they’re getting out of Git. Since I’m not a Git convert yet, what was
the transition for Git? What was the benefits that you’re seeing from
it?

TS: Yeah, I can answer that. We actually did a lot of analysis. I joined
the team a couple years ago. We started off by doing lab analysis on the
Source Depot system we had at the time. One of the big challenges we
have is the number of engineers that we have access in this system on a
day-to-day basis, the amount of code that we actually have inside the
multiple depots that we have…. We actually had to run about 450 gigs
worth of data across 65 different databases which then you had to pair
together, which we call depots.

The challenge we’d have numerous, numerous issues. First thing is that
when you checked in submissions into the Source Depot, you’d have to
sometimes save stuff to more than one depot at the same time.
Frequently, we’d encounter tearing issues where you wouldn’t have an
atomic submission. You’d succeed in one and you’d fail in another. The
other big issues that we have with Source Depot is as we’ve grown, about
three years ago, Windows was a much smaller organization. We merged a
number of teams together. We merged Windows, Windows Phone, Xbox, our
Analog team. Now our Surface team is in there as well, our devices and
hardware team is in there as well. Now you have all this stuff in one
location, Source Depot is starting to fall over. We spent a lot of time
patching and getting it working.

We did a lot of evaluation two years ago on what the alternative should
be. Should we redouble-down on Source Depot and make it better? We
brought in some third-party vendors to offer solutions which we
evaluated. We looked at Git in a big way because that was the bet that
Microsoft was making with the 1ES or the Visual Studio Team Services
solution that’s available. The big wins that we get with Git are first
and foremost it really helps collaboration and experimentation. If you
want to experiment on something in Source Depot, you basically have to
back up all your changes if you haven’t made the submission. You have to
start again or you could reenlist which is the clone alternative for SD.
Then actually doing an enlistment that could take you 45 minutes.
What tended to happen was people wouldn’t do the enlistment. They would
try and work and they’d mess up their old code when they were trying
something new. Or if they’re working on a feature and a bug would come
along, it was very difficult to actually put that feature to one side,
start working on the bug, and then get back to the feature afterwards.
Or if they wanted to collaborate with somebody else and work on the same
thing, it was just a horrible experience. Because creating a dedicated
branch, because branches are all about how it works in SD, not so much
in Git, became a huge pain point.

Now with Git branches are an astonishingly lightweight concept. In fact,
branches are just a pointer into a huge graph tree, so it’s super, super
easy to create branches. They take seconds to create. You can share
those branches with anybody. You can invite people to work on those
branches. You can be working one thing, and then you can swap very
quickly to a new branch to experiment or to work on more than one
feature at the same time. The whole opportunity around collaboration and
experimentation was just very, very different. Now I’ll tell you that we
migrated 2,500 engineers in one weekend, which is our whole one core,
our centralized core engineering solutions services in one go. Which was
a very scary thing for us to do because they are the kernel and the file
system driver guys, the media guys, that were very low leveled down in
the system. They’re all hardened Source Depot users. They’ve been using
the system for 17 years. We really didn’t know what sort of response
we’d get.

Well, we did a survey two weeks after the transition and we got 72% of
the organization were either somewhat are very satisfied with the
transition, which blew us away. Our NSAT on people moving is very, very
high. It’s like 147 which is kind of unheard of for a transition this
size. We moved them on a Friday night. We actually opened up the
branches for them to start using the system on the Sunday morning, which
is just, again, an unbelievable achievement. There are other benefits as
well. 70% of the world, the industry, uses Git. So when it comes to
onboarding individuals and bringing them into the organization, it just
is so much easier if they’re using the same solution they used in
college or in other companies. We are now starting to truly embrace open
source within Microsoft. We are encouraging. It’s a very different
cultural Microsoft than it was five or ten years ago. We’re encouraging
engineers to don’t write something that’s already out there. Go and get
it from open source and incorporate it into your code.

Obviously, there’s lots of checks and balances when we do that, but we
do that a lot. When the whole of the open source community is storing
everything inside Git, if you want to get that and collaborate with it
as well, return stuff to open source. If you’re on that same system,
integration becomes so much easier, and sharing becomes so much easier.
We have a number of partners we work with on a regular basis. A lot of
Silicon and OEM partners that we work with out of the Windows
organization. None of them work in the Source Depot solution that we
have. So being able to integrate and collaborate with them in an
effective way and share code more effectively, Git becomes significantly
better. The challenges we have is how do we do this on a 270 GB repo,
which incidentally is just so the largest in the world. It’s beyond
comprehension.

MK: One thing to ask you there. I mean, you mentioned the poster. Just
to tell the room, it’s five stages of moving to Git. It’s got
essentially these smiley faces that are very unhappy and very angry and
red. Then over the course of the five stages, they become very happy and
green, and it talks about this experience. I think one the things we’ve
learnt about Git is that you can’t just tell a team, “Go use Git.” They
have to learn the processes of pull requests and dealing with how to
create branches on their own. Despite all of the documentation out there
on the internet, it’s a team and the way they operate. When they come
from something like Source Depot and they try to just redo it in Git,
they don’t really get the benefit. At least, speaking to that and the
Azure organization, we did a lot brown bags and we did a lot of
documentation, but it was trying to show people how to use it properly
and lead by example that way. The team figures stuff out over time, but
it’s not necessarily a switch in awesome NSAT. We didn’t really see that
in Azure. Still, today, we find teams using Git like Source Depot. As
you get more college students and stuff, you do see that as getting
better but …

TS: It’s funny you mentioned that. Before we onboarded everybody, we
actually went and interviewed a large number of teams. We interviewed
teams from Azure, a lot of teams that actually had made the transition.
They all talked about the same experience. They said, “It was horrible
for a while. It was just … I struggled and fought it every day.” Then
they all described this same thing. There’s an epiphany and a eureka
moment, a light bulb goes off, and they immediately get it. Then from
that point on, things get substantially better. The five stages of Git
posters that we produced, which are really the five stages of grief, was
a bit of a joke that we did just messing about internally. Someone
created a poster from it and it went viral. Everyone thought of posting
these things up. But it is very accurate. What we found is that, I will
tell you now, we have engineers that have been at Microsoft for 20 plus
years, they have used Source Depot for 17 years, and they are never
going to leave the first stage of the five stages of Git. They are going
to hate it for their entire time.

You know what? We train them, about 4,500 people, in big auditoriums,
700, 800 people at a time, on a whole day course providing them Git
fundamentals, the deltas of GVFS system which is the mechanism by which
we enable a 270 Git repo to clone in two and a half minutes. We did all
this, showed them everything. We have extensive Wiki articles and
documentation that we created. You’re right. That’s the only way to do
this. We introduced a champions program where every team had a champion
… Actually, most teams have more than one champion. Their job was to
provide escalation and support and mentorship and coaching, act as the
first line of support if you like, for those individuals that are
onboarding. We are seeing that by far the majority of individuals are
embracing it. But there are people that are never going to like it. I
feel bad for those guys, but we have to… If we’re going to embrace
collaboration and open source and code sharing, we need a better system
than Source Depot.

SG: In case you’re a little color blind like me, this is what happy and
green looks like.

JP: I would add, what’s interesting there is there’s still this
movement, there’s a lot of teams still on Source Depot. Some of the
conversations, and just to add some things that are still topics that
we’re trying to figure out, within my organization, we’ve done
multiple Git repos. We’re going with this entire strategy around
microservices, really focused on small teams, lots of little teeny tiny
repos. Again, that’s because we were starting from scratch with a lot of
our rearchitecture, so we could do that versus, “Hey, we’re just trying
to move some pieces out of a monolith into microservices.” But what gets
interesting there is now the conversations that we’re having across
Microsoft around when do you want to use multiple Git repos and when do
you want one.

One of the things that actually our organization had to solve is that
first, the Skype client, we actually have multiple repos that we do need
to actually build at a single point in time because it’s like our core
library that goes out with the device. So we actually had to solve a
solution across multiple Git repos to literally say, “Okay. We’re going
to build this all at once and set feature gates up associated with that
pipeline.” Now we’re in discussions with a lot of teams where they’re
trying to wrestle with that. I think that’s something that’s going to
kind of ever evolve as we continue to learn more, because it is this
interesting range now if you look at between the monolith and the
microservices and when and where you want … In some cases, almost a mini
monolith, right? Like the poor library stuff that goes on a client.

TS: Jen is right. If you can survive in small repos go that way.

JP: We got other people.

JE: All Git, yeah.

SG: That was the first question.

SG: Okay. We have another one put up here, so let’s keep going.
QUESTIONER 2: He kind of took what I was going to ask too is how many
people screamed when you took away TFVC and stuff. I was going to ask
how many people screamed when you took away essential source control,
but you kind of got into that. So I help manage a couple of TFS
instances on-prem, old 2013 one with a huge sprawl of TFVC. Many
collections … You’ve probably seen this before as well as a recently new
set up TFS 2017 instance. I also helped co-administrate our VSTS
instance. In many ways, we’re going through this same exercise right now
because I’ve read things like Brian Harry’s blog post about the One
Engineering System. I guess my question is when you get the same type of
resistance at times from people, what would you advise organizations out
there in the enterprise that are going through this type of transition
right now? What kind of tips would you give those folks that are trying
to move from TFVC over to Git into these new systems?

TS: I can start with that one. I think that the most important thing is
to accurately set expectations. As part of the engineering system in
WDG, we’ve rolled out a few different technologies. Some have gone
really, really badly. Some have gone really, really well. The real
differentiator between the two is that we oversold the ones that went
badly. We believed the hype. You do it when you’re in your own team.
You’re passionate about what you’re building, and you’re super
excited, and you say, “You could do anything.” But the reality is day
one and you probably can’t do anything. A lot of people find that if you
set the expectation here and you don’t make it, then you’re going to
have very dissatisfied engineers. If you can set the expectation at the
right place and wherever it is and ideally beat it, exceed their
expectations, you’ll be amazed how willing … People go, engineers don’t
like change. From my experience that’s not true. Engineers don’t like
being lied to or misled. Who does, right?

JP: Or slowed down.

TS: I think that’s the big message.

MK: Work by example. I think take a subset of products you want to work
with, move them to Git, and then have them work as you expect a
microservice to work, and then show the data. Then what you can do is go
back to these other teams and say, “Hey, look how this is rocking and
look how happy this team is working.” I think for us it’s more or less
when you try to beat people over the head with a solution, they often
times get negative and they want to push back. If you can show them why
you want to use something and give them that sort of carrot, it becomes
a very different conversation to have.

JE: It’s also important to get viral adoption. So not just the
engineering systems team is presenting this, but you have the product
teams who are your dogfooders who are showing it to their friends and
colleagues. They’re the ones who encourage that cultural transition. We
just finished moving all of Bing over to Git. We were also on Source
Depot. We thought we could do it all in three months, but after three
months, we only had a few of the really eager teams mostly full of
college hires, new hires, who were pushing that culture on their own.
But once we reach that point, us giving the talks wasn’t being that
effective, but once the product teams were giving the talks on how it
changed their workflows, that’s when it really took off..

JP: Every single thing we try to do, from a Skype infra engineering
systems, we have this you have to pilot it with multiple teams and then
develop champions. For us, we’re in eight regional locations, right?
We’re global, truly. It’s not like, “Hey, we’re in one center and we
can bring a bunch of brown bags there. So we really pick our pilots and
our teams who will work with us side by side. Then from there, they
foster that site location education.

## Move to the Cloud
QUESTIONER 3: Hi. I want to talk a little bit about moving from kind of
your source code management on-prem up to the cloud. Particularly the
culture shift that had to happen there. I work at a financial services
company. I would say we’re probably on the spectrum of more risk-averse,
so we have code that we consider kind of our crown jewels. There’s a
discomfort in taking that outside of our firewall and moving up to the
cloud. I know Microsoft, you’re moving more towards open sourcing a lot
of your tools and your APIs, but you still have your own crown jewels,
Windows and other things like that. So could you talk a little bit about
what you had to do to shift the culture to get people more comfortable
with moving things outside of … or if that’s the case … Or what story
would you tell to companies that are uncomfortable with moving things
outside of their own firewall up to the cloud?

SG: Yeah. So how do you get people comfortable with moving from on-prem
to the cloud? Particularly in a highly regulated environment like
financial services.

MK: In Azure we’ve obviously got all these compliance requirements and
you know the cloud itself obviously is a center of a huge amount of
attack surface, right? So as long as you can break apart your code from
your certificates, secrets and the real stuff that actually can cause
problems, Microsoft and especially Azure have really embraced internal
open source. We’ve locked down the ability to contribute code via pull
requests to make sure that we actually have every single code change go
through a code review. Those kinds of things become inherent. You can
stitch up your release process so that you only release things that have
gone through these types of processes beforehand. It does take a certain
amount of trust in making sure your code doesn’t have anything that you
don’t want to share and ensuring that you move those pieces out into
other systems.

I mean, you don’t want to store secrets in your source code, you don’t
want to have secure encryption stuff in there, but the rest of it, you
really shouldn’t be able to touch your production instance with … Azure
has some pretty unique things in our engineering system in a sense that
we are an engineering system that uses Azure, but we also build Azure.
So what happens if Azure’s down? We also have invested in building
synchronous tools that bring Git back on-premise and it synchronizes
back, and also worked with bringing NuGet packages and packages
on-premise so that, hey, there’s a big problem going on and we can’t
access our engineering system that we built in the cloud. We now have
this system that at any given time, we can still build, and we can still
release. We’ve worked with a couple of external teams to actually do
something similar so they feel comfortable about getting into the cloud.
I’ll tell you something interesting. One of the employees that works
next to me the other day came over and said, “Hey, I need you to restart
this VM you created for me.” We looked it up. I created this VM in 2014
for this person in Azure. They had not restarted it or had any problems
with it since 2014. I think that organizations, even us, we have to get
comfortable trusting this whole service. …Over time you’ll find people
start to trust it, and they’ll start to get a feeling of how to use it.
When you realize you have all this tremendous scale and performance,
that carrot is really awesome. I mean, the simple fact that you can
start to leverage elastic scale, your customers start to focus on that
rather than these other pieces. Obviously secrets — don’t check those
in. That’s a huge piece that we do, but that is an aspect in terms of
Azure how we got there.

JE: From a Bing and Cortana point of view, all of our code is open for
all of our FTEs to see with the exception of some of our advertising
algorithms which are considered trade secrets. One of the nice things
about VSTS is that it gives us the ability to effectively tent or
constrain some of our repos in our code base so that just no random
person could take our ads algo and publish it on the internet to let
people start gaming the system.

TS: Yeah, that’s a cool point.

JP: That’s a good point. You can obtain certain things.

TS: You can’t apply ACL to parts of the repo. You either get access or
you don’t get access. What we do is we have separate repos for those
secret areas like DRM and stuff like that but only a subset of
individuals can actually get access to. I also encourage your management
team to understand the fact who else is actually embracing the cloud.
I’ll tell you Windows is a pretty big target. We are entirely in the
cloud. We have multinational countries coming after our source code.
We’re there. It’s pretty secure, so you should be fine.
Security, Governance, and Audit In The Cloud

QUESTIONER 4: Great. This question’s targeted to Mike a little bit. You
mentioned something really interesting earlier in your introduction
about some of the things you have to deal with from an organizational
perspective in the cloud, security, governance, audit, and all of that.
I find myself working a lot with organizations that are acquiring a lot
of startups. Plus, in many cases they have a very traditional and what I
would call monolithic development process and a strong-willed IT
organization. What are some of the techniques that you might suggest to
try and get people used to a security development life cycle for the
cloud when there’s a lot of demand by the product teams for agility?
MK: That’s a good question. We have this concept internally called the
pit of success. You just hope people fall in it and you’re successful,
right? I think one of the best things that we did was take some of the
standards that we believe in around how to create a repository, how to
set up branches, how to control how your source code gets into your
branches and make it a standardized process that people adopt like this.
We have an automated onboarding experience where people can run a tool
and they just run repo create. We went from I would think 1 or 200 repos
to 1200 repos before we blinked an eye. What we realized is that people
really don’t want to set these things up themselves. As long as you make
it easy to adopt these processes, governance can be handled in a way
where people can see it transparently, right? It’s kind of happening,
but they don’t realize it. I think once you give people too much control
and your team that says, “Hey, I’ve created a project for you in Visual
Studio and I’ve created a team. You guys would go crazy.” What are they
going to do with it? They’re going to create their repositories, give
access to service accounts. They’re going to create build definitions
that run anti-virus before they compile a code. We see all of this,
right?

So there’s a set of processes we have to do internally that really are
about automated onboarding, taking them through this entire experience
in a sort of governed workflow and telling people, “Yeah. We understand
you want to do stuff custom,” but use thing and you’ll find it really
easy to adopt and really easy to use. Then you don’t have to worry about
these other things. They’re kind of handled … I think that aspect of it
is provide a little bit of control where it’s needed, but try to own the
process end to end. Then when you go in front of auditors … I mean, I’m
in front of auditors what feels like every three weeks. We also go in
front of Scott Guthrie and others. They know when you’re using our
system that it meets these standards because we handle anti-virus, we
handle the way code signing works, we handle how the code gets into
production. That’s all a very tightly engineered government process, but
you have this with a carrot, which is in order to onboard, click this
button, you’ve got it. I think making that easy is probably the best way
to success that way.

JE: It’s especially important as we move towards microservices. We’ve
been moving from the tens to hundreds to now thousands of services which
are most of them want to go in their own repo. If we don’t have these
pipelines in place, they kind of spew all over the place, implementation
point of view.

MK: You did mention monolith, right? I’ll tell you … This is a fun
discussion in Azure because depending on who you talk to in Microsoft,
it’s almost a religious feeling about having code time dependency and
being able to have all your code together and build time, you know if
you’re failing or not, as opposed to having a very small repository that
just handles a microservice and you ship very quickly. I think that
architecture in certain areas where you’re dealing with the very core of
Azure, you’re dealing with drivers, and you’re dealing with hardware. It
makes sense to be a monolith. You want to know that this driver and
these dependencies, that they work together. As you start to go up a
layer on top of Azure and you stop building these APIs, version your
APIs, make your API a contract. That aspect of it is where we’re
definitely embracing microservices like crazy. I mean, we probably have
40 repos now that are about 1200 projects or larger and the rest of the
2,000 plus repos which are in use are one to two services. In Azure, you
kind of see it all. We have to take support from both because they are
both legitimate reasons.

TS: Another nice thing is that you can actually apply policies to the
code flow which would do things like, depending upon your business and
your business needs, you could do things like you could enforce code
reviews with more than one individual if you want to do that, to make
sure that the right information is always being verified before it hits
your repo.

JP: I’ll add one last thing just especially you’re going from monolith
to microservices. Taking from your question sort of that worry about how
do I ensure that this is fully secure. One of the big aha moments four
years ago I had with our compliance officer. We’re shipping bits into
O365, the whole thing. They’re like, “How can you do this? You can’t do
this.” I literally asked, “How many people on your ops team have
exposure to this code?”

MK: What’s an ops team? \[laughter\]

JP: Again, we were transitioning from development plus ops to a DevOps
role. As soon as I explained that the size of our microservice teams
running in DevOps were less than 10 people. Many times, actually five,
five to six. I said, “Now you have 200 ops guys and gals, they have
access. They have full access. Here’s who I have.” Then we started
talking through like what is the value of a CAB review, right? These
monthly … Do they really know? Are they the ones that are going to know?
Or instead you get that accountability at that tinier team. Just
hopefully that adds some value as well.

## Balance between Standardization and Independence
QUESTIONER 5: We’ve got about 600 developers in our company. All the
teams have varying degrees of CD maturity experience. My teams have the
higher level of experience there for deploying multiple times a week in
most cases to production. But we’re trying to bring the rest of the
enterprise into that. A lot of our success has been in kind of
standardizing the CD pipeline and providing all the tools that they
would need to do that. But now we’re trying to work with many teams that
have different types of applications, some monoliths, some
microservices. It’s tough to balance and standardize in an efficient way
of saying: Here’s these tools you can use versus the team saying, “Well,
that’s not how we do things. We need to do these other things.” We don’t
have the bandwidth to do everything they need, so how do you strike a
balance between providing standardized tools and allowing the teams to
build their own and make progress that way?

MK: We have this problem today. Microsoft is embracing OSS at a huge
rate. I mean, we’re getting more requests to support OSS than we are for
Windows, in many cases in Azure. When you look internally, Microsoft
typically have been built on Microsoft types of systems. Our team is
investing heavily in bringing Docker containers and container types of
systems into the engineering pipeline because once you can say you can
build in a container, I know that you got your source code from a
compliant place, and I know you got your packages from a compliant
place, do you really care how they build? Do you care what tools they
use to build? At this point, if you basically try to tell a team this is
how you have to work and these are the tools you have to do, you’re
always losing. That’s at least what we’ve learned. Even across Azure, we
have so many different types of architectures from iOS to Android to
Scala, and they want to use IoT, these are all things that we have to
support. They want to pick what they want to use. What we’re trying to
do is actually find a way to isolate their environment when they do
certain things, and then bring the governance and security between
those.

For example, you give them a place to compile and you know that that is
a locked down environment, they can do whatever they want in there. When
you pull the binaries off of that Docker container, virus-scan them,
code-sign them, run your SDL tools, upload them to the cloud, that’s
your compliance being handled without telling them how to build. I think
it’s about structuring your pipeline in such a way that you allow them
to handle certain pieces while maintaining governance over pieces you
need. That is something that I think we are working very hard with
Visual Studio, with the rest of the company, because Azure’s kind of
been piloting a lot of these things, and we are trying to bring that
across the organization and see if we can bring many of these things
externally. But it is one of those things that we need to stitch
together this whole thing. It goes back to that pit of success again,
allowing them to use what they want to use, but making sure that they
have the right governance where it needs to be.

TS: I think you’ve asked the toughest question for any company. We have
this too. We were talking about this before this event. It is horribly
difficult when everybody has organically over time built their own
systems, built their own solutions. Then you come along and go, you’ve
all got to throw all that away and you got to work the same way. I can’t
tell you if there is an easy solution to this. I would say that …
Everything you said I agree with. I think if you really want to benefit
from collaboration within your workforce, code sharing within your
workforce, movement of people around your workforce, you’ve got to find
some common ground.

I think that the great thing about the 1ES model is that that can
provide you with that common ground. You can make it, the common area,
as simple or as complex as you like. There’s also some very strong
extensibility models within it, so you can add extra capabilities to
forms or to your policies and processes. You maybe provide 80% of the
common area, but you give teams that flexibility to do the extra 20%
that meets their needs. But it does require, this is the tough thing,
some compromise. I think the way to do it is to really sell the
benefits, assuming those benefits are right for your organization. If
you want to pollinate and share and collaborate, then you have to do
this. It’s the only way forward.

QUESTIONER 5: Well, what kind of carrot, what kind of benefits have you
been describing to the team? “Hey, this is what you get when you use
this standardized system.”

JE: A few different things from a Bing point of view, lower DRI
\[Designated Responsible Individual or Live Site Engineer\] cost, so if
you’re on a CICD pipeline, your DRI’s don’t need to be manually checking
in any files and pushing out the bits themselves. The more frequently
you ship, the less bugs you run into. Because the things that hit
production, you don’t have a thousand changes that are backed up inside
of it. You also now get the experience where everybody’s on the same
pipeline, you have unified telemetry, and you can figure out when your
upstream dependencies have actually shipped, so you can ship a new
version of your product.

JP: I would add absolutely critical, this has been totally critical for
Skype, is the time to mitigate decreases. So a critical thing is what we
have built is literally our configuration service so that we’re rapidly
deploying. We’re watching near real-time monitoring, and we can
literally see this thing and roll it back in less than three minutes.
JE: We don’t have a concept of pushing a hot fix build out. We’ll either
roll forward or do a quick config check and flip it back immediately.
TS: I’d say the number one thing you’re going to benefit from is you
will save money by doing this. Because you right now have different
people in different teams building the same solution, it’s a complete
waste of time. You want to convince people, get the costs on that. Find
out how many people have built a pre-check-in validation solution that’s
different and they’re maintaining it. If you can provide one, you’re
going to save the business money. They’ll spend more time doing what’s
important than building pipelines and tooling and infrastructure.
JP: Our leadership actually purposely kept us very resource constrained.
It helped us actually make sure that we had to really figure out how to
build together, leverage each other.

MK: That was the plan.

JP: That was actually a plan. I’m now pushing back a little on that
plan, but it was a plan.

JE: Otherwise, yeah. Every product team has two release people on it,
right?

TS: I work in the engineering system team, so I go out, I interview all
these different teams, these product teams. It’s staggering how much
time we waste of building the same thing. They all go, “But I’m
different.” You’re really not that different. You’re really not that
different, so you got to make sure that as people build their extensions
that they share those extensions so other people can add to them or just
say, “Hey, that’s exactly what I want or I want that, but a little bit
different.” Do a pull request, add functionality. You’ll find that your
team … If they start collaborating on tooling, they’ll start
collaborating on product.

JE: Yeah. When we started the journey to get towards putting everything
into VSTS for release management, we had probably 900 different
PowerShell scripts that I found. If we’re doing 95% the exact same
thing, shipping bits out to Azure, it’s ridiculous.

## Role of Product Management
QUESTIONER 6: This is probably a softer skills question. As we try to
follow in the 1ES type of approach and do more collaboration, there
seems to be a tension developing between product management,
understanding what we’re going to ship, when we’re going to ship it, and
what are the engineers who are now cross pollinating? What are they
actually doing and want to do? How do you address that tension?

JP: Well, I can speak to that tension very well actually.

MK: This is where I duck out.

JP: For sure, in the last year, year and a half, and there’s more things
coming that will really resonate with you guys in the next 6 to 12
months that I can’t go into, but we have had a very high pressure on
feature development in the Skype organization, across all of our
products. Microsoft Teams is one great example that I can speak to.
Trying to make sure that we were balancing, actually getting what we
needed to do in terms of the engineering pipeline, while, at the same
time the team struggling with Microsoft Teams was very difficult.
Literally the hardest part, I would say in hindsight what we wish we
could have done better, was to give a little bit more lead time onto the
here’s what you need to do, here’s why you need to do it, especially
around the compliance security governance.

The challenges we were in, is that there’s a different compliance set of
requirements when you’re building the product on Azure, then for Azure
itself and their engineers. So when we’re building something for O365,
we had a whole different set of auditors, we had to take all the tools
that we could leverage from Azure, and then … We’re trying to do these
things at the same time. I don’t know that there’s any magic way to
reduce that tension, but I would say what I wish I could do is give more
of a lead time to the organization, then also really put it down to the
value, right? For us, at a point, I got to a place where I could
actually say this is the amount of dollars, this opens up, this is why
this is critical.

SG: Jen, could you just riff a little bit on how you’ve also been able
to provide data?

JP: Yeah. Actually, one of the big other pieces for the Skype
organization was a transition to sort of the data driven culture. We
started, again, five plus years ago. But with that it was around end to
end telemetry. So with Skype, you’ve got your client and you’ve got your
services, and how do you actually do not only near real time, but also
the post analysis because … I forgot to mention in the intro, but also a
big piece on Skype is our experimentation platform. We do client
experimentation, web experimentation, and service experimentation. It
doesn’t quite go to what you’re saying, but it’s a topic that we also
wanted to make sure that we hit. I don’t know where else to go, but I
will say that I can give one fact. These guys were much better at
bringing facts. Right now we do 30 billion events per day across all
Skype… That’s just for Azure services. Then we also have all of our
client telemetry, and then all of that’s going into our big backend
where we’re joining the data so that we can get that end to end view of
what’s happening. I can also talk offline, but I don’t know that I have
a magic pill for that feature, product manager and there isn’t. It’s
just a battle.

TS: The reality is we’re going through this as well. Microsoft is
evolving. You’re talking about cultural change. Culture, depending on
your organizational size, takes time. It’s like the Titanic slowly
moving away from an iceberg. You know what I mean? I think we’re making
good progress, but we still got a journey to go. I think it’s about
clear role and responsibility communication. Make sure people understand
what their roles are, and they collaborate well effectively. It’s not
like one person defining something and throwing it over a wall, it’s a
collaboration. Making sure that those are well understood, I think
that’s really important. Being data driven, being customer driven,
from a customer perspective, and being live-site-focus driven are three
things that we are really trying to emphasize in Microsoft at the
moment.

## Moving to Git from Centralized Version Control like TFVC
QUESTIONER 7: Yes. I’m actually intrigued because I’ve started using
Git, I don’t know, a couple of years ago since we kind of got to that
transition in 2012, but your organization like Microsoft generally was
on the Source Depot which was centralized. A lot of my customers are on
TFVC which is centralized as well. Moving to a distributed world with
Git, I’ve struggled with organization that have branches where they have
their whole application portfolio in one branch, that they’re actually
branching and keeping together and everything, which was pretty much the
pattern that we were telling people to do and use, like put everything
into one branch then do your other branch for whatever you’re doing,
feature branch or anything.

But I struggle explaining to them that when you’re going to Git, now
you’re going to have to do repos which are you have that big huge
branch that had 50 applications in it, now that becomes 50 repos, or
less, depending on if you want to put stuff together. How did Microsoft
go through that transition of saying how are we going from those
monolithic centralized repos to we’re going to do 1500? Because I keep
hearing you saying we have 50 of those or 1200 of whatever. How do you
go about saying this goes together and this doesn’t? That’s the struggle
to me when we’re transitioning people from a centralized world, TFVC or
other to a Git world where it’s much smaller.

JP: I’ll take it. If it’s okay with you guys I’ll take a stab at this
first because we definitely have most interestingly, we still have our
monolith, right? We definitely still have that. We will have reasons
that we will continue to have that. I’m coining this term, it’s probably
not accurate, but I want to say it’s like a mini monolith. Like I
mentioned, that client core library. I think what I’m starting to
resonate on, I haven’t had anyone verify that this is the accurate way
to think about it, but for me, since I think about time to mitigate and
rolling back, I think about when you want to have a Git repo and you
want to bring things together or when you have … Okay, I’m going to have
these five Git repos and that’s going to be my build at a time. It’s
about what are you versioning. What’s going to be the thing and what’s
that scope when you’re going to actually say, “That’s what I need to
roll back to fix it.”

JE: It’s the deployable artifact, yeah.

JP: That’s the right wording.

MK: I have a slightly separate opinion on that.

JP: I bet. This is where we’re all figuring it out.

MK: I think as developers write code, they get frustrated when they have
to move between repos. Sharing between repos can be kind of a challenge.
If you have a high touch between a common component and another
component, and they’re often changing, it would make sense to keep it
together. For us, there’s a very good option out there around NuGet
packages where you could have a repository producing NuGet packages,
publish it to a NuGet server or NPM, and consume it as an API. The
second you have a team that is going from a monolith to 50 repos, and
they’re now realizing that they’re touching that common component all
the time, and that’s affecting many others, 50 may not make sense. Five
many make sense. This is where it’s very highly dependent on the type of
product you’re building. It’s very highly dependent on how that
organization is kind of working. There’s not one size that fits all. You
have to embrace sort of that aspect which is you’re never going to get
it down to a repo per component, but obviously that’s the holy grail.

JP: That’s what we’re trying.

QUESTIONER 7: Who makes those decisions?

MK: The product team needs to. The second that you try to tell a product
team what do to here, they’re going to push back.

JP: I would say when you can’t have an architect as well.

QUESTIONER 7: I get that, but who on the team? Because to me it’s like
they’re saying, “We’re going to split it up in seven or five or …”

MK: Maybe they try seven …

JP: Then they learn.

JE: Yeah, adjust. It’s an inherent process.

MK: Then they just figure this out. Then they say, “Okay. It actually
makes sense as five.”

TS: You have to embrace the build-measure learn culture here. You’re
going to try something, you’re going to measure the success, and then
you’re going to go back and change it. The reality is we’re still
working on this. We’re still build-measure-learning. We will be for a
while.

JP: And no magic pill-

TS: There is no magic pill. Every team is different. I like what Mike
said, absolutely, this is sort of perception that full componentization
is the panacea. I see it whenever I go is the way we want to be. It’s
not always the case because then you end up with, okay, we got thousands
of different repos and different deliverables, and then you’re in
versioning hell. You got to find that balance. Every team, every company
is going to be slightly different. You know what? You might not get it
right the first time. You got to try and … I’d encourage you to find
some middle ground rather than go to one extreme or the other. Then
figure out where you want to make slight course adjustments.

QUESTIONER 7: Yeah. Because Brian talked about you guys trying
submodules and kind of backing out with the Git LF and all of that.
What’s your thoughts on submodules in Git?

MK: I’ll talk to that …

JE: We use them too.

MK: We regret in our organization not investing in submodules sooner. I
think there’s aspects to that that would have helped a significant
amount earlier on. Now we are starting to embrace it big time.
Submodules are scary to a lot of people. You know, you can get yourself
in trouble there, but it does solve a lot of problems. It doesn’t solve
everything. You have to pick it for a very specific types of things.
Submodules what we’re looking for is a way to bootstrap the tool set
within the repository, rather than saying I’m pulling all this code
together in one place. Because then how do you version your submodules,
how do you bring them in together and make sure they don’t have
problems? At least when we own the tool set and it’s our objective to
get that out in a compliant way, we can push submodule updates without
worrying about breaking anybody.

JE: Without needing to submit like 500 pull requests every single repo
and get those all accepted just to push the tool update.

Telemetry and Changes

JP: I think what in most critical here is that telemetry. In particular,
the thing that we’re still trying to get better at is how do you see all
the changes in your systems especially when you start to take changes… I
mean, the beauty of a monolith is you know what’s in that release. If
that release starts breaking, now the problem is how do you mitigate it
fast, right? That really kills you. But then how do you, across a very
diverse system, see that? I think that’s one of the areas-

TS: It’s a positive, negative. It’s both.

JP: Yeah, then add in experimentation and configuration. What we’re
doing right now is we’ve got all of our telemetry and we’re working
rapidly on trying to join the telemetry for every change to
production–the change to something that rolls out, the change because
there’s an experiment happening, and configuration changes, so that we
can actually then tie all that together and see point in time changes.
But boy, we’re not there. If anyone cracks that, we need it quick. It’s
an interesting area.

## How Do You Start with DevOps?
QUESTIONER 8: There’s so many pieces of continuous delivery, right? CI,
automated deployments, automated testing, how do you know where to
start? A lot of teams I see are just paralyzed not knowing where to
start. I think it’s important to focus and do one thing and get it
working and then move to the next thing. Have you found any kind of
universal order of things that seems to work or is it really a team by
team …

JP: I think telemetry is the first thing. If you don’t get the telemetry
right, everything, all bets are off. I’m sorry. If you cannot measure it
and you can’t see what’s actually happening in your system, the quality
for your customer first and foremost … I feel really … I don’t know that
I was the one that was in charge of making that decision, but I’m so
glad that whoever was the smart one that made that decision, because we
rely on that so heavily. Then I think it’s that quality piece and making
sure, okay, as we’re deploying, we can change. Again, because it’s about
the customer, right? You’re doing microservices or you’re doing anything
that’s a service. You’ve got to make sure that you’re hitting that
reliability number for your customer. From there, I think it depends on
the product. For us, what became a very big priority was figuring out
what we had to do within the pipeline to meet our compliance and
security requirements because we were going to be shipping as part of
the O365 contracts. It was going to be a long journey to get there.
That’s for us. Others may have a different …

TS: I’d also say that I’d encourage you to start at your weakest point
in the pipe. Analyze where you are today with your tooling. If you’re
doing something really well today, don’t start there because it’s
working really well. Go for the areas where you know that you have
opportunity for growth and improvement. Then you start to get people
buying into it and going, “Hey, this is so much better.” Then it’s
easier to go and change the one that everyone loves, right?

JP: Look for the low hanging fruit.

MK: In a more technical way, if you can own the entry point of where the
pull request starts into the continuous delivery and add value over
time, I think the aspect of allowing people to at least use build and
validate the pull request, at least go through that. Your value is going
to change over time. If you’re a governed type of organization, you may
be using a totally different test system in 12 months. You may be using
a totally different release system. But having that entry point of
access and being able to then stitch these things together is really the
critical piece. If you allow everybody to create their own entry point
and define how they start this thing, then you have no control of making
it better.

JE: Yeah, that was one of the major problems we had when we took over
our previous deployment orchestration technology is you could provide
bits from anywhere, we had no clue where they came from, how they were
built, etc. Rather than trying to say, “We’ll just take this thing and
we’ll let it shift it into VSTS,” we said, “No, you must start at the
beginning, move your pull request and CI pipeline first.” So then we
have a central inventory of all of the build artifacts. Then from there
we can start unifying the continuous delivery pipeline.

QUESTIONER 8: Start from your developer and work your way through.

JE: Start as early as possible and go right.

## Validating Quality
QUESTIONER 9: How do you validate the quality of new commits? What kind
of tests are you running? Static code analysis, those kind of stuff.
SG: What are the things we do to evaluate the quality of the code and
the pipeline?

MK: What we define is teams have to tell us how they test and how they
release. Obviously that’s not something we can define for them, but as
long as it’s part of your continuous delivery, you supply it a way where
they can automate these things. Every single pull request we do inside
of Azure runs unit testing automatically and teams can define their code
coverage levels. As an organization, you may be able to go in and say I
require 80% of code coverage to these kinds of things. From the
perspective of quality, it’s very difficult to tell how something’s
going to work just from unit testing. But then you have to also go on to
integration testing.

You have to go on to early stages of deployment and canary deployments
to actually tell what is the quality of this thing. It’s very different
depending on what team you’re dealing with. It’s very important that you
allow teams to define what that is and give them the right entry point
to do so. We have this analogy with our pipeline where we’re building
this 8-lane freeway and it’s about getting every team to do 60 miles an
hour and to make this happy path really good. We supply tools to do unit
testing and validation. If they want to do their own thing, we supply an
off-ramp where they can do their own thing, test their own way. Then
there’s an on-ramp back into our system here they can go forward. But it
is a highly dependent on the type of product.

TS: I got one as well.

SG: Tony, wait. I have to stop you. We’re at time. I need to say please
remember your eval. I think we will all be happy to keep going, but we
need to respect your time. If you want to step out, that’s great. If you
want to swarm us, that’s great too.

JP: Thank you.

|             |                           |
|-------------|---------------------------|
|![Image: Sam Guckenheimer, MSFT](_img/samgu-avatar.jpg)|Sam Guckenheimer works on Microsoft Visual Studio Cloud Services, including VS Team Services and Team Foundation Server. He acts as the chief customer advocate, responsible for strategy of the next releases of these products, focusing on DevOps. He has written four books on DevOps and Agile Software practices.|