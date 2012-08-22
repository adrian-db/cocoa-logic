//
//  LCGeneralisationRule.h
//  Logic
//
//  Created by Adrian Bigland on 17/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCDeductionRule.h"

/** The rule that deduces an existentially quantified query from a fact that is an instance of that query.
 
 For example, a query asking if anyone likes Yoda can be deduced from the fact that Obi-Wan likes him.
 */
 
@interface LCGeneralisationRule : NSObject<LCDeductionRule>

@end
