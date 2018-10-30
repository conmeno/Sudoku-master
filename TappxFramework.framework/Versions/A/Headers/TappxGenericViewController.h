//
//  TappxGenericViewController.h
//  TappxFramework
//
//  Created by Sara Victor Fernandez on 4/1/2017.
//  Copyright © 2017 4Crew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TappxMRAIDServiceDelegate.h"

@class TappxMRAIDParser;
@class TappxAdvertisement;

@interface TappxGenericViewController : UIViewController<UIWebViewDelegate>
@property (nonatomic) BOOL mraidUseCustomClose;
@property (strong, nonatomic) TappxMRAIDParser* mraidParser;
@property (weak, nonatomic) id<TappxMRAIDServiceDelegate> mraidServiceDelegate;

@property (strong, nonatomic) TappxAdvertisement* advertisement;

-(void) initBase;


// mraid methods
-(void) createCalendarEvent:(NSDictionary*) properties;
-(void) openWithProperties:(NSDictionary*) properties;
-(void) playVideoWithProperties:(NSDictionary*) properties;
-(void) storePicture:(NSDictionary*) properties;
-(void) useCustomCloseWithProperties:(NSDictionary*) properties;

// methods to override if mraid is implemented
-(void) close;
-(void) expandWithProperties:(NSDictionary*) properties;
-(void) resize;
-(void) setOrientationProperties:(NSDictionary*) properties;
-(void) setResizeProperties:(NSDictionary*) properties;
@end
