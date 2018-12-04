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

## (room t), (room nil) and (room :default)

The (room) function returns a list of items relating to internal storage. It can be invoked as (room) or (room :default) which shows the following on my Mac:

```lisp
[1]> (room :default)

Number of garbage collections:                1
Bytes freed by GC:                      793,456
Time spent in GC:                      0.006941 sec
Bytes permanently allocated:            171,840
Bytes currently in use:               3,524,856
Bytes available until next GC:          545,646
3524856 ;
545646 ;
171840 ;
1 ;
793456 ;
6941
[2]>
```

There is a "shorter" view, which looks like this on the Mac:

```lisp
[2]> (room nil)

Bytes permanently allocated:            171,840
Bytes currently in use:               3,787,416
Bytes available until next GC:          283,086
3787416 ;
283086 ;
171840 ;
1 ;
793456 ;
6941
[3]>
```

Finally, there is a super-long informative view that looks like this on the Mac:

```lisp
[3]> (room t)
Class                                                                      # Instances  Size (bytes)  Average size
-----                                                                      -----------  ------------  ------------
CONS                                                                          67967       1087472         16.000
SIMPLE-STRING                                                                 11987        528216         44.066
SYMBOL                                                                         8046        514944         64.000
SIMPLE-VECTOR                                                                  2553        388432        152.147
FUNCTION                                                                       3985        335832         84.274
SIMPLE-8BIT-VECTOR                                                             3505        299624         85.485
HASH-TABLE                                                                      575         69000        120.000
SYSTEM-FUNCTION                                                                1064         59584         56.000
STANDARD-EFFECTIVE-SLOT-DEFINITION                                              523         58576        112.000
BIGNUM                                                                         2066         49600         24.008
STANDARD-METHOD                                                                 382         42784        112.000
STREAM                                                                          271         39216        144.708
STANDARD-CLASS                                                                  115         27600        240.000
CLOS::STRUCTURE-EFFECTIVE-SLOT-DEFINITION                                       227         27240        120.000
STRING-STREAM                                                                   182         25040        137.582
STANDARD-GENERIC-FUNCTION                                                       170         23120        136.000
CLOS::STRUCTURE-DIRECT-SLOT-DEFINITION                                          227         19976         88.000
SYSTEM::INTERNAL-WEAK-HASHED-ALIST                                               25         19608        784.320
STRING                                                                          453         18120         40.000
SYSTEM::INTERNAL-WEAK-LIST                                                      242         11888         49.124
SYSTEM::CONTROL-STRING-DIRECTIVE                                                133         11704         88.000
ENCODING                                                                        108         11232        104.000
STANDARD-DIRECT-SLOT-DEFINITION                                                 120         10560         88.000
WEAK-LIST                                                                       242          5808         24.000
STRUCTURE-CLASS                                                                  25          5800        232.000
SYSTEM::MACRO                                                                   180          5760         32.000
BUILT-IN-CLASS                                                                   33          5016        152.000
PATHNAME                                                                        102          4896         48.000
DOUBLE-FLOAT                                                                    187          4488         24.000
STANDARD-READER-METHOD                                                           19          2280        120.000
EQL-SPECIALIZER                                                                  46          2208         48.000
CONCATENATED-STREAM                                                              15          2160        144.000
SPECIAL-OPERATOR                                                                 40          1600         40.000
PACKAGE                                                                          18          1584         88.000
METHOD-COMBINATION                                                               10          1280        128.000
FILE-STREAM                                                                       4          1264        316.000
RESTART                                                                          14          1120         80.000
SYNONYM-STREAM                                                                    6           816        136.000
FUNCALLABLE-STANDARD-CLASS                                                        3           720        240.000
LONG-FLOAT                                                                       10           488         48.800
TWO-WAY-STREAM                                                                    3           432        144.000
BROADCAST-STREAM                                                                  3           408        136.000
SINGLE-FLOAT                                                                     16           384         24.000
LOGICAL-PATHNAME                                                                  5           280         56.000
RATIO                                                                             7           224         32.000
FILL-STREAM                                                                       2           224        112.000
SYMBOL-MACRO                                                                      9           216         24.000
GLOBAL-SYMBOL-MACRO                                                               9           216         24.000
BYTE                                                                              6           192         32.000
ECHO-STREAM                                                                       1           144        144.000
READTABLE                                                                         3           120         40.000
8BIT-VECTOR                                                                       2            80         40.000
SYSTEM::SIMPLE-PROGRAM-ERROR                                                      2            80         40.000
NULL                                                                              1            64         64.000
SIMPLE-BIT-VECTOR                                                                 3            56         18.667
SIMPLE-ARRAY                                                                      1            40         40.000
COMPLEX                                                                           1            32         32.000
RANDOM-STATE                                                                      1            24         24.000
-----                                                                      -----------  ------------  ------------
Total                                                                        105955       3729872         35.202

Number of garbage collections:                1
Bytes freed by GC:                      793,456
Time spent in GC:                      0.006941 sec
Bytes permanently allocated:            171,840
Bytes currently in use:               3,558,032
Bytes available until next GC:          512,470
3558032 ;
512470 ;
171840 ;
1 ;
793456 ;
6941
[4]>
```

Also, of course running **(room)** without an argument is equivalent to **(room :default)**. Here are the results from running these on a Raspberry Pi.

```lisp
[1]> (room nil)

Bytes permanently allocated:             90,368
Bytes currently in use:               1,957,276
Bytes available until next GC:          472,908
1957276 ;
472908 ;
90368 ;
0 ;
0 ;
0
[2]> (room :default)

Number of garbage collections:                0
Bytes freed by GC:                            0
Time spent in GC:                           0.0 sec
Bytes permanently allocated:             90,368
Bytes currently in use:               1,964,608
Bytes available until next GC:          465,576
1964608 ;
465576 ;
90368 ;
0 ;
0 ;
0
[3]> (room t)
Class                                   # Instances  Size (bytes)  Average size
-----                                   -----------  ------------  ------------
CONS                                       66422        531376          8.000
SIMPLE-STRING                              11943        411280         34.437
SIMPLE-8BIT-VECTOR                          3528        280496         79.506
SYMBOL                                      8104        259328         32.000
SIMPLE-VECTOR                               2428        190820         78.591
FUNCTION                                    3945        166712         42.259
HASH-TABLE                                   575         34500         60.000
SYSTEM-FUNCTION                             1066         34112         32.000
STANDARD-EFFECTIVE-SLOT-DEFINITION           523         29288         56.000
STANDARD-METHOD                              382         21392         56.000
STANDARD-CLASS                               115         13800        120.000
CLOS::STRUCTURE-EFFECTIVE-SLOT-DEFINITION      227         13620         60.000
STANDARD-GENERIC-FUNCTION                    170         11560         68.000
CLOS::STRUCTURE-DIRECT-SLOT-DEFINITION       227          9988         44.000
SYSTEM::INTERNAL-WEAK-HASHED-ALIST            25          9804        392.160
SYSTEM::INTERNAL-WEAK-LIST                   242          5944         24.562
ENCODING                                     104          5824         56.000
STANDARD-DIRECT-SLOT-DEFINITION              120          5280         44.000
PATHNAME                                     163          3912         24.000
WEAK-LIST                                    242          2904         12.000
STRUCTURE-CLASS                               25          2900        116.000
SYSTEM::MACRO                                180          2880         16.000
BUILT-IN-CLASS                                33          2508         76.000
STREAM                                        25          2040         81.600
SYSTEM::CONTROL-STRING-DIRECTIVE              31          1364         44.000
STRING-STREAM                                 19          1340         70.526
STANDARD-READER-METHOD                        19          1140         60.000
EQL-SPECIALIZER                               46          1104         24.000
STRING                                        45          1084         24.089
FILE-STREAM                                    5           944        188.800
SPECIAL-OPERATOR                              40           800         20.000
PACKAGE                                       18           792         44.000
METHOD-COMBINATION                            10           640         64.000
CONCATENATED-STREAM                            7           504         72.000
LONG-FLOAT                                    10           448         44.800
FUNCALLABLE-STANDARD-CLASS                     3           360        120.000
SYNONYM-STREAM                                 4           272         68.000
TWO-WAY-STREAM                                 3           216         72.000
BROADCAST-STREAM                               3           204         68.000
BIGNUM                                        11           180         16.364
DOUBLE-FLOAT                                  10           160         16.000
RESTART                                        4           160         40.000
LOGICAL-PATHNAME                               5           140         28.000
SINGLE-FLOAT                                  11           132         12.000
SYMBOL-MACRO                                   9           108         12.000
GLOBAL-SYMBOL-MACRO                            9           108         12.000
BYTE                                           6            96         16.000
ECHO-STREAM                                    1            72         72.000
READTABLE                                      3            60         20.000
8BIT-VECTOR                                    2            48         24.000
NULL                                           1            32         32.000
RATIO                                          2            32         16.000
SIMPLE-BIT-VECTOR                              2            24         12.000
SIMPLE-ARRAY                                   1            24         24.000
COMPLEX                                        1            16         16.000
RANDOM-STATE                                   1            12         12.000
-----                                   -----------  ------------  ------------
Total                                     101156       2064884         20.413

Number of garbage collections:                0
Bytes freed by GC:                            0
Time spent in GC:                           0.0 sec
Bytes permanently allocated:             90,368
Bytes currently in use:               1,974,516
Bytes available until next GC:          455,668
1974516 ;
455668 ;
90368 ;
0 ;
0 ;
0
[4]> 
```

You can see a strange little glitch (bug) resulting in the one row being shifted 2 spaces to the right in the **(room t)** output. It actually looks like that in my terminal. I doubt it would affect parsing, but it probably shouldn't do that either way.

