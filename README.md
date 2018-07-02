# Common Lisp / Lisp / LISP / CL / clisp / (◔_◔) 

> whatever it is you're doing would be done better in LispLanguage. Why? Don't ask, they can't explain it to the rest of us. 

I'm re-learning clisp after being away from it since the early 90's. If you know what alife or strange attractors are, you'll instictively know why I was surrounded by robots, NiTi muscle wires, random electronic ittybits, and LISP! To add something to the community, I'll be pointing out a lot of Lisp programming gotcha's... especially where security is involved. Eventually this will culminate in a couple of projects I have in mind that are very LISPy in nature. Including one I started back then, but seemingly only now is of technical interest.

I interchange all the terms in the title, even if it pisses off certain overly-bespectacled nerds who talk some of the talk, but walk little of the walk. If you are at a point where different flavours matter, you still should be able to fully grok everything I ever write on the subject. Leave the religious naming crap for reddit. You won't appeal to my interests on that level.

This is all pure Common Lisp, and I simply use clisp on my Raspberry Pi. It will surely work under any OS that even remotely looks and smells like Linux, and should work with little to no modification under anything that looks and smells like LISP. Except when I post my GPIO stuff which is rather rpi-centric. But it'll all be very documented anyway. I've been using clisp on my Mac, too, so... no excuses mmkay?

Everything is executed as a script. For example:  clisp 1.lisp

But read the code first. Truly. Yeesh.

> Once you get over the ugly parts, you can get actual work done -- even with Common Lisp.

I'll add stuff here that I think is good for learning the Lisp language, but not stuff that you find repeated everywhere else. That's just repetitive and boring. And repetative. I've scanned a LOT of the so-called tutorials out there, and moved on because it is clear you could fully understand the content, yet be utterly inept at writing something useful that works - the antithesis of what Lisp offers.

Don't expect anything practical here. It's just a few of the non-intuitive things I find, but seem to be missing from the tutorials and courses out there. Some of it is probably dead wrong.

# Best resource Evah!

June 30, 2018: I finally found a resource worth learning from. [Practical Common Lisp](http://gigamonkeys.com/book/index.html). Still am going to post snippets that contain common gotchas. Then I'll add the appropriate methods.

July 2, 2018: Just finished chapter 3 (out of 33). It took 2 long days. Still learned more than I already knew, and covered more than any of the tutorials I've seen out there. My brain is melting. I'm going to have to redo and expand on my formatnil.md, because even after a Lispiphany, this chapter has pointed out how much more about even that one command I have yet to grok.

## [1.lisp](https://github.com/ksaj/clisp/blob/master/1.lisp)
Asks your name, then gives a friendly hello. Documents a bizarrely wide-spread Lisp coding flaw that can really mess up your day. I'll revisit this issue later, since my usual fix is probably superceded by something way more slick these days. Here you can see an example of how to exploit it in 90% of the tutorials out there (mainly because they are all passively reworded copies).

## [formatnil.md](https://github.com/ksaj/clisp/blob/master/formatnil.md)
Ever thought about (format nil "string")? I did, and had a lisp epiphany. Lispiphany? EDIT July 2, 2018 - I just discovered my initial thoughts were probably right, and some of the tutorials lead you astray on this subject. I'll be looking into this specifically, and updating it with the facts.

# 
#### PS: I am almost nearly kidding with my rant. Lisp is surely a great language. But so far, everyone seems stuck at Eliza and the ubiquitous tutorial. I'm just as sardonic about the state of Lisp in the world as every other cynical Lisper out there. Entertain me...
