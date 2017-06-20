//
//  MainViewController.m
//  UIDesigner
//
//  Created by chendi on 2017/6/19.
//  Copyright © 2017年 chendi. All rights reserved.
//

#import "MainViewController.h"
#import "HeadViewController.h"
#import "BottomViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HeadViewController *headVC = [[HeadViewController alloc] init];
    [self addChildViewController:headVC];
    headVC.view.frame = (CGRect){0, 0, kScreenWidth, 300};
    [self.view addSubview:headVC.view];
    [headVC didMoveToParentViewController:self];
    
    BottomViewController *bottomVC = [[BottomViewController alloc] init];
    [self addChildViewController:bottomVC];
    bottomVC.view.frame = (CGRect){0, 300, kScreenWidth, kScreenHeight - 300};
    [self.view addSubview:bottomVC.view];
    [bottomVC didMoveToParentViewController:self];
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
