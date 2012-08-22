//
//  LCCompoundTermTests.m
//  Logic
//
//  Created by Adrian Bigland on 13/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import "LCCompoundTermTests.h"
#import "LCCompoundTerm.h"
#import "LCConstant.h"

@implementation LCCompoundTermTests

- (void)setUp
{
    [super setUp];

    nameYoda = [[LCConstant alloc] initWithValue:@"Yoda"];
    nameQuiGon = [[LCConstant alloc] initWithValue:@"Qui-Gon"];
    nameObiWan = [[LCConstant alloc] initWithValue:@"Obi-Wan"];
    
    varX = [[LCVariable alloc] init];
    varY = [[LCVariable alloc] init];
}

- (void)tearDown
{
    [varX release]; varX = nil;
    [varY release]; varY = nil;
    
    [nameYoda release]; nameYoda = nil;
    [nameQuiGon release]; nameQuiGon = nil;
    [nameObiWan release]; nameObiWan = nil;
    
    [super tearDown];
}

- (void)testIsEqual_equal
{
    LCCompoundTerm *termA = [[LCCompoundTerm alloc] initWithName:@"master" andArgument:nameQuiGon andSecondArgument:nameObiWan];
    
    LCCompoundTerm *termB = [[LCCompoundTerm alloc] initWithName:@"master" andArgument:nameQuiGon andSecondArgument:nameObiWan];
    
    STAssertTrue([termA isEqual:termB], @"Two identical compound terms were not considered equal.");
    STAssertTrue([termB isEqual:termA], @"Two identical compound terms were not considered equal.");
    
    [termA release];
    [termB release];
}

- (void)testIsEqual_differentName
{
    LCCompoundTerm *termA = [[LCCompoundTerm alloc] initWithName:@"superior" andArgument:nameQuiGon andSecondArgument:nameObiWan];
    
    LCCompoundTerm *termB = [[LCCompoundTerm alloc] initWithName:@"master" andArgument:nameQuiGon andSecondArgument:nameObiWan];
    
    STAssertTrue(![termA isEqual:termB], @"Two compound terms with different names were considered equal.");
    STAssertTrue(![termB isEqual:termA], @"Two compound terms with different names were considered equal.");
    
    [termA release];
    [termB release];
}

- (void)testIsEqual_differentArity
{
    LCCompoundTerm *termA = [[LCCompoundTerm alloc] initWithName:@"master" andArgument:nameQuiGon];
    
    LCCompoundTerm *termB = [[LCCompoundTerm alloc] initWithName:@"master" andArgument:nameQuiGon andSecondArgument:nameObiWan];
    
    STAssertTrue(![termA isEqual:termB], @"Two compound terms with different arity were considered equal.");
    STAssertTrue(![termB isEqual:termA], @"Two compound terms with different arity were considered equal.");
    
    [termA release];
    [termB release];
}

- (void)testIsEqual_differentArguments
{
    LCCompoundTerm *termA = [[LCCompoundTerm alloc] initWithName:@"master" andArgument:nameQuiGon andSecondArgument:nameObiWan];
    
    LCCompoundTerm *termB = [[LCCompoundTerm alloc] initWithName:@"master" andArgument:nameYoda andSecondArgument:nameObiWan];
    
    STAssertTrue(![termA isEqual:termB], @"Two compound terms with different arguments were considered equal.");
    STAssertTrue(![termB isEqual:termA], @"Two compound terms with different arguments were considered equal.");
    
    [termA release];
    [termB release];
}

- (void)testInstantiatingSubstitution
{
    LCCompoundTerm *termA = [[LCCompoundTerm alloc] initWithName:@"master" andArgument:nameQuiGon andSecondArgument:nameObiWan];
    
    LCCompoundTerm *termB = [[LCCompoundTerm alloc] initWithName:@"master" andArgument:varX andSecondArgument:nameObiWan];
    
    NSDictionary *expected = [[NSDictionary alloc] initWithObjectsAndKeys:nameQuiGon, varX, nil];
    
    STAssertNil([termA instantiatingSubstitution:termB], @"Considered a more general term to be an instance of a more specific one.");
    STAssertEqualObjects(expected, [termB instantiatingSubstitution:termA], @"Didn't get the expected substitution to make an instance of a more general term.");
    
    [expected release];
    [termA release];
    [termB release];
}

@end
