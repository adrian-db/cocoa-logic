//
//  BasicEngine.h
//  Logic
//
//  Created by Adrian Bigland on 13/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCTerm.h"

@class LCBasicEngine;

/** This protocol is implemented by classes that want to be informed of all the ways a query can be deduced from a logic program.
 
 @warning This is too simple to allow delegates to build a proof tree, so will have to be elaborated in future. For now, it serves to print out the different substitutions proving a query.
 */

@protocol LCBasicEngineDelegate <NSObject>

/** This method is called by an engine every time it deduces a query from a logic program.
 
 @param engine The reporting logic engine.
 @param query The query that the engine deduced.
 @param program The program used to deduce the query.
 @param substitution The substitution (binding of variables) that the engine needed to deduce the query.
 */
- (void)engine:(LCBasicEngine *)engine deduces:(LCTerm *)query fromProgram:(NSArray *)program withSubstitution:(NSDictionary *)substitution;

@end

/** This class attempts to deduce a query from a logic program.
 
 This deduction engine uses simple, direct methods to deduce a query. It is inteded as a starting point for generalising the deduction engine concept, and building some engines optimised for reasoning well for specific problems.
 */

@interface LCBasicEngine : NSObject {
    
    NSArray *deductionRules;
    
}

/** @return A delegate, that the engine will inform of each substitution that deduces a query from a program.
 */
@property (nonatomic, assign) NSObject<LCBasicEngineDelegate> *delegate;

/**------------------------------------------------------------
 * @name Logical Deduction
 * ------------------------------------------------------------
 */

/** Attempts to deduce the query from the logic program.
 
    Note that there may be many substitutions that allow the query to be deduced - 
    each of these will be reported to the delegate, in turn.
 
   @param query An existentially quantified term that the engine tries to deduce from the program.
   @param program An array of universally quantified facts and rules making up the logic program.
   @return YES if the query could be deduced from the program, NO otherwise.
 */
- (BOOL)deduce:(LCTerm *)query fromProgram:(NSArray *)program;

@end
