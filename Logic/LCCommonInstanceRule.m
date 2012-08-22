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
    // First, see if either query or fact are an instance of each other. Possibly both are.
    NSDictionary *querySubstitution = [query instantiatingSubstitution:fact];
    
    NSDictionary *factSubstitution = [fact instantiatingSubstitution:query];
    
    // If neither is an instance of the other, no common instance can be found - return nil.
    if (querySubstitution == nil && factSubstitution == nil) return nil;
    
    // Now the curious bit. We don't want to return a merger of the substitutions above,
    // as they may contain variables internal to the fact, but not relevant to the query.
    // We don't want to return a substitution for those - the user is only really interested in
    // the query right now.
    // First, we apply the substitutions, then find the substitution necessary to create this
    // common instance FROM THE QUERY ONLY. This keeps the substitution relevant to the query.
    LCTerm *queryInstance = [query applySubstitution:querySubstitution];
    
    LCTerm *factInstance = [fact applySubstitution:factSubstitution];
    
    return [queryInstance instantiatingSubstitution:factInstance];
}

@end
