//
//  LCCompoundTerm.h
//  Logic
//
//  Created by Adrian Bigland on 13/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

//  A compound term, as defined in 'The Art of Prolog' 2nd Edition, 1994, Leon Sterling and Ehud Shapiro - p13.
//  For example, father(abraham,isaac). functor: 'father', arguments: 'abraham', 'isaac'.

#import "LCTerm.h"
#import "LCFunctor.h"

@interface LCCompoundTerm : LCTerm

@property (nonatomic, readonly) LCFunctor *functor;
@property (nonatomic, readonly) NSArray *arguments;

- (id)initWithName:(NSObject<NSCopying> *)name;
- (id)initWithName:(NSObject<NSCopying> *)name andArgument:(LCTerm *)argument;
- (id)initWithName:(NSObject<NSCopying> *)name andArgument:(LCTerm *)argument andSecondArgument:(LCTerm *)secondArgument;
- (id)initWithName:(NSObject<NSCopying> *)name andArgument:(LCTerm *)argument andSecondArgument:(LCTerm *)secondArgument andThirdArgument:(LCTerm *)thirdArgument;
- (id)initWithName:(NSObject *)name andArguments:(LCTerm *)firstArgument,...NS_REQUIRES_NIL_TERMINATION;

- (BOOL)contains:(LCTerm *)term;

@end
