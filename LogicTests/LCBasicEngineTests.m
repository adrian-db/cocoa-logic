//
//  LogicTests.m
//  LogicTests
//
//  Created by Adrian Bigland on 13/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import "LCBasicEngineTests.h"
#import "LCTerm.h"
#import "LCCompoundTerm.h"
#import "LCConstant.h"
#import "LCBasicEngineLoggingDelegate.h"

@implementation LCBasicEngineTests

@synthesize engine = _engine;

- (void)setUp
{
    [super setUp];
    
    self.engine = [[[LCBasicEngine alloc] init] autorelease];
    
    nameYoda = [[LCConstant alloc] initWithValue:@"Yoda"];
    nameQuiGon = [[LCConstant alloc] initWithValue:@"Qui-Gon"];
    nameObiWan = [[LCConstant alloc] initWithValue:@"Obi-Wan"];
    
    varX = [[LCVariable alloc] initWithName:@"X"];
    varY = [[LCVariable alloc] initWithName:@"Y"];
    varZ = [[LCVariable alloc] initWithName:@"Z"];
    
    termMasterQuiGonObiWan = [[LCCompoundTerm alloc] initWithName:@"master" andArgument:nameQuiGon andSecondArgument:nameObiWan];
    
    delegate = [[LCBasicEngineLoggingDelegate alloc] init];
    
    self.engine.delegate = delegate;
}

- (void)tearDown
{
    self.engine.delegate = nil;
    [delegate release]; delegate = nil;
    
    [termMasterQuiGonObiWan release]; termMasterQuiGonObiWan = nil;
    
    [nameYoda release]; nameYoda = nil;
    [nameQuiGon release]; nameQuiGon = nil;
    [nameObiWan release]; nameObiWan = nil;
    
    [varX release]; varX = nil;
    [varY release]; varY = nil;
    [varZ release]; varZ = nil;
    
    self.engine = nil;
    
    [super tearDown];
}

/**
 A simple test that a program containing a fact will prove a query for just that fact.
 */
- (void)testIdentity_simpleFactualQuery_consistent
{
    // Instantiate what we know to be a copy of the fact in the program - just to check
    // that equality rather than identity checks are being used to match query to facts.
    LCTerm *query = [[LCCompoundTerm alloc] initWithName:@"master" andArgument:nameQuiGon andSecondArgument:nameObiWan];
    
    NSArray *program = [[NSArray alloc] initWithObjects:termMasterQuiGonObiWan, nil];
    
    STAssertTrue([self.engine deduce:query fromProgram:program], @"A simple factual query was not proved, against a program that contained the same fact.");
    
    [query release];
    [program release];
}

/**
 A simple test that a program will fail to prove a query for a fact, if that fact isn't in the program.
 */
- (void)testIdentity_simpleFactualQuery_inconsistent
{
    LCTerm *query = [[LCCompoundTerm alloc] initWithName:@"master" andArgument:nameYoda andSecondArgument:nameObiWan];
    
    NSArray *program = [[NSArray alloc] initWithObjects:termMasterQuiGonObiWan, nil];
    
    STAssertTrue(![self.engine deduce:query fromProgram:program], @"A simple factual query was proved, against a program that did not contain the fact.");
    
    [query release];
    [program release];
}

/**
 
 */
- (void)testIdentity_existentialFactualQuery_consistent
{
    LCTerm *query = [[LCCompoundTerm alloc] initWithName:@"master" andArgument:varX andSecondArgument:varY];
    LCTerm *factMasterYodaObiWan = [[LCCompoundTerm alloc] initWithName:@"master" andArgument:nameQuiGon andSecondArgument:nameObiWan];
    LCTerm *factMasterYodaQuiGon = [[LCCompoundTerm alloc] initWithName:@"master" andArgument:nameYoda andSecondArgument:nameQuiGon];
    
    NSArray *program = [[NSArray alloc] initWithObjects:factMasterYodaObiWan, factMasterYodaQuiGon, nil];
    
    STAssertTrue([self.engine deduce:query fromProgram:program], @"A simple factual query was not proved, against a program that contained the same fact.");
    
    [query release];
    [factMasterYodaObiWan release];
    [program release];
}

- (void)test_universalFact
{
    LCTerm *query = [[LCCompoundTerm alloc] initWithName:@"likes" andArgument:nameYoda andSecondArgument:varZ];
    LCTerm *factEveryoneLikesThemselves = [[LCCompoundTerm alloc] initWithName:@"likes" andArgument:varX andSecondArgument:varX];
    LCTerm *factYodaLikesObiWan = [[LCCompoundTerm alloc] initWithName:@"likes" andArgument:nameYoda andSecondArgument:nameObiWan];
    
    NSArray *program = [[NSArray alloc] initWithObjects:factEveryoneLikesThemselves, factYodaLikesObiWan, nil];
    
    STAssertTrue([self.engine deduce:query fromProgram:program], @"A simple factual query was not proved, against a program that contained the same fact.");
    
    [query release];
    [program release];
}

@end
