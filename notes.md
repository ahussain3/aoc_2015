# Learning Notes

Haskell is nice when you have a single unit of work, but is a little more
fiddly when it comes to data manipulation. E.g. there are no 'for' loops so
I found myself needing to do maps of maps.

Wow, it really is true that Haskell code runs correctly the first time you
run it. It's weird to have so little visibility into what the program is
doing, but then it always spits out the correct answer as soon as you've
fixed the compiler errors

Haskell's package management is atrocious. I just need to install a library
that helps me generate an md5 hash from a string and it is proving to be
much more difficult that it ought to be

Questions:
- Is there a "spread" operator? Such that I can pass a [Int] of length 3
  into a function that takes Int -> Int -> Int as input?
- How can I map over the interior items in a list of lists?
