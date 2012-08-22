//
//  LCConstant.h
//  Logic
//
//  Created by Adrian Bigland on 13/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import "LCTerm.h"

@interface LCConstant : LCTerm

@property (nonatomic, readonly) NSObject *value;

- (id)initWithValue:(NSObject<NSCopying> *)value;

@end
