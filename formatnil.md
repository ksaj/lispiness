Here's something to try in the REPL top level loop.

You probably already know about (format t "Hello World"). You get:

```lsp
[1]> (format t "Hello World!")
Hello World!
NIL
[2]> 
```

On a whim, before I realized t was <i>terminal</i> and not <i>true</i> like it is pretty much everywhere else, I tried the following:

```lisp
[2]> (format nil "Hello World!")
"Hello World!"
[3]> 
```

Notice it didn't write NIL? And what are the quotes doing there? This is something I've known about since forever, but did't put any thought to. It's not the most practical thing to do.

Thinking about it today however, it suddenly dawned on me: after formatting the string for nothing, the format essentially evaporates. It doesn't send anything to Print (as per REPL) except the string itself. In other words,the P just treats the string the same way it would have if I typed this:

```lisp
[3]> "Hello World!"
"Hello World!"
[4]> 
```

Pretty neat.
