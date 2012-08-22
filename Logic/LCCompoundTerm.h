//
//  LCCompoundTerm.h
//  Logic
//
//  Created by Adrian Bigland on 13/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import "LCTerm.h"
#import "LCFunctor.h"

/** A compound term, as defined in '[The Art of Prolog](http://www.amazon.co.uk/The-Art-PROLOG-Programming-Techniques/dp/0262691639 "The Art of Prolog")' 2nd Edition, 1994, Leon Sterling and Ehud Shapiro - p13.
 
 For example, `father(abraham,isaac)`. functor: 'father', arguments: 'abraham', 'isaac'.
 */

@interface LCCompoundTerm : LCTerm

/**---------------------------------------------
 * @name Properties
 * ---------------------------------------------
 */

/** @return The term's Functor - its name, and number of arguments.
 
 Functors group terms with similar meanings. For example, `master(Qui-Gon, Obi-Wan)` (Qui-Gon is Obi-Wan's master) and `master(Obi-Wan, Luke)` (Obi-Wan is Luke's master) have equal functors - name: 'master', arity: 2. However, `master(Yoda)` (Yoda is a Jedi Master) has a different functor. The names are the same, but the functors have different arity, and clearly have different meanings.
 */
@property (nonatomic, readonly) LCFunctor *functor;

/** @return The term's arguments. 
 
 The arguments are what makes a term differ from terms with similar meanings. For example, `colour(LittleCloud, White)` differs from a term with similar meaning `colour(BigCloud, Grey)`. Their functors are the same - they have a similar meaning, but their arguments differ. The first term's arguments: LittleCloud and White. The second term's arguments: BigCloud and Grey.
 
 Arguments can be any kind of Term. They can even be variables (LCVariable here) - in which case their meaning depends on their use. In a query, such an argument would be an existentially quantified variable, but in a logic program would be a universally quantified variable.
 
 For example, a query `master(X, Luke)` would mean: Does a person exist who is Luke's master?
 In a logic program, `master(X, Luke)` would mean instead: Everyone is Luke's master.
 */
@property (nonatomic, readonly) NSArray *arguments;

/**---------------------------------------------
 * @name Initialising an LCCompoundTerm instance
 * ---------------------------------------------
 */

/** Initialises a compound term with a name, and no arguments.
 
 For example, `foo()`.
 
 @param name The name of the compound term's functor.
 @return A compound term initialised with a zero arity functor of the given name, and correspondingly, no arguments.
 */
- (id)initWithName:(NSObject<NSCopying> *)name;

/** Initialises a compound term with a name and a single argument.
 
 For example, `foo(Quux)` or `foo(bar(Quux))`.
 
 @param name The name of the compound term's functor.
 @param argument The compound term's single argument.
 @return a compound term with the given name and arguments.
 */
- (id)initWithName:(NSObject<NSCopying> *)name andArgument:(LCTerm *)argument;

/** Initialises a compound term with a name and two arguments.
 
 For example, `foo(Bar, Quux)`.
 
 @param name The name of the compound term's functor.
 @param argument The compound term's first argument.
 @param secondArgument The compound term's second argument.
 @return a compound term with the given name and arguments.
 */
- (id)initWithName:(NSObject<NSCopying> *)name andArgument:(LCTerm *)argument andSecondArgument:(LCTerm *)secondArgument;

/** Initialises a compound term with a name and three arguments.
 
 For example, `foo(Bar, Quux, Plugh)`.
 
 @param name The name of the compound term's functor.
 @param argument The compound term's first argument.
 @param secondArgument The compound term's second argument.
 @param thirdArgument The compound term's third argument.
 @return a compound term with the given name and arguments.
 */
- (id)initWithName:(NSObject<NSCopying> *)name andArgument:(LCTerm *)argument andSecondArgument:(LCTerm *)secondArgument andThirdArgument:(LCTerm *)thirdArgument;

/** Initialises a compound term with a name and a nil-terminated list of arguments.
 
 @param name The name of the compound term's functor.
 @param firstArgument The compound term's first argument.
 @return a compound term with the given name and arguments.
 */
- (id)initWithName:(NSObject *)name andArguments:(LCTerm *)firstArgument,...NS_REQUIRES_NIL_TERMINATION;

/** Initialises a compound term from another term, after replacing any of its variables with terms bound to them in the given substitution.
 
 @param term A compound term.
 @param substitution a substitution - terms indexed by the variables bound to them.
 @return a compound term that is an instance of the given term, after replacing variables according to the specified substitution.
 */
- (id)initWithCompoundTerm:(LCCompoundTerm *)term andSubstitution:(NSDictionary *)substitution;

/**------------------------------------------------
 * @name Examining the structure of a compound term
 * ------------------------------------------------
 */

/** Gets if the compound terms contains a sub term, by searching all sub-terms recursively. 
 
 @param term a term to search for.
 @return YES if the term is part of this compound term, at some level, NO if it does not appear at all.
 */
- (BOOL)contains:(LCTerm *)term;

@end
