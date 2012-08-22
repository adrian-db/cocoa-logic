//
//  LCCommonInstanceRule.h
//  Logic
//
//  Created by Adrian Bigland on 17/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCDeductionRule.h"

/** The rule that deduces an existentially quantified (non ground) query from a universally quantified (non ground) fact if there exists a common instance of both of them.
 
 For example, a query asking if anyone likes Yoda can be deduced from the fact that everyone likes themselves, by correctly deducing the common instance - a fact that Yoda likes himself.
 */

@interface LCCommonInstanceRule : NSObject<LCDeductionRule>

@end
