//
//  LCInstantiationRule.h
//  Logic
//
//  Created by Adrian Bigland on 17/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCDeductionRule.h"

/** The rule that deduces a query from a universally quantified fact if the query is an instance of that fact.
 
 For example, a fact stating that everyone likes Yoda is sufficient to deduce that Obi-Wan likes Yoda.
 */

@interface LCInstantiationRule : NSObject<LCDeductionRule>

@end
