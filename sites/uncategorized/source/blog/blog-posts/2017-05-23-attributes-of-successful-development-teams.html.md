---
title: 9 Attributes of successful development teams
author: Rebecca Dodd
author_twitter:
author_gitlab: rebecca
categories: culture
image_title: '/images/blogimages/attributes-successful-dev-teams.jpg'
description: What makes a good development team? Here's what we think.
cta_button_text: 'Check out our webcast, <strong>Managing the DevOps Culture Shift</strong>!'
cta_button_link: 'http://get.gitlab.com/managing-devops-culture-shift/'

---

Not all development teams work the same way, but there are some values, processes and attitudes that all successful teams share.

<!-- more -->

## 1. They automate everything

There’s no substitute for the work of the human brain, but by automating some of the more time-consuming (and sometimes tedious) aspects of a developer’s job, you not only free up time that could be spent on other, more creative tasks, but you ensure that your software development process is easily repeatable, and consistent every release cycle. “We have a big release every month,” says GitLab Platform Backend Lead, [Douwe Maan](/company/team/#DouweM), “but we have numerous patch releases. We have tons of scripts in our release tools repository that automate that so that we don’t miss little bits and so that it’s identical and reproducible every time.” Automation also means doing things like leveraging [continuous integration](/features/continuous-integration/) to run scripts, so a portion of your code review is taken over, offloading work that would otherwise be done manually.

## 2. They’re meticulous about documentation

“Documentation of processes and guidelines is a way of kind of scripting or automating your team’s behavior,” explains Douwe. Because we’re a distributed team, it’s important that if a question comes up often, that there’s somewhere people can find what they need without having to wait for team members in other time zones to come online and answer a question – this saves time not just for the person with the question, but for others who are spared answering the same questions over and over. “If people on my team have a certain question or things that are blocking them repeatedly, that probably means it’s something we should either document better or invent a process around,” says Douwe.

“As a consequence of that, for example, we have the process around getting merge requests and issues into a patch release when it’s a regression or security issue and so on. At one point we had so few people that we could just say, ‘Hey that needs to go into the patch release,’ but of course as the team grows, that doesn’t scale anymore, because you’d have 20 people asking one person. To address that we invented the process around labels, where we use labels and milestones very heavily in GitLab to signal to people what has to happen with an issue.”

## 3. They use collaboration tools

Having space for comments, questions or suggestions at each stage of the cycle is critical for fostering collaboration and making sure that everyone can follow the latest progress of a project. “For us, the single source of truth is always the [issue](/stages-devops-lifecycle/issueboard/). Tools like labels, milestones, assigning to people, these all make sure that the right person knows when it’s their turn to do something, and the handoff happens through issue comments,” explains Douwe. This is another area in which we’ve had to become disciplined about documenting the latest update on an issue, because as a distributed team we can’t just walk over to a colleague’s desk to check something. “We don’t have the problem where after two days people will be like, ‘Hmm, what did we decide again?’” says Douwe. Discussion takes place right in the same environment where we’re working – whether it’s a comment on an issue or a merge request or an inline question on the code itself – so it’s easy for everyone to see the context for it and to refer back to it later.

## 4. They use integrated platforms

Having all your software development tools in one environment reduces context-switching, tiresome maintenance when APIs change, and administrative complexity. It also makes the development process smoother, as an integrated tool often offers shortcuts within the UI that would not exist if you were using two separate products.

Douwe explains: “For a long time GitLab CI used to be a separately deployed web application: the UIs were not integrated in any way and they felt like separate products, as if they were not even made by the same company. At one point we decided to integrate it, and literally within one or two weeks we started seeing new possibilities of interlinking these applications. We’d think, ‘Hey, wouldn’t it be neat if we added a button to the latest status of this page?’ which previously is something we never would have thought about, because we really thought of the two as separate products that need to talk over an established channel, instead of just putting a link in everywhere where it would useful to have a link to CI. So with a built-in solution, the integration you get is not just tighter, it’s integrated in ways which other, separate products being developed by siloed development teams would never think of. We’re not just approaching it as an issue tracker, a code review tool or a CI tool, we’re seeing it as a development environment.”

## 5. They version control everything

Using [version control](/topics/version-control/) for source code is widely accepted as a good idea, but it’s useful for a number of other purposes too. Take documentation, for example: if you use a wiki, there is no concept of a merge request. “There’s no way of suggesting an improvement without immediately making it,” says Douwe, “so what that means is that in a lot of places that use a wiki, changing it is kind of scary.” This creates a feeling that suggesting updates or improvements is for senior team members only, and discourages participation and collaboration on the documentation. "Using source control here means that even the most junior person who’s like, ‘Hmm, I spotted a typo here,’ or ‘Hey, this wasn’t super clear, let’s do it like this,’ won’t be hesitant to bring up that suggestion." Having time to write a merge request that clearly outlines the advantages of what they're proposing makes it less intimidating to suggest a change. "It really makes the documentation, similar to the source code, an open source and living document that everyone can contribute to." The same principle applies to things like your CI/CD configuration, tests, and infrastructure code.

Improved collaboration and learning opportunities aren’t the only benefits of using version control for things beyond your source code: the ability to roll back in the event of something breaking, and to pinpoint where a bug was introduced are advantages both in that it’s easier to fix something, but also in that team members feel freer to experiment without the fear of causing irreparable damage if something breaks.

## 6. They make it easy for everyone to contribute

By opening up your development platform, other team members can discover, contribute to and learn from other team members’ work. “If you hide your CI configuration in an area that can only be accessed by the masters of the project, that means that very few developers on the team and especially very few developers on other teams will ever see that config,” says Douwe. “You really shouldn’t see your code as just a product of your team, you should also see it as a resource for everyone else in the company. If you ask a developer how they learned to code, most of them will not mention university or this book that they read, most of them will mention ‘code I read that was written by people who have more experience than me.’ So by giving them access to as much code as you can, that will actually make them better coders than if you have them work in a silo.”

> If you ask a developer how they learned to code, most of them will not mention university or this book that they read, most of them will mention "code I read that was written by people who have more experience than me."

This isn’t just about less experienced developers learning from more experienced developers. Sometimes a fresh perspective from someone who isn’t as close to a project can spark solutions that aren’t apparent when you’ve been deep inside the code for a week. “Like if someone reads code and they ask a question like ‘Hey, what’s the reasoning behind this? I just found your code and I was wondering…’ it enables a conversation.” Douwe explains. “It helps us avoid [Not Invented Here syndrome](https://en.wikipedia.org/wiki/Not_invented_here).” Someone from another team might have already done work you require on a previous project of theirs – why not use it on your team? “It’s working together to make all of our code better, because if we use a shared library – even if it’s just a company internal one, like innersourcing – if one person improves it or fixes a bug or increases the functionality of that application, that’s work by one person that will immediately affect all the different teams.”

## 7. They spend time on side projects

“We don’t have explicit [20 percent time](https://googleblog.blogspot.co.uk/2006/05/googles-20-percent-time-in-action.html),” says Douwe, “but at GitLab, as we are working on improving the same platform we use to do all our work, our job is to make our own job easier. Which means that even if something is not scheduled for this release, if it’s something that you think you can get done in couple hours, and it would save you more than a couple hours in the future, just do it.”

Sometimes going through the formal process for approving time to work on a new feature just isn’t necessary. “Unless you have something urgent you should be working on, it really helps to ask developers to feel responsible for the product, and also own the product in the sense that they can also suggest new features, and even spearhead the development of them without going through product management for example,” says Douwe.

## 8. They make code review collaborative

Having your work reviewed can feel like a personal judgement on whether you’re good enough or not. When code review is about “This is wrong, change it to this,” it can be really demotivating. Douwe explains: “A much better way, even if it seems like something is obviously wrong, would be to ask, ‘What do you think about changing to this/Did you consider X, Y, Z/I suggest changing it to this, if you think that makes sense.’ The communication there really helps and it also means that people don’t feel review is the time where they as person are being told if their work is good enough, if they are good enough, it’s really just talking about the actual code, the implementation, the best way to solve a problem.” Everyone on a team is free to review each other’s code or to ask for a review, so it becomes about just improving the merge request instead of passing a judgement about that person’s work. “If review feels like something that’s just done by the higher-up people and it’s a time when your code is deemed perfect or not, it might feel kind of scary to review someone’s code, especially if that someone is more experienced than you or has more experience in this area of the application. What really helps with collaboration is having everyone feel free to question each other’s code or question, ‘Is this the best way to go about this?’ without saying ‘This is wrong.’”

## 9. They’re allowed to be creative

Problem solving is what developers do. So if a customer has a request for some feature that they would find useful, it can be helpful to ask the team to solve the problem the customer is experiencing, rather than presenting them with a spec which might not be the optimal solution. “In a lot of cases developers are aware of solutions either that already exist within the codebase or that exist in other people’s codebases because of innersourcing, or they might even have just read about this cool, open source tool, which a product manager might not be aware of,” says Douwe. “So allowing developers to be really critical of the proposal and having product managers not be too rigid in their specs also gives you better code and makes for happier developers.” This can also help you to build features that don’t just address one particular customer’s problem and fix it the way they would like, but rather work on solutions that can be useful to everyone.

To learn more about what makes development teams successful today, watch our webcast, "[Managing the DevOps Culture Shift](http://get.gitlab.com/managing-devops-culture-shift/)" on demand.
{: .alert .alert-gitlab-orange}  
