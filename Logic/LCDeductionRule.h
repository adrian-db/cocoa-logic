//
//  LCDeductionRule.h
//  Logic
//
//  Created by Adrian Bigland on 17/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCTerm.h"

/** A rule used to deduce an existentially quantified query from a universally quantified fact.
 */

@protocol LCDeductionRule <NSObject>

/**------------------------------------------------------------
 * @name Logical Deduction
 * ------------------------------------------------------------
 */

/** Gets the substitution necessary to deduce a query from a fact in a logic program.
 
 For example, if the query is `master(X, Luke)`, and the program contains the fact `master(Obi-Wan, Luke)`, then we would need to bind the variable X to 'Obi-Wan' to deduce the query from that fact. The substitution would be X='Obi-Wan'.
 
 @param query the existentially quantified query.
 @param fact the universally quantified fact.
 @param program the logic program which contains the fact.
 @return the substitution (a dictionary of terms indexed by the variables they are bound to) necessary to deduce the query from this fact. If the query cannot be deduced from the fact, this is nil. It is possible for a query to be deduced from a fact without having to bind any variables - for example using the Identity deduction rule. In this case, an empty dictionary is returned.
 */
- (NSDictionary *)deductionOf:(LCTerm *)query fromFact:(LCTerm *)fact inProgram:(NSArray *)program;

@end
