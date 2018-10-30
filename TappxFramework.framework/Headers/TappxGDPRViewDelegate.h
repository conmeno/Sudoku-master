//
//  TappxGDPRDelegate.h
//  TappxFramework
//
//  Created by Rubén Tappx on 17/5/18.
//  Copyright © 2018 Tappx. All rights reserved.
//

#ifndef TappxGDPRViewDelegate_h
#define TappxGDPRViewDelegate_h

@class TappxGDPRCustomViewer;

@protocol TappxGDPRViewDelegate

- (void)tappxGDPRViewDidPress;
- (void)tappxGDPRViewDidClose;

@end

#endif /* TappxGDPRViewDelegate_h */
