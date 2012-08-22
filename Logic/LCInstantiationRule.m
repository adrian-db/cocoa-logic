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

- (NSDictionary *)deductionOf:(LCTerm *)query fromFact:(LCTerm *)fact inProgram:(NSArray *)program
{
    return [fact instantiatingSubstitution:query];
}

@end
