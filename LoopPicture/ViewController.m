//
//  ViewController.m
//  ScrollviewTu
//
//  Created by shoujizhifu on 16/3/10.
//  Copyright © 2016年 hairong. All rights reserved.
//

#import "ViewController.h"
#import "Loop.h"


@interface ViewController () {
    UIScrollView *pictureScrollView;
    NSArray *array;
    UIPageControl *pageControl;
}
@property (nonatomic,strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    array = [NSArray arrayWithObjects:@"h1.jpg",@"h2.jpg",@"h3.jpg",@"h4.jpg", nil];
    
    
    pictureScrollView = [[LoopPicture sharedManager] createLoopPictureFrame:CGRectMake(0, 100, self.view.frame.size.width, 200) imageArray:array];
    pictureScrollView.delegate = self;
    [self.view addSubview:pictureScrollView];
    
    pageControl = [[LoopPageControl sharedManager] createPageControl:CGRectMake(100, 300, 100, 20) numberOfPages:array.count pageIndicatorTintColor:[UIColor redColor] currentPageIndicatorTintColor:[UIColor blackColor]];
    [self.view addSubview:pageControl];
    
    [self startTimer];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)startTimer {
    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
- (void)stroTimer:(NSTimer *)timer {
    [timer invalidate];
    timer = nil;
}
- (void)nextPage {
    [[LoopPicture sharedManager] timerNextPage:pictureScrollView pageControl:pageControl arrayCount:array.count];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self stroTimer:self.timer];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self startTimer];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [[LoopPicture sharedManager] scrollViewDidEndDecelerating:pictureScrollView pageControl:pageControl arrayCount:array.count];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
