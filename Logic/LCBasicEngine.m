//
//  BasicEngine.m
//  Logic
//
//  Created by Adrian Bigland on 13/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import "LCBasicEngine.h"
#import "LCIdentityRule.h"
#import "LCInstantiationRule.h"
#import "LCGeneralisationRule.h"
#import "LCCommonInstanceRule.h"

@implementation LCBasicEngine

@synthesize delegate;

#pragma mark Initialisation and Deallocation

- (id)init
{
    self = [super init];
    
    if (self) {
        
        deductionRules = [[NSMutableArray alloc] initWithObjects:
                          [[[LCIdentityRule alloc] init] autorelease],
                          [[[LCGeneralisationRule alloc] init] autorelease],
                          [[[LCInstantiationRule alloc] init] autorelease],
                          [[[LCCommonInstanceRule alloc] init] autorelease],
                          nil];
        
    }
    
    return self;
}

- (void)dealloc
{
    [deductionRules release]; deductionRules = nil;
    
    [super dealloc];
}

#pragma mark Deduction Engine Methods

- (BOOL)deduce:(LCTerm *)query fromProgram:(NSArray *)program
{
    
    // For now, tries to deduce the query from each term, informing the delegate
    // of every term that allows it to be deduced, with the appropriate substitution.
    
    BOOL isDeduced = NO;
    
    for (LCTerm *term in program) {
        
        NSDictionary *substitution;
        
        // Try each deduction rule in turn - if any succeed, report success and move on
        // to the next fact in the program - see if it can also be used to deduce the query.
        for (NSObject<LCDeductionRule> *rule in deductionRules) {
            
            substitution = [rule deductionOf:query fromFact:term inProgram:program];
            
            if (substitution != nil) {
                
                [delegate engine:self deduces:query fromProgram:program withSubstitution:substitution];
                isDeduced = YES;
                break;
                
            }
            
        }
                
    }
    
    return isDeduced;
}

@end
