//
//  LCIdentityRule.h
//  Logic
//
//  Created by Adrian Bigland on 17/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCDeductionRule.h"

/** The rule that deduces a query from an exactly matching fact.
 */

@interface LCIdentityRule : NSObject<LCDeductionRule>

@end
