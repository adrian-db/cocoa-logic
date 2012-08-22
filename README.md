Cocoa Logic
===========

Cocoa Logic is a simplified version of Prolog, written in Objective-C, allowing Cocoa applications to do simple deduction and unification.

The project has only just been started, and is not particularly useful.

I'm developing this alongside reading [The Art of Prolog](http://www.amazon.co.uk/The-Art-PROLOG-Programming-Techniques/dp/0262691639 "The Art of Prolog"), and as important bits of the computational model are left to later chapters, I'm filling in with quick and dirty mechanisms as I go, or limiting the implementation until later.

Quick start
-----------

* Clone the repo, `git clone git://github.com/adrian-db/cocoa-logic.git`.
* Open the XCode project file.
* Run the unit tests from XCode `cmd-U`.

Future Work
-----------

+ refactor the unit tests
+ make the unit tests more systematic
+ support conjunctive goals (requires shared substitutions and backtracking)

Author
======

Adrian Bigland