//
//  LCGeneralisationRule.m
//  Logic
//
//  Created by Adrian Bigland on 17/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import "LCGeneralisationRule.h"
#import "LCTerm.h"

@implementation LCGeneralisationRule

// The rule of deduction that deduces a query from a fact if the query is existentially quantified, and the fact is an instance of it.
// For example, a query 'who has an umbrella' is deduced from a fact 'George has an umbrella'.
- (NSDictionary *)deductionOf:(LCTerm *)query fromFact:(LCTerm *)fact inProgram:(NSArray *)program
{
    return [query instantiatingSubstitution:fact];
}

@end
