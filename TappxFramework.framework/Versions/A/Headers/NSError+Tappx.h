//
//  NSError+Tappx.h
//  TappxFramework
//
//  Created by David Alarcon on 04/01/2017.
//  Copyright © 2017 4Crew. All rights reserved.
//

#import <Foundation/Foundation.h>

void useMyError();

@interface NSError (Tappx)
+ (NSError*)createErrorWith:(NSString*)message andCode:(int)code;
@end
