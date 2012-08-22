//
//  LCCommonInstanceRule.m
//  Logic
//
//  Created by Adrian Bigland on 17/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import "LCCommonInstanceRule.h"

@implementation LCCommonInstanceRule

- (NSDictionary *)deductionOf:(LCTerm *)query fromFact:(LCTerm *)fact inProgram:(NSArray *)program
{
    NSDictionary *querySubstitution = [query instantiatingSubstitution:fact];
    
    NSDictionary *factSubstitution = [fact instantiatingSubstitution:query];
    
    if (querySubstitution == nil && factSubstitution == nil) return nil;
    
    LCTerm *queryInstance = [query applySubstitution:querySubstitution];
    
    LCTerm *factInstance = [fact applySubstitution:factSubstitution];
    
    return [queryInstance instantiatingSubstitution:factInstance];
}

@end
