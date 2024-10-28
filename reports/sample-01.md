Sending emails (via HackerOne) impersonating other users


Hello,
This was a very weird behavior that I observed and I am not sure exactly what is causing this but I trust you guys to dig into this more.
So, basically in a sandboxed program, when I set a trigger for an auto-response, I am getting emails from the HackerOne platform as a user who has no relationship with that program. 
Check the screenshot attached. 

I basically created multiple accounts on the H1 platform. I then created test programs (Sandboxed) for each one of those accounts. You can see them in the [] brackets in the screenshot. 

I then set triggers for each of these programs to send an auto response on submission of a vulnerability. I then went ahead and submitted vulns to each one of these programs. 
As a result, I got an email from the HackerOne platform (notice via HackerOne in the screenshot). But, it looks like each one of these programs picked up some random HackerOne users to send those emails as. 
Notice the handles testingfak17, testingfak07, testingfak96, saveriolico in the screenshot.

I checked and these appear to be valid HackerOne user handles. These handles have nothing to do with my accounts or the program accounts. So, 
I am not sure why this is happening?

Impact:
- Firstly, This makes me believe that my user handle can also be picked anytime to send emails as from the H1 platform. Obviously, I wouldn't want that. 
- Secondly, I can set a user account with an expletive word or so. Currently, there are many user accounts with expletives in their username so I believe that's possible and you guys dont really ban them. So, when someone tries to test their sandboxed program, they might get an email from my user handle via the HackerOne platform which contains an expletive. Obviously, neither you guys nor the program owners wouldn't want to see something like that. 

    1 attachment:
    F79294: Screen_Shot_2016-03-16_at_5.48.09_PM.png