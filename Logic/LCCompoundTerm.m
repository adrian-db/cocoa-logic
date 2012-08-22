//
//  LCCompoundTerm.m
//  Logic
//
//  Created by Adrian Bigland on 13/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import "LCCompoundTerm.h"
#import "LCVariable.h"

@implementation LCCompoundTerm

@synthesize functor = _functor;
@synthesize arguments = _arguments;

#pragma mark Initialisation and Deallocation

- (id)initWithName:(NSObject<NSCopying> *)name
{
    return [self initWithName:name andArguments:nil];
}

- (id)initWithName:(NSObject<NSCopying> *)name andArgument:(LCTerm *)argument
{
    return [self initWithName:name andArguments:argument, nil];
}

- (id)initWithName:(NSObject<NSCopying> *)name andArgument:(LCTerm *)argument andSecondArgument:(LCTerm *)secondArgument
{
    return [self initWithName:name andArguments:argument, secondArgument, nil];
}

- (id)initWithName:(NSObject<NSCopying> *)name andArgument:(LCTerm *)argument andSecondArgument:(LCTerm *)secondArgument andThirdArgument:(LCTerm *)thirdArgument
{
    return [self initWithName:name andArguments:argument, secondArgument, thirdArgument, nil];
}

- (id)initWithName:(NSObject<NSCopying> *)name andArguments:(LCTerm *)firstArgument,...
{
    self = [super init];
    
        if (self != nil) {
        
        NSMutableArray *arguments = [[NSMutableArray alloc] init];
        
        va_list args;
        va_start(args, firstArgument);
        
        for (LCTerm *arg = firstArgument; arg != nil; arg = va_arg(args, LCTerm *)) {
            
            [arguments addObject:arg];
            
        }
        
        va_end(args);
        
        LCFunctor *functor = [[LCFunctor alloc] initWithName: name andArity:arguments.count];
        
        _functor = functor;
        _arguments = arguments;
        
    }
    
    return self;
}

- (id)initWithCompoundTerm:(LCCompoundTerm *)term andSubstitution:(NSDictionary *)substitution
{
    self = [super init];
    
    if (self) {
        
        _functor = [[LCFunctor alloc] initWithName:term.functor.name andArity:term.functor.arity];
        
        NSMutableArray *arguments = [[NSMutableArray alloc] initWithCapacity:term.arguments.count];
        
        for (LCTerm *argument in term.arguments) {
            
            [arguments addObject:[argument applySubstitution:substitution]];
            
        }
        
        _arguments = arguments;
        
    }
    
    return self;
}

- (void)dealloc
{
    [_functor release];
    _functor = nil;
    
    [_arguments release];
    _arguments = nil;
    
    [super dealloc];
}

#pragma mark Applying and Creating Substitutions

- (LCTerm *)applySubstitution:(NSDictionary *)substitution
{
    // This may be inefficient - we create what will be an instance, if there are any variables to be bound. If not, we will get a copy of ourself.
    // If we got a copy, dump it and return ourselves instead. It is a nice property that if we were not able to substitute anything, we return exactly ourselves - instead of a spurious copy.
    
    LCTerm *instance = [[[LCCompoundTerm alloc] initWithCompoundTerm:self andSubstitution:substitution] autorelease];

    if ([instance isEqual:self]) return self;
    
    return instance;
}

- (NSDictionary *)instantiatingSubstitution:(LCTerm *)term
{
    // If the term is the same as this one, return an empty dictionary.
    if (term == self || [term isEqual:self]) return [[[NSDictionary alloc] init] autorelease];
    
    // If this isn't a compound term, it can't be an instance.
    if (![term isKindOfClass:[LCCompoundTerm class]]) return nil;
    
    LCCompoundTerm *compoundTerm = (LCCompoundTerm *)term;
    
    // If the name or arity of the terms don't match, one cannot be an instance of the other.
    if (![compoundTerm.functor isEqual:self.functor]) return nil;
    
    NSMutableDictionary *compoundSubstitution = [[NSMutableDictionary alloc] init];
    
    NSDictionary *argumentSubstitution = nil;
    
    for (NSUInteger i = 0; i < self.arguments.count; ++i) {
        
        LCTerm *selfArgument = [self.arguments objectAtIndex:i];
        LCTerm *termArgument = [compoundTerm.arguments objectAtIndex:i];
        
        argumentSubstitution = [selfArgument instantiatingSubstitution:termArgument];
        
        // If we have an argument that can't be made to match with a substitution, the whole
        // won't match either - so return nil.
        if (argumentSubstitution == nil) return nil;
        
        // If this term matched without needing to substitute anything, ignore it and carry on
        // looking at the other arguments - this one matched.
        if (argumentSubstitution.count == 0) continue;
        
        // Otherwise, we have a substitution, but we need to do one final check. If the variables
        // substituted match with any we already gathered substitutions for - the substitutions
        // must match as well. If not, we have an inconsistency, and the term isn't an instance.
        // I suppose, also, that substituted terms match if one is an instance of the other - in
        // this case, take the instance, as it will be the most specific binding of the variable.
        
        for (LCVariable *variable in argumentSubstitution.keyEnumerator) {
            
            LCTerm *substitutedTerm = (LCTerm *)[argumentSubstitution objectForKey:variable];
            
            LCTerm *previouslySubstitutedTerm = (LCTerm *)[compoundSubstitution objectForKey:variable];
            
            if (previouslySubstitutedTerm == nil) {
                
                [compoundSubstitution setObject:substitutedTerm forKey:variable];
                
            }
            else {
                
                if ([previouslySubstitutedTerm instantiatingSubstitution:substitutedTerm] != nil) {
                    
                    // Replace the existing substitution with this one - it is more specific.
                    // (It may also be identical - in which case, no harm done).
                    [compoundSubstitution setObject:substitutedTerm forKey:variable];
                    
                }
                else if ([substitutedTerm instantiatingSubstitution:previouslySubstitutedTerm] == nil) {
                    
                    // If the previously instantiated term is an instance of the new one - leave
                    // things as they are. They are either the same term, or we already recorded
                    // a more specific (more ground) matching version of the term.
                    // If not though - it means that we have two bindings for the same variable
                    // that differ enough that neither is an instance of the other - they don't
                    // match, and the given term can never be an instance of this one.
                    return nil;
                    
                }
                
            }
            
        }
    }
    
    return compoundSubstitution;
}

- (BOOL)contains:(LCTerm *)term
{
    if ([term isEqual:self]) return YES;
    
    for (LCTerm *argument in self.arguments) {
        
        if ([term isEqual:argument]) return YES;
        
        if ([argument isKindOfClass:[LCCompoundTerm class]]) {
            
            if([((LCCompoundTerm *)argument) contains:term]) return YES;
            
        }
        
    }
    
    return NO;
}

#pragma mark NSObject methods

- (NSString *)description
{
    NSString *description = [NSString stringWithFormat:@"%@(", self.functor.name];
    
    NSString *sep = @"";
    
    for (LCTerm *argument in self.arguments) {
        
        description = [NSString stringWithFormat:@"%@%@%@", description, sep, argument];
        sep = @",";
        
    }
    
    return [NSString stringWithFormat:@"%@)", description];
}

- (BOOL)isEqual:(id)object
{
    if (self == object) return YES;
    
    if (!object || ![object isKindOfClass:[self class]]) return NO;
    
    return [self isEqualToCompoundTerm:(LCCompoundTerm *)object];
}

- (BOOL)isEqualToCompoundTerm:(LCCompoundTerm *)term
{
    if (self == term) return YES;
    
    if (![self.functor isEqual:term.functor]) return NO;
    
    if (![self.arguments isEqual:term.arguments]) return NO;
    
    return YES;
}

- (NSUInteger)hash
{
    return [self.functor hash] ^ [self.arguments hash];
}

@end
