//
//  TappxGDPR.h
//  TappxFramework
//
//  Created by Rubén Tappx on 17/5/18.
//  Copyright © 2018 Tappx. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TappxGDPRViewDelegate.h"

@interface TappxGDPR : UIViewController

- (void)tappxGDPRViewDidPress;
- (void)tappxGDPRViewDidClose;

- (instancetype)initGDPR;
- (void) checkAndShowPrivacyDisclaime:(UIViewController*)viewController;
- (void) renewPrivacyDisclaime:(UIViewController*)viewController;

@end
