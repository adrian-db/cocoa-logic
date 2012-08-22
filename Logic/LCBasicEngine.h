//
//  BasicEngine.h
//  Logic
//
//  Created by Adrian Bigland on 13/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCTerm.h"

@class LCBasicEngine;

@protocol LCBasicEngineDelegate <NSObject>

- (void)engine:(LCBasicEngine *)engine deduces:(LCTerm *)query fromProgram:(NSArray *)program withSubstitution:(NSDictionary *)substitution;

@end

@interface LCBasicEngine : NSObject {
    
    NSArray *deductionRules;
    
}

@property (nonatomic, assign) NSObject<LCBasicEngineDelegate> *delegate;

- (BOOL)deduce:(LCTerm *)query fromProgram:(NSArray *)program;

@end
