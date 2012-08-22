//
//  LCDeductionRule.h
//  Logic
//
//  Created by Adrian Bigland on 17/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCTerm.h"

@protocol LCDeductionRule <NSObject>

// Gets the substitution necessary to deduce a query from a fact in a logic program.
// If the query cannot be deduced, this returns nil.
// It may be that no substitution is needed - in which case an empty dictionary is returned.
- (NSDictionary *)deductionOf:(LCTerm *)query fromFact:(LCTerm *)fact inProgram:(NSArray *)program;

@end
