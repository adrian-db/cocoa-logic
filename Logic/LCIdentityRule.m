//
//  LCIdentityRule.m
//  Logic
//
//  Created by Adrian Bigland on 17/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import "LCIdentityRule.h"
#import "LCTerm.h"

@implementation LCIdentityRule

- (NSDictionary *)deductionOf:(LCTerm *)query fromFact:(LCTerm *)fact inProgram:(NSArray *)program
{
    if ([query isEqual:fact]) return [[[NSDictionary alloc] init] autorelease];
    
    return nil;
}

@end
