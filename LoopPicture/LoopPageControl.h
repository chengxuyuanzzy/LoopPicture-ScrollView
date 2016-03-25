//
//  LoopPageControl.h
//  ScrollviewTu
//
//  Created by shoujizhifu on 16/3/25.
//  Copyright © 2016年 hairong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LoopPageControl : NSObject

+ (LoopPageControl *)sharedManager;
- (UIPageControl *)createPageControl:(CGRect)frame
                       numberOfPages:(int)numberOfPages
              pageIndicatorTintColor:(UIColor *)pageIndicatorTintColor
       currentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColot;

@end
