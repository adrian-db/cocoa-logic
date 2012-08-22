//
//  LCBasicEngineLoggingDelegate.h
//  Logic
//
//  Created by Adrian Bigland on 15/08/2012.
//  Copyright (c) 2012 Adrian Bigland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCBasicEngine.h"

/** A delegate that uses NSLog to log each substitution used to successfully deduce a query from a logic program.
 */

@interface LCBasicEngineLoggingDelegate : NSObject<LCBasicEngineDelegate>

@end
