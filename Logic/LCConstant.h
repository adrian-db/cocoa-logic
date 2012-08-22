//
//  LCConstant.h
//  Logic
//
//  Created by Adrian Bigland on 13/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import "LCTerm.h"

/** A constant value in a logic program.
 
 Most often constants are used to represent individuals in example Prolog programs.
 
 For example, `Obi-Wan` and `Yoda`.
 */

@interface LCConstant : LCTerm

/**-----------------------------------------------
 * @name Properties
 * -----------------------------------------------
 */

/** The value of the constant.
 */
@property (nonatomic, readonly) NSObject *value;

/**-----------------------------------------------
 * @name Instantiating an instance of LCConstant
 * -----------------------------------------------
 */

/** Initialises the constant with a value.
 @param value a value of some kind.
 @return a constant with the given value.
*/
- (id)initWithValue:(NSObject<NSCopying> *)value;

@end
