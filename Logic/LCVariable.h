//
//  LCVariable.h
//  Logic
//
//  Created by Adrian Bigland on 13/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import "LCTerm.h"

@interface LCVariable : LCTerm

@property (nonatomic, retain) NSString *name;

- (id)initWithName:(NSString *)name;

@end
