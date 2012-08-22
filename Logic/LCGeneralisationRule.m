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

- (NSDictionary *)deductionOf:(LCTerm *)query fromFact:(LCTerm *)fact inProgram:(NSArray *)program
{
    return [query instantiatingSubstitution:fact];
}

@end
