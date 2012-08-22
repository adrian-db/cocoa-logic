//
//  LogicTests.h
//  LogicTests
//
//  Created by Adrian Bigland on 13/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "LCBasicEngine.h"
#import "LCConstant.h"
#import "LCVariable.h"

@interface LogicTests : SenTestCase
{
    LCConstant *nameYoda;
    LCConstant *nameObiWan;
    LCConstant *nameQuiGon;
    
    LCVariable *varX;
    LCVariable *varY;
    LCVariable *varZ;
    
    NSObject<LCBasicEngineDelegate> *delegate;
}

@property (nonatomic, retain) LCBasicEngine *engine;

@end
