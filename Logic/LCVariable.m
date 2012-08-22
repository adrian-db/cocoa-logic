//
//  LCVariable.m
//  Logic
//
//  Created by Adrian Bigland on 13/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import "LCVariable.h"
#import "LCCompoundTerm.h"

@implementation LCVariable

@synthesize name = _name;

- (id)copyWithZone:(NSZone *)zone
{
    return [self retain];
}

- (void)dealloc
{
    self.name = nil;
    
    [super dealloc];
}

- (NSString *)description
{
    return self.name;
}

- (id)initWithName:(NSString *)name
{
    self = [super init];
    
    if (self) {
        
        self.name = name;
        
    }
    
    return self;
}

- (BOOL)isGround
{
    return NO;
}

- (LCTerm *)applySubstitution:(NSDictionary *)substitution
{
    // If this variable is a key in the substitution, return its replacement.
    // This handles the lowest level of substitution - for each variable individually.
    // Compound Terms will recursively call substitution methods on sub-terms, and eventually
    // call this method on each variable they contain.
    LCTerm *replacement = [substitution objectForKey:self];
    
    return replacement == nil ? self : replacement;
}

- (NSDictionary *)instantiatingSubstitution:(LCTerm *)term
{
    // Generally speaking, we will return a substitution of this variable for the given term.
    // However, we are not allowed to do so if the variable itself is part of the term, and
    // presumably if the other term is a variable.
    // We have to implement the 'occurs check'.
    
    // If this is a variable, allow it to be an instance of another variable, but don't bind them.
    if ([term isKindOfClass:[LCVariable class]]) return [[[NSDictionary alloc] init] autorelease];
    
    if ([term isKindOfClass:[LCCompoundTerm class]]) {
        
        // We can't make recursive structures where a variable's substitution contains the
        // variable itself.
        if ([((LCCompoundTerm *)term) contains:self]) return nil;
        
    }
    
    // Otherwise, just return a substitution of this variable for the term.
    return [[[NSDictionary alloc] initWithObjectsAndKeys:term, self, nil] autorelease];
}

@end
