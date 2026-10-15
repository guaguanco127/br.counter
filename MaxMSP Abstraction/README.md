# Max/MSP Abstractions:
## br.counter.1.0



By Brian Riordan  
guaguanco127 [at] gmail [dot] com  
brianriordanmusic [at] gmail [dot] com  
[https://www.brianriordanmusic.com/](https://www.brianriordanmusic.com/)

Repository for br.counter.1.0, with all related files, can be found here: [https://github.com/guaguanco127/br.counter](https://github.com/guaguanco127/br.counter)  
Additional programs can be found here: [https://github.com/guaguanco127/br.max](https://github.com/guaguanco127/br.max)

These files were created with Max 9.

## Table of Contents

[About](#About)  
[What is an abstraction?](#Abstraction)  
[How To Install](#Install)  
[How To Use](#Use)  
[Fold](#Fold)  
[Attributes](#Attributes)  
[Example Patch](#Example)  



## <a name="About"></a>About

A counter for Max/MSP with eight ways to count, in one object and one file. Send it a bang (or an int) and it outputs the next count. Max sets the highest count, the same way as Max's own [counter]: 7 counts 0 to 7.

| Mode | What it does |
|---|---|
| 0 Sync | Only the input: each bang adds 1, an int jumps straight to that number. Ignores Step, Permutation and Fold |
| 1 Forward | Counts up from wherever it was |
| 2 Backward | Counts down from wherever it was |
| 3 Palindrome (ends once) | Up and back down, playing each end once: 0 1 2 3 2 1 0 1 ... |
| 4 Palindrome (ends twice) | Up and back down, playing each end twice: 0 1 2 3 3 2 1 0 0 1 ... |
| 5 Random | Any number from 0 to Max, repeats allowed |
| 6 Urn | Every number once in a random order, then a new round. Never skips a number and never repeats the last number of one round as the first of the next |
| 7 Drunk | Moves 1 to Step up or down each time, bouncing back at the ends |

**Hidden master:** a plain count of the input runs underneath every mode: each bang adds 1, an int sets it, and it wraps at Max. Sync reports it. The other modes count on from their own last number (an int steps them like a bang), so they may drift away from it. Switch back to Sync and the count snaps back to the input.

**Switching modes** never jumps: Forward picks up from wherever Random or Urn left off, and a Palindrome keeps the direction it was going.

**Changing a setting outputs nothing:** the next bang shows it. If Max shrinks below the current count, the count wraps.

**reset** goes back to the start without output; the next bang outputs the first count (0, Max for Backward, or the Permutation start).

## <a name="Abstraction"></a>What is an Abstraction?

An abstraction is a subpatcher that is saved as an external file, and can be used just like a standard Max object. As long as your abstraction can be found in the Max file path, you can type its name into a new object box and it will be loaded directly into your patch.

By saving your logic in an abstraction, you can create modules that can be used in future work with little or no additional programming. This allows you to parlay your Max knowledge into more efficient work in the future, and will help you create programming systems that are modular and easier to maintain.

## <a name="Install"></a>How To Install

1. Make sure you have Max 9 installed in your computer. And, make sure you are using a Max patch that is inside of a folder.

2. Copy br.counter.1.0.maxpat into the same folder as the Max patch you are using. It is a single file: the counting code is stored inside it, with no separate .js file.

3. Create an object with its name and, if you like, Max as an argument and any attributes, for example br.counter.1.0 7 @mode 3 (do not include brackets). Control it through its inlets (see below).

## <a name="Use"></a>How To Use

Every control has its own inlet. Inlets 2 to 7 only store the value; the next bang uses it. Hover over an inlet or outlet in Max to see its range and default.

| Inlet | Control | Type | Range | Default |
|---|---|---|---|---|
| 1 | Count | Bang / Int | bang = next count, int = sets the hidden master (Sync jumps to it) | |
| 2 | Mode | Int | 0 Sync, 1 Forward, 2 Backward, 3 Palindrome (ends once), 4 Palindrome (ends twice), 5 Random, 6 Urn, 7 Drunk | 1 |
| 3 | Max | Int | 0 or more: the highest count (7 = 0 to 7) | 7 |
| 4 | Step | Int | 1 or more (Drunk: the largest step; Sync ignores it) | 1 |
| 5 | Permutation | Int | start offset for Forward, Backward and Palindromes | 0 |
| 6 | Fold | Int | 0 = Modulo, 1 = Poly | 0 |
| 7 | Fold Max | Int | 0 = Fold off, otherwise the highest count of the fold | 0 |

The first inlet also takes the messages reset, seed, mode, max, step, permutation, fold and foldmax, each followed by a number (seed 42, mode 6). Floats are rounded down.

| Outlet | Name | Type |
|---|---|---|
| 1 | Count | Int |
| 2 | Carry: after the last count of each cycle (sent after the count). Never in Random and Drunk | Bang |
| 3 | Hidden master: the count of the input (sent before the count) | Int |

Where Carry fires: Forward and Backward on the last count before they wrap, so with Step 3 it fires on each wrap. Palindromes at the end of the full trip up and back. Urn on the last number of each round. Sync when the master wraps. Modulo on the last count before each folded restart. Poly at the end of each Poly loop.

**Ideas:**
- Carry into a second br.counter: one counts steps, the other counts bars.
- Two Poly counters with Fold Max 2 and 3 for a 3-against-4 pattern.
- Urn with Seed for a melody that uses every note once and repeats at every rehearsal.
- Drunk with Step 1 for a melody that wanders by single steps.

## <a name="Fold"></a>Fold

Fold works with every mode except Sync and has its own maximum, Fold Max (0 = off).

- **Modulo** folds the count into 0 to Fold Max and restarts with the main cycle. Max 7, Fold Max 2: 0 1 2 0 1 2 0 1, then 0 again.
- **Poly** runs the mode itself inside 0 to Fold Max, looping on its own and ignoring Max: 0 1 2 0 1 2 0 1 2 ... Palindromes, Urn and Drunk stay inside the fold too.

With Fold on, Permutation slides the whole fold window up instead of rotating the count: Fold Max 2 with Permutation 2 counts 2 3 4. If the window passes Max, it wraps back to 0.

## <a name="Attributes"></a>Attributes

The object reads Max as an argument and the rest as attributes, once, when the patch opens. The inlets still change everything live. Attribute values are numbers.

`[br.counter.1.0 7 @mode 3 @step 2]`

| Attribute | Values | Default |
|---|---|---|
| @mode | 0 - 7 | 1 |
| @max | 0 or more | 7 |
| @step | 1 or more | 1 |
| @permutation | any whole number | 0 |
| @fold | 0 Modulo, 1 Poly | 0 |
| @foldmax | 0 = off, or the highest count of the fold | 0 |
| @seed | 0 = different every time, any other number repeats a run | 0 |

An unknown message prints "br.counter: unknown message" in the Max console.

## <a name="Example"></a>Example Patch

Open _br.counter.example.1.0.maxpat (keep it in the same folder as br.counter.1.0.maxpat). Turn on the metro (the number box beside it sets its speed), then try each mode from the menu.

- **max, step, perm:** change them while it runs; they show on the next count.
- **fold and fold max:** switch between Modulo and Poly and set a small Fold Max.
- **reset** and **seed 42:** press seed 42, then reset, in Urn or Random: the same run every time.
- **int in:** type a number to set the hidden master. In Sync the count jumps to it.
- **count, carry, hidden master:** the three outlets, with a slider showing the count.
