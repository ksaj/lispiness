# System Info of a Forensic Nature

These Lisp commands are pretty neat. Since I hace clisp on a Mac as well as on my Raspberry Pis, I'll demonstrate code with platform-specific output separately for easy comparison.

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
"penetrationtest.corp"
[2]> (machine-type)
"X86_64"
[3]> (machine-version)
"X86_64"
[4]>
```

So, for now I don't know if some systems would report different information for **machine-type** and **machine-version**, but I assume there must be some that do.

