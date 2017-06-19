//
//  HeadViewController.m
//  UIDesigner
//
//  Created by chendi on 2017/6/19.
//  Copyright © 2017年 chendi. All rights reserved.
//

#import "HeadViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kScrollViewItemNumber 2

@interface HeadViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation HeadViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.10 green:0.63 blue:0.93 alpha:1.00];
    [self.view addSubview:self.scrollView];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
