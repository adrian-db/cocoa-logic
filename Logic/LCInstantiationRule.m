//
//  LCInstantiationRule.m
//  Logic
//
//  Created by Adrian Bigland on 17/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import "LCInstantiationRule.h"
#import "LCTerm.h"

@implementation LCInstantiationRule

// The rule of deduction that says you can deduce a query from a fact if the fact is general (universally quantified) and the query would be an instance of it.
// So if the fact says 'for all X, X is white' and the query states that Fred is white, the general fact allows us to deduce the specific query.
- (NSDictionary *)deductionOf:(LCTerm *)query fromFact:(LCTerm *)fact inProgram:(NSArray *)program
{
    return [fact instantiatingSubstitution:query];
}

@end
