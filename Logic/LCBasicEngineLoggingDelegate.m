//
//  LCBasicEngineLoggingDelegate.m
//  Logic
//
//  Created by Adrian Bigland on 15/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import "LCBasicEngineLoggingDelegate.h"
#import "LCVariable.h"
#import "LCTerm.h"

@implementation LCBasicEngineLoggingDelegate

- (void)engine:(LCBasicEngine *)engine deduces:(LCTerm *)query fromProgram:(NSArray *)program withSubstitution:(NSDictionary *)substitution
{
    NSLog(@"%@", [self describeSubstitution:substitution]);
}

- (NSString *)describeSubstitution:(NSDictionary *)substitution
{
    NSString *description = @"{";
    NSString *sep = @"";
    
    for (LCVariable *variable in substitution.keyEnumerator) {
        
        description = [NSString stringWithFormat:@"%@%@%@=%@", description, sep, variable, [substitution objectForKey:variable]];
        sep = @",";
        
    }
    
    return [NSString stringWithFormat:@"%@}", description];
}

@end
