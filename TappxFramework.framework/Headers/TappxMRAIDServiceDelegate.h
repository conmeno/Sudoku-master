//
//  TappxMRAIDServiceDelegate.h
//  TappxFramework
//
//  Created by Sara Victor Fernandez on 4/1/2017.
//  Copyright © 2017 4Crew. All rights reserved.
//

#ifndef TappxMRAIDServiceDelegate_h
#define TappxMRAIDServiceDelegate_h

@protocol TappxMRAIDServiceDelegate

@optional
-(void) createCalendarEventUrlString:(NSString*) urlString;
-(void) openUrlString:(NSString*) urlString;
-(void) playVideoUrlString:(NSString*) urlString;
-(void) storePictureUrlString:(NSString*) urlString;
@end

#endif /* TappxMRAIDServiceDelegate_h */
