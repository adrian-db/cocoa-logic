//
//  LCTerm.h
//  Logic
//
//  Created by Adrian Bigland on 13/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import <Foundation/Foundation.h>

/** The main data structure of logic programs.
 */

@interface LCTerm : NSObject

/**-----------------------------------------------------------------
 * @name Determining instances of a term, and their substitutions
 * -----------------------------------------------------------------
 */

/** Gets an instance of this term by replacing any variables with the terms bound to them in the substitution.
 
 @param substitution a dictionary of terms indexed by variables bound to them.
 @return the instance produced by replacing all of this terms variables that occur in the substitution with the terms bound to them. Note that it may be that this term is returned without change, where none of the variables in the substitution apply to this term.
 */
- (LCTerm *)applySubstitution:(NSDictionary *)substitution;

/** Gets the substitution necessary to instantiate the given term from this one.
 
 @param term a term.
 @return a substitution that could be applied to this term to produce the given term. If the given term is not an instance of this term, nil is returned. It is possible that an empty substitution could be returned - for example, when the given term and this one are the same.
 */
- (NSDictionary *)instantiatingSubstitution:(LCTerm *)term;

@end
