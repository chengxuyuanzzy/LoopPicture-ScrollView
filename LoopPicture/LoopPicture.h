//
//  LoopPicture.h
//  ScrollviewTu
//
//  Created by shoujizhifu on 16/3/10.
//  Copyright © 2016年 hairong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LoopPicture : NSObject

@property (nonatomic, strong) UIScrollView *pictureScrollView;

+ (LoopPicture *)sharedManager;
- (UIScrollView *)createLoopPictureFrame:(CGRect)frame
                              imageArray:(NSArray *)imageArray;
- (void)timerNextPage:(UIScrollView *)scrollView
          pageControl:(UIPageControl *)pageControl
           arrayCount:(int)arrayCount;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
                         pageControl:(UIPageControl *)pageControl
                          arrayCount:(int)arrayCount;

@end
