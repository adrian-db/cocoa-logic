//
//  LCTerm.m
//  Logic
//
//  Created by Adrian Bigland on 13/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import "LCTerm.h"

@implementation LCTerm

#pragma mark Applying and Creating Substitutions

- (LCTerm *)applySubstitution:(NSDictionary *)substitution
{
    // Unless overriden by sub-classes to do something else, assume that
    // the term cannot contain any variables, and therefore a substitution is irrelevant -
    // return this term unchanged.
    return self;
}

- (NSDictionary *)instantiatingSubstitution:(LCTerm *)term
{
    // By default, no substitution is possible - so either the term is identical to this one
    // (and we return an empty substitution), or it is not an instance at all - in which case
    // we return a nil substitution.
    // Compound terms and variables override this method to do more meaningful instantiation.
    if ([term isEqual:self]) return [[[NSDictionary alloc] init] autorelease];
    
    return nil;
}

@end
