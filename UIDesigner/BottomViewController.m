//
//  BottomViewController.m
//  UIDesigner
//
//  Created by chendi on 2017/6/20.
//  Copyright © 2017年 chendi. All rights reserved.
//

#import "BottomViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kScrollViewItemNumber 2

@interface BottomViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation BottomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.scrollView];
    [self initSubView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.frame = (CGRect){0, 0, kScreenWidth, kScreenHeight - 300};
        _scrollView.contentSize = CGSizeMake(kScreenWidth * kScrollViewItemNumber,
                                             kScreenHeight - 300);
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
    }
    return _scrollView;
}

- (void)initSubView
{
    UIView *leftView = [[UIView alloc] init];
    leftView.backgroundColor = [UIColor cyanColor];
    leftView.frame = (CGRect){20, 0, kScreenWidth - 40, kScreenHeight - 300};
    [self.scrollView addSubview:leftView];
    
    UIView *rightView = [[UIView alloc] init];
    rightView.backgroundColor = [UIColor greenColor];
    rightView.frame = (CGRect){kScreenWidth + 20, 0, kScreenWidth - 40, kScreenHeight - 300};
    [self.scrollView addSubview:rightView];
    
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
