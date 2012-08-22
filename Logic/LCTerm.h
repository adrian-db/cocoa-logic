//
//  LCTerm.h
//  Logic
//
//  Created by Adrian Bigland on 13/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCTerm : NSObject

- (LCTerm *)applySubstitution:(NSDictionary *)substitution;

// Gets the substitution necessary to make the given term an instance of this one.
// If the given term is not an instance, this returns nil.
// If the given term is equal to this term, an empty dictionary is returned.
- (NSDictionary *)instantiatingSubstitution:(LCTerm *)term;

- (BOOL)isGround;

@end
