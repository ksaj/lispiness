# Common Lisp / Lisp / LISP / CL / clisp / (◔_◔) 

> whatever it is you're doing would be done better in LispLanguage. Why? Don't ask, they can't explain it to the rest of us. 

I'm re-learning clisp after being away from it since the early 90's. If you know what alife or strange attractors are, you'll instictively know why I was surrounded by robots, NiTi muscle wires, random electronic ittybits, and LISP! To add something to the community, I'll be pointing out a lot of Lisp programming gotcha's... especially where security is involved. Eventually this will culminate in a couple of projects I have in mind that are very LISPy in nature. Including one I started back then, but seemingly only now is of technical interest.

I interchange all the terms in the title, even if it pisses off certain overly-bespectacled nerds who talk some of the talk, but walk little of the walk. If you are at a point where different flavours matter, you still should be able to fully grok everything I ever write on the subject. Leave the religious naming crap for reddit. You won't appeal to my interests on that level. I originally learned from Allegro, so there is that... I just stick with clisp for now because I have occasionally used it since it started showing up in Linux distros. I'm not a fan of emacs, so you won't see anything about elisp here, and my only editor is vim and whatever vi-like editor is available. I'll eventually detail my vim and tmux configurations, but I am still polishing those up.

This is all pure Common Lisp, and I simply use clisp on my Raspberry Pi. It will surely work under any OS that even remotely looks and smells like Linux, and should work with little to no modification under anything that looks and smells like LISP. Except when I post my GPIO stuff which is rather rpi-centric. But it'll all be very documented anyway. I've been using clisp on my Mac, too, so... no excuses mmkay?

> Once you get over the ugly parts, you can get actual work done -- even with Common Lisp.

I'll add stuff here that I think is good for learning the Lisp language, but not stuff that you find repeated everywhere else. That's just repetitive and boring. And repetative. I've scanned a LOT of the so-called tutorials out there, and moved on because it is clear you could fully understand the content, yet be utterly inept at writing something useful that works - the antithesis to what Lisp has to offer.

Don't expect anything practical here. It's just a few of the non-intuitive things I find, but seem to be missing from the tutorials and courses out there. Some of it is probably dead wrong. But that is part of learning, and of course I'll update and explain the bits I got wrong, too.

# Crappy Resources

I shouldn't poopoo on other people's efforts without concrete examples. One of the worst "tutorials" I have seen yet is at [Tutorials Point](https://www.tutorialspoint.com/lisp/lisp_program_structure.htm). On the linked page, you get an executable example of how to convert Farenheit to Celsius. The code given is: 

```lisp
    (write(+ (* (/ 9 5) 60) 32))
```
What makes that an example of misleading amateurish crap? It appears to new Lispers that it works until you try to convert less convenient temperatures like 61 degrees. The answer is a rather stupid looking 709/5. This is NOT "code for converting Fahrenheit temp of 60o F to the centigrade scale" no matter how you slice it. If they were aiming for simplicity, they should use a simpler example. Teaching bad code right at the start only leads to equally bad programmers. The author spent far too much time finding a number to convert that would produce clean output. No human thinks of temperature in terms of its divisibility by 5, so why use it as your example?

There are a lot of ways to do this. But to avoid ugly inhuman /5 answers, you could just as easily do this:
    
```lisp
    (format t "~d" (ceiling (+ (* 1.8 61) 32)))
```

That still might not be optimal in the professional sense, but it is basic and produces human-friendly output. (Also, why does everyone seem so attached to (/ 9 5) when it resolves to a simple, clean 1.8 anyway? Is there a *practical* use for /5 temperature notation?)

On another page, the author says:

    * LISP represents a function call f(x) as (f x), for example cos(45) is written as cos 45
    
The author literally forgot the segment is about how parens are used, producing examples that don't even work. Try this and the example will work as the reader should expect:

    * LISP represents a function call f(x) as (f x). For example, cos(45) is written as (cos 45).
    
Likewise, the author teaches that Lisp source files and compiled Lisp are the same thing. I didn't manage to read enough of his drivel to see what he thinks about the compile and compile-file functions. It would be easy to go on and on with examples showing how utterly inane the Tutorials Point Lisp tutorial is - is **NILL** *really* a data type? - but you probably already have heard enough to avoid the site entirely.

Really, if you can't even get these simple examples (as well as English punctuation and basic sentence structure) right, you should *NOT* be writing tutorials. Besides, there already are a million similarly poor (and occasionally good) tutorials freely available online. If lisp is such a great language, why is 90% of the code out there derivative, or just plain terrible? If you are going to evangelize, try not to make it look so clumsy and ineffective. This "tutorial" adds nothing but maybe a little confusion to the world.

Most concerning is that this is pretty much on par with most of the other "tutorials" I've found. Lisp will always be the underdog when the supposed mentors produce such shite.

# Best resource Evah!

June 30, 2018: I finally found a resource worth learning from. [Practical Common Lisp](http://gigamonkeys.com/book/index.html). Still am going to post snippets that contain common gotchas. Then I'll add the appropriate methods.

Sept 13, 2018: I'm not a gamer or a game developer, but I learned quite a lot from this article: https://all-things-andy-gavin.com/2011/03/12/making-crash-bandicoot-gool-part-9/. This also gives lots of arguments of why C and C++ aren't always up to the job. I really like how easy his GOOL is to read.

# CLFSWM

Oct 21, 2018: I just installed the Common Lisp Full Screen Window Manager on a Raspberry Pi. It is more complicated than other GUIs, but I did manage to figure out quite a lot just by menu surfing. Sometimes I end up locking myself onto a particular full-screen frame, but eventually I'll figure out how to get out properly. I will say that once it is loaded, swithing between apps is blazingly fast.

Once I've obtained a little more skill using it, I'll write an article about why I wanted to install a Lisp desktop, and any of the particular pros and cons.

