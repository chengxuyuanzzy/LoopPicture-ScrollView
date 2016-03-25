//
//  LoopPicture.m
//  ScrollviewTu
//
//  Created by shoujizhifu on 16/3/10.
//  Copyright © 2016年 hairong. All rights reserved.
//

#import "LoopPicture.h"

@implementation LoopPicture

+ (LoopPicture *)sharedManager {
    static LoopPicture *sharedAccountManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[self alloc] init];
    });
    return sharedAccountManagerInstance;
}

- (UIScrollView *)createLoopPictureFrame:(CGRect)frame
                              imageArray:(NSArray *)imageArray {
    //创建scrollview
    self.pictureScrollView = [[UIScrollView alloc] initWithFrame:frame];
    self.pictureScrollView.showsHorizontalScrollIndicator = NO;
    self.pictureScrollView.showsVerticalScrollIndicator = NO;
    self.pictureScrollView.pagingEnabled = YES;
    self.pictureScrollView.bounces = NO;
    self.pictureScrollView.contentSize = CGSizeMake(frame.size.width*(imageArray.count+2), 0);
    //创建UIimageview
    for (int i=0; i<imageArray.count+2; i++) {
        UIImageView *loopImageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*self.pictureScrollView.frame.size.width, 0, self.pictureScrollView.frame.size.width, self.pictureScrollView.frame.size.height)];
        loopImageView.clipsToBounds = YES;
        loopImageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.pictureScrollView addSubview:loopImageView];
        if (i==0) {
            NSString *img = [imageArray lastObject];
            loopImageView.image = [UIImage imageNamed:img];
        }else if (i == imageArray.count+1) {
            NSString *img = [imageArray firstObject];
            loopImageView.image = [UIImage imageNamed:img];
        }else {
            NSString *img = imageArray[i-1];
            loopImageView.image = [UIImage imageNamed:img];
        }
    }
    return self.pictureScrollView;
}
- (void)timerNextPage:(UIScrollView *)scrollView
          pageControl:(UIPageControl *)pageControl
           arrayCount:(int)arrayCount {
    CGPoint point = scrollView.contentOffset;
    point.x = point.x + scrollView.frame.size.width;
    [UIView animateWithDuration:0.5 animations:^{
        scrollView.contentOffset = point;
    }completion:^(BOOL finished) {
        if (scrollView.contentOffset.x/scrollView.frame.size.width == pageControl.numberOfPages) {
            scrollView.contentOffset = CGPointZero;
        }
    }];
    pageControl.currentPage = scrollView.contentOffset.x/scrollView.frame.size.width-1;
    
    if (scrollView.contentOffset.x == 0) {
        scrollView.contentOffset = CGPointMake(scrollView.frame.size.width*arrayCount, 0);
    }else if (scrollView.contentOffset.x == scrollView.frame.size.width *(arrayCount+1)) {
        scrollView.contentOffset = CGPointMake(scrollView.frame.size.width, 0);
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
                         pageControl:(UIPageControl *)pageControl
                          arrayCount:(int)arrayCount {
    if (scrollView.contentOffset.x == 0) {
        scrollView.contentOffset = CGPointMake(scrollView.frame.size.width*arrayCount, 0);
    }else if (scrollView.contentOffset.x == scrollView.frame.size.width * (arrayCount+1)) {
        scrollView.contentOffset = CGPointMake(scrollView.frame.size.width, 0);
    }
    int currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
    if (currentPage == 0) {
        pageControl.currentPage = arrayCount-1;
    }else if (currentPage == arrayCount+1) {
        pageControl.currentPage = 0;
    }else {
        pageControl.currentPage = currentPage-1;
    }
}
@end
