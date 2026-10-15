# Max/MSP Patches and Abstractions
## br.counter.1.0



By Brian Riordan  
guaguanco127 [at] gmail [dot] com  
brianriordanmusic [at] gmail [dot] com  
[https://www.brianriordanmusic.com/](https://www.brianriordanmusic.com/)

Repository for br.counter.1.0, with all related files, can be found here: [https://github.com/guaguanco127/br.counter](https://github.com/guaguanco127/br.counter)  
Additional programs can be found here: [https://github.com/guaguanco127/br.max](https://github.com/guaguanco127/br.max)

These files were created with Max 9.

## Links

[About](#About)  
[Fold](#Fold)  
[Max/MSP Abstractions](https://github.com/guaguanco127/br.counter/tree/main/MaxMSP%20Abstraction) To use as an abstraction within Max/MSP (installation, every inlet, attribute and the example patch are in its README)  

## <a name="About"></a>About

A counter for Max/MSP with eight ways to count, in one object and one file. Max sets the highest count, the same way as Max's own [counter]: 7 counts 0 to 7.

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

**Hidden master:** a plain count of the input runs underneath every mode (each bang adds 1, an int sets it). Sync reports it; the other modes count from their own last number and may drift away from it, which is fine. Switch back to Sync and the count snaps back to the input. The master also has its own outlet.

**Step:** how far each count moves (Step 3: 0 3 6 1 4 7 2 5). Drunk uses it as its largest step.

**Permutation:** starts the count later. Permutation 3 turns 0 1 2 ... 7 into 3 4 5 6 7 0 1 2. It shifts Forward, Backward and both Palindromes.

**Carry:** a bang after the last count of each cycle, for chaining counters or marking the end of a pattern. Random and Drunk have no last count, so they never send it.

**Seed:** 0 = different every time. Any other number repeats the same Random, Urn and Drunk run after a reset.

## <a name="Fold"></a>Fold

Fold works with every mode except Sync, and has its own maximum (Fold Max, 0 = off).

- **Modulo** folds the count into 0 to Fold Max and restarts with the main cycle. Max 7, Fold Max 2: 0 1 2 0 1 2 0 1, then 0 again.
- **Poly** runs the mode itself inside 0 to Fold Max, looping on its own and ignoring Max: 0 1 2 0 1 2 0 1 2 ... Two counters with different Fold Max values make a polymeter.

With Fold on, Permutation slides the whole fold window up instead: Fold Max 2 with Permutation 2 counts 2 3 4.
