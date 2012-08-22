//
//  LCFunctor.h
//  Logic
//
//  Created by Adrian Bigland on 13/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCFunctor : NSObject

@property (nonatomic, readonly) NSObject<NSCopying> *name;
@property (assign, readonly) NSUInteger arity;

- (id)initWithName:(NSObject<NSCopying> *)name andArity:(NSUInteger)arity;

@end
