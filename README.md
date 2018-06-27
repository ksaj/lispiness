# clisp
I'm re-learning clisp after being away from it since the early 90's. To add something to the community, I'll be pointing out a lot of the Gotcha's... especially where security is involved. Eventually this will culminate in a couple of projects I have in mind that are very LISPy in nature.

This is all pure Common Lisp, and I simply use clisp on my Raspberry Pi. It will surely work under any OS that even remotely looks and smells like Linux, and should work with little to no modification under anything that looks and smells like LISP. Except when I get into GPIO, but it'll all be very documented anyway. I've been using clisp on my Mac, too, so... no excuses mmkay?

Everything is executed as a script. For example:  clisp 1.lisp

But read the code first. Truly. Yeesh.

## 1.lisp
Asks your name, then gives a friendly hello. Also documents a bizarrely wide-spread coding flaw that can really mess up your day. I'll revisit this issue later, since my usual fix is probably superceded by something way more slick these days.
