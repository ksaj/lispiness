# Common Lisp / Lisp / LISP / CL / clisp / (◔_◔) 

> whatever it is you're doing would be done better in LispLanguage. Why? Don't ask, they can't explain it to the rest of us. 

I'm re-learning clisp after being away from it since the early 90's. If you know what alife or strange attractors are, you'll instictively get what I was up to while surrounded by robots and other electronic ittybits. To add something to the community, I'll be pointing out a lot of the Gotcha's... especially where security is involved. Eventually this will culminate in a couple of projects I have in mind that are very LISPy in nature. Including one I started back then, but seemingly only now is of technical interest.

I interchange all the terms in the title, even if it pisses off certain overly-bespectacled nerds who talk some of the talk, but walk little of the walk. If you are at a point where different flavours matter, you still should be able to fully grok everything I ever write on the subject. Leave the religious naming crap for reddit. You won't appeal to my interests on that level.

This is all pure Common Lisp, and I simply use clisp on my Raspberry Pi. It will surely work under any OS that even remotely looks and smells like Linux, and should work with little to no modification under anything that looks and smells like LISP. Except when I get into GPIO stuff which is probably rpi-specific. But it'll all be very documented anyway. I've been using clisp on my Mac, too, so... no excuses mmkay?

Everything is executed as a script. For example:  clisp 1.lisp

But read the code first. Truly. Yeesh.

I'll add stuff here that I think is good for learning the Lisp language, but not stuff that you find repeated everywhere else. That's just repetitive and boring. And repetative. I don't know why there are [500 "tutorials" with exactly the same content](http://wiki.c2.com/?SmugLispWeenie), yet so little genuinely usable Lisp content out there that didn't originate from black-and-white television days. Shameful really. It's like learning violin just so you can teach violin while preaching the violin's many sonic wonders, yet never getting around to actually presenting your own knowledge and skill unless blatantly echoing the previous 499 people you are clearly copying. It doesn't make for a very compelling argument for Lisp's utility at all. No wonder people keep tuning out. And have I mentioned how repetitive that mentality is?

That's enough of my bitching. This isn't yet another nauseatingly familiar tutorial. Hopefully as this list of snippets grows, it'll be more useful than that. It's really just a reposistory of the code I write as I relearn this great language, minus the crap that has already been said a brazillion times already, every time someone newly discovers Lisp. Use this in combination with whatever tutorial you choose to learn from, as a way to learning how to create genuinely useable code without making the same mistakes that have propogated this no-show know-it-all history of "hackers" pretending they understand how powerful the language is, yet only able to regurgitate the same old aimless "tutorials." <i>Gah!</h>

## [1.lisp](https://github.com/ksaj/clisp/blob/master/1.lisp)
Asks your name, then gives a friendly hello. Documents a bizarrely wide-spread Lisp coding flaw that can really mess up your day. I'll revisit this issue later, since my usual fix is probably superceded by something way more slick these days. Here you can see an example of how to exploit it in 90% of the tutorials out there (mainly because they are all passively reworded copies).
