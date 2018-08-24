# Common Lisp / Lisp / LISP / CL / clisp / (◔_◔) 

> whatever it is you're doing would be done better in LispLanguage. Why? Don't ask, they can't explain it to the rest of us. 

I'm re-learning clisp after being away from it since the early 90's. If you know what alife or strange attractors are, you'll instictively know why I was surrounded by robots, NiTi muscle wires, random electronic ittybits, and LISP! To add something to the community, I'll be pointing out a lot of Lisp programming gotcha's... especially where security is involved. Eventually this will culminate in a couple of projects I have in mind that are very LISPy in nature. Including one I started back then, but seemingly only now is of technical interest.

I interchange all the terms in the title, even if it pisses off certain overly-bespectacled nerds who talk some of the talk, but walk little of the walk. If you are at a point where different flavours matter, you still should be able to fully grok everything I ever write on the subject. Leave the religious naming crap for reddit. You won't appeal to my interests on that level. I originally learned from Allegro, so there is that... I just stick with clisp for now because I have occasionally used it since it started showing up in Linux distros. I'm not a fan of emacs, so you won't see anything about elisp here, and my only editor is vim and whatever vi-like editor is available. I'll eventually detail my vim and tmux configurations, but I am still polishing those up.

This is all pure Common Lisp, and I simply use clisp on my Raspberry Pi. It will surely work under any OS that even remotely looks and smells like Linux, and should work with little to no modification under anything that looks and smells like LISP. Except when I post my GPIO stuff which is rather rpi-centric. But it'll all be very documented anyway. I've been using clisp on my Mac, too, so... no excuses mmkay?

Everything is executed as a script. For example:  clisp 1.lisp

But read the code first.

> Once you get over the ugly parts, you can get actual work done -- even with Common Lisp.

I'll add stuff here that I think is good for learning the Lisp language, but not stuff that you find repeated everywhere else. That's just repetitive and boring. And repetative. I've scanned a LOT of the so-called tutorials out there, and moved on because it is clear you could fully understand the content, yet be utterly inept at writing something useful that works - the antithesis of what Lisp offers.

Don't expect anything practical here. It's just a few of the non-intuitive things I find, but seem to be missing from the tutorials and courses out there. Some of it is probably dead wrong.

# Crappy Resources

I shouldn't poopoo on other people's efforts without concrete examples. One of the worst "tutorials" I have seen yet is at [Tutorials Point](https://www.tutorialspoint.com/lisp/lisp_program_structure.htm). On the linked page, you get an executable example of how to convert Farenheit to Celsius. The code given is: 

```lisp
    (write(+ (* (/ 9 5) 60) 32))
```
Why is that an example of misleading amateurish crap? It appears legit until you try to convert less convenient temperatures like 61 degrees. The answer is a rather stupid looking 709/5. This is NOT "code for converting Fahrenheit temp of 60o F to the centigrade scale" no matter how you slice it. If they were aiming for simplicity, they should use a simpler example. Teaching bad code right at the start only leads to equally bad programmers.

There are a lot of ways to do this. But to avoid ugly inhuman /5 answers, you could just as easily do this:
    
```lisp
    (format t "~d" (ceiling (+ (* 1.8 61) 32)))
```

That still might not be optimal in the professional sense, but it is basic and produces usable output. (Also, why does everyone seem so attached to (/ 9 5) when it reolves to a simple, clean 1.8 anyway? Is there a *practical* use for /5 temperature notation?)

Really, if you can't even get that simple of an example right, you should *NOT* be writing a tutorial. Besides, there already are a million tutorials out there. If lisp is such a great language, why is 90% of the code out there derivative, or just plain terrible? If you are going to evangelize, try not to make it look so clumsy and ineffective.


# Best resource Evah!

June 30, 2018: I finally found a resource worth learning from. [Practical Common Lisp](http://gigamonkeys.com/book/index.html). Still am going to post snippets that contain common gotchas. Then I'll add the appropriate methods.

# The Filez

## [1.lisp](https://github.com/ksaj/clisp/blob/master/1.lisp)
Asks your name, then gives a friendly hello. Documents a bizarrely wide-spread Lisp coding flaw that can really mess up your day. I'll revisit this issue later, since my usual fix is probably superceded by something way more slick these days. Here you can see an example of how to exploit it in 90% of the tutorials out there (mainly because they are all passively reworded copies).

## [formatnil.md](https://github.com/ksaj/clisp/blob/master/formatnil.md)
Ever thought about (format nil "string")? I did, and had a lisp epiphany. Lispiphany? EDIT July 2, 2018 - I just discovered my initial thoughts were probably right, and some of the tutorials lead you astray on this subject. I'll be looking into this specifically, and updating it with the facts.

