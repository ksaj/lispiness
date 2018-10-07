# Incrementing and Decrementing Numbers

Sometimes it is easy to forget that sometimes things *look* backward in Lisp, and sometimes they don't. Because of this, it is important to read Lisp using proper terminology.

Take subtraction, for example. The following snippet should be pretty clear, and its result not very surprising.

```lisp
    (format nil "~d" (- 4 1))
```

If your Lisp is anything like mine, you should get **"3"** as the answer.

In Intel assembler (which I only use because it is simpler to follow for these examples), the generated code would look something like the following:

```asm
    MOV AX, 4
    MOV BX, 1
    SUB AX, BX
    CALL PRINT_ANSWER
```
But Assembler programmers are all about efficient binary compiles, and this code represents a few too many bytes and clock ticks. Instead, they would be more apt to writing tighter code, such as:

```asm
    MOV AX, 4
    DEC AX
    CALL PRINT_ANSWER
```

Notice how we just cut the binary size in half (2 bytes for the MOV and SUB operators, but only 1 byte for the DEC), we didn't even touch the BX register. In a more sophisticated routine, the BX would be free for other uses.

## What would Lisp do?

We've all remember Annie proudly singing *Anything you can do, Lisp can do better..." And, yes it can. In fact, if you were to leave the Lisp code as we started, with the **(- 4 1)** someone will eventually point out that it isn't very Lispy. Instead, you can *decrement* the 4 instead of verbosely subtracting 1 from it.

```lisp
    (format nil "~d" (1- 4))
```

Now, let me point out a little gotcha here. With the opposite function **1+**, you could almost get away with referring to it as "One Plus" instead of "increment." We can read the earlier example as "Subtract from 4 the 1" but you really have to remember that the **1-** is *decrement* and not "One Minus," since *one minus four* isn't at all representative of what we are trying to do. We are *decrementing 4*, and not subtracting it from 1.

```lisp
    (format nil "~d" (- 4 1))
    (format nil "~d" (1- 4))
```

Notice how these both produce the same result, but they do it in entirely different ways. And now you know why Lisp uses the terms "increment" and "decrement" instead of their visual representations "one plus" and "one minus". It only looks backward when you read it wrong, and don't consider how each is evaluated or compiled.
