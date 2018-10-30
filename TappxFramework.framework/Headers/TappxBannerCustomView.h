//
//  TappxBannerCustomView.h
//  TappxFramework
//
//  Created by Ruben on 09/01/2017.
//  Copyright © 2017 Tappx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TappxBannerCustomView;

@protocol TappxBannerViewDelegate <NSObject>
- (void)tappxBannerviewDidPress:(TappxBannerCustomView* _Nonnull)view;
- (void)tappxGDPRViewDidPress;
@end

@interface TappxBannerCustomView : UIView

@property (nonatomic, weak, nullable) id<UIWebViewDelegate, TappxBannerViewDelegate> delegate;
@property (nonatomic, strong, nonnull) UIWebView* webView;
@property (nonatomic, strong, nonnull) UIView* transitionView;
@property (nonatomic, assign) CGSize transitionSize;

- (void)loadAdBanner:(NSString* _Nullable)banner withSize:(CGSize)size;
- (void)ChangeButtonGDPR:(float)alpha;
@end
