//
//  UIView+createFromNib.h
//  TappxFramework
//
//  Created by Sara Victor Fernandez on 4/1/2017.
//  Copyright © 2017 4Crew. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MAKE_CATEGORIES_LOADABLE(UNIQUE_NAME) @interface FORCELOAD_##UNIQUE_NAME : NSObject @end @implementation FORCELOAD_##UNIQUE_NAME @end

void useMyNib();

@interface UIView (createFromNib)
+ (id)createFromNib;
- (id)createViewFromNib;
@end
