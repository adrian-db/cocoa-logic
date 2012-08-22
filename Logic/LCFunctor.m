//
//  LCFunctor.m
//  Logic
//
//  Created by Adrian Bigland on 13/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import "LCFunctor.h"

@implementation LCFunctor

@synthesize name = _name;
@synthesize arity = _arity;

#pragma mark Initialisation and deallocation

- (id)initWithName:(NSObject<NSCopying> *)name andArity:(NSUInteger)arity
{
    self = [super init];
    
    if (self) {
        
        _name = [name copy];
        _arity = arity;
        
    }
    
    return self;
}

- (void)dealloc
{
    [_name release]; _name = nil;
    _arity = 0;
    
    [super dealloc];
}

#pragma mark NSObject methods

- (BOOL)isEqual:(id)object
{
    if (self == object) return YES;
    
    if (!object || ![object isKindOfClass:[self class]]) return NO;
    
    return [self isEqualToFunctor:(LCFunctor *)object];
}

- (BOOL)isEqualToFunctor:(LCFunctor *)functor
{
    if (self == functor) return YES;
    
    if (![self.name isEqual:functor.name]) return NO;
    
    if (self.arity != functor.arity) return NO;
    
    return YES;
}

- (NSUInteger)hash
{
    return [self.name hash];
}

@end
