# Platform-Specific Lisp

Since I have clisp on a Mac as well as on my Raspberry Pis, I'll demonstrate code with platform-specific output separately for easy comparison. These should probably work for all Common Lisp flavours, but just in case, I use clisp. I have other Lisps installed on the Raspberry Pis, so at some point, I might try each of them to see if there are any notable differences.

Some of these are probably useful in a forensic evaluation, and more generally in running code that needs to behave differently on different types of computers or other scenerios. I'll also be adding stuff for Raspberry Pi lights, gpio, and onboard devices and maybe even some HATs.

## (machine-instance), (machine-version), and (machine-type)

I found these 3 functions by perusing the Hyperspec. Great way to learn your way around the language.

Here are the **machine-\*** functions for the Raspberry Pi:

```lisp
[1]> (machine-instance)
"livingroom-pi [127.0.1.1]"
[2]> (machine-version)
"ARMV7L"
[3]> (machine-type)
"ARMV7L"
[4]>
```

And the same commands run on the Mac:

```lisp
[1]> (machine-instance)
"ksaj-desktop.local"
[2]> (machine-type)
"X86_64"
[3]> (machine-version)
"X86_64"
[4]>
```

So, for now I don't know if some systems would report different information for **machine-type** and **machine-version**, but I assume there must be some that do.

## .
