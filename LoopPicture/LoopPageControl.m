//
//  LoopPageControl.m
//  ScrollviewTu
//
//  Created by shoujizhifu on 16/3/25.
//  Copyright © 2016年 hairong. All rights reserved.
//

#import "LoopPageControl.h"

@implementation LoopPageControl

+ (LoopPageControl *)sharedManager {
    static LoopPageControl *sharedAccountManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[self alloc] init];
    });
    return sharedAccountManagerInstance;
}

- (UIPageControl *)createPageControl:(CGRect)frame
                       numberOfPages:(int)numberOfPages
              pageIndicatorTintColor:(UIColor *)pageIndicatorTintColor
       currentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColot {
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:frame];
    pageControl.numberOfPages = numberOfPages;
    pageControl.pageIndicatorTintColor = pageIndicatorTintColor;
    pageControl.currentPageIndicatorTintColor = currentPageIndicatorTintColot;
    return pageControl;
}

@end
