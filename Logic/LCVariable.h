//
//  LCVariable.h
//  Logic
//
//  Created by Adrian Bigland on 13/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import "LCTerm.h"

/** A logical variable.
 */

@interface LCVariable : LCTerm

/**-----------------------------------------------
 * @name Properties
 * -----------------------------------------------
 */

/** @return The name of this variable. */
@property (nonatomic, retain) NSString *name;

/**-----------------------------------------------
 * @name Initialising an instance of LCVariable
 * -----------------------------------------------
 */

/** Initialises a variable with a name.
 
 @param name The name of the variable.
 @return a variable with the given name
 */
- (id)initWithName:(NSString *)name;

@end
