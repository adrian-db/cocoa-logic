//
//  LCConstant.m
//  Logic
//
//  Created by Adrian Bigland on 13/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import "LCConstant.h"

@implementation LCConstant

@synthesize value = _value;

- (NSString *)description
{
    if ([self.value isKindOfClass:[NSString class]]) {
        
        return [NSString stringWithFormat:@"'%@'", self.value];
        
    }
    return [self.value description];
}

- (BOOL)isEqual:(id)object
{
    if (self == object) return YES;
    
    if (!object || ![object isKindOfClass:[self class]]) return NO;
    
    return [self isEqualToConstant:(LCConstant *)object];
}

- (BOOL)isEqualToConstant:(LCConstant *)constant
{
    if (self == constant) return YES;
    
    return [self.value isEqual:constant.value];
}

- (id)initWithValue:(NSObject<NSCopying> *)value
{
    self = [super init];
    if (self != nil) {
        
        _value = [value copy];
        
    }
    return self;
}

- (NSUInteger)hash
{
    return [self.value hash];
}

- (void)dealloc
{
    [_value release]; _value = nil;
    
    [super dealloc];
}

@end
