//
//  LCFunctor.h
//  Logic
//
//  Created by Adrian Bigland on 13/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import <Foundation/Foundation.h>

/** A Functor - a functor is a way of talking about a family of terms - it is simply the name and number of arguments of a Compound Term (an LCCompoundTerm here). We can use functors to talk about all terms that share a common schema, by using variables within a compound term.
 
 For example, `master(X, Y)` has a functor with name 'master' and arity 2 (it has two arguments). It will unify with compound terms only if they share the same functor. For example, `master(Qui-Gon, Obi-Wan)`, or `master(Yoda, X)` (Yoda is everyones' master!), or even `master(X, X)` (everybody is their own master - deep!). It will not match `master(Yoda)` (presumably, telling us that Yoda is a Jedi Master). In this case the functor has the same name as the earlier one, but arity 1 - and the compound terms mean quite different things.
 */

@interface LCFunctor : NSObject

/**---------------------------------------
 * @name Properties
 * ---------------------------------------
 */

/** @return The name of this functor.
 
 It would make sense for the name to be an NSString, but I have kept it as an object to allow for using NSNumber and any other value objects.
 */
@property (nonatomic, readonly) NSObject<NSCopying> *name;

/** @return the arity of the functor - its number of arguments. */
@property (assign, readonly) NSUInteger arity;

/**-------------------------------------------
 * @name Initialising an instance of LCFunctor
 * -------------------------------------------
 */

/** Initialises a functor with a given name and arity.
 
 @param name The name of the functor.
 @param arity The number of arguments for this term. Note that you can have a term with no arguments.
 @return a functor with the given name and arity.
 */
- (id)initWithName:(NSObject<NSCopying> *)name andArity:(NSUInteger)arity;

@end
