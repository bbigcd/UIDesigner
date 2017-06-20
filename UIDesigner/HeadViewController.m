//
//  HeadViewController.m
//  UIDesigner
//
//  Created by chendi on 2017/6/19.
//  Copyright © 2017年 chendi. All rights reserved.
//

#import "HeadViewController.h"
#import "BottomViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kScrollViewItemNumber 2

@interface HeadViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) BottomViewController *bottomVC;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) BOOL show;

@end

@implementation HeadViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.10 green:0.63 blue:0.93 alpha:1.00];
    [self.view addSubview:self.scrollView];
    self.bottomVC = [[BottomViewController alloc] init];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(scrollHeadView) userInfo:nil repeats:YES];
    _show = YES;
    [self initSubView];
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.frame = (CGRect){0, 0, kScreenWidth, 300};
        _scrollView.contentSize = CGSizeMake(kScreenWidth * kScrollViewItemNumber,
                                             300);
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
    }
    return _scrollView;
}

- (void)initSubView
{
    UIImageView *leftView = [[UIImageView alloc] init];
    leftView.image = [UIImage imageNamed:@"head_left"];
    leftView.frame = (CGRect){20, 20, kScreenWidth - 40 , 260};
    [self.scrollView addSubview:leftView];
    
    UIImageView *rightView = [[UIImageView alloc] init];
    rightView.image = [UIImage imageNamed:@"head_right"];
    rightView.frame = (CGRect){kScreenWidth + 20, 20, kScreenWidth - 40, 260};
    [self.scrollView addSubview:rightView];
    
}

- (void)scrollHeadView
{
    if(_show){
        [self.scrollView setContentOffset:CGPointMake(kScreenWidth, 0) animated:YES];
    }else{
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    _show = !_show;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    CGFloat width = scrollView.frame.size.width;
    CGFloat offsetX = scrollView.contentOffset.x;
    NSInteger index = offsetX / width;

    // 发送通知 头部的当前的展示图发送给bottomVC
    NSString *indexString = [NSString stringWithFormat:@"%ld",index];
    NSNotification *notice = [NSNotification notificationWithName:@"test" object:nil userInfo:@{@"currentIndex":indexString}];
    [[NSNotificationCenter defaultCenter] postNotification:notice];
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //调用上面的方法
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

/**
 *  只要scrollView在滚动，就会调用该协议方法
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_timer invalidate];//销毁计时器
    _timer = nil;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
