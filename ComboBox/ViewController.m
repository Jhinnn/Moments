//
//  ViewController.m
//  ComboBox
//
//  Created by pengpeng on 16/3/24.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import "ViewController.h"
#import "CBTabView.h"
#import "AViewController.h"
#import "BViewController.h"
#import "UIScrollView+Pages.h"



@interface ViewController () <CBTabViewDelegate,UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
   
    CBTabView *titleView = [[CBTabView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth - 120, 40)];
    titleView.delegate = self;
    self.navigationItem.titleView = titleView;
    
    [self.view addSubview:self.scrollView];
    
    AViewController *aVC = [[AViewController alloc] init];
    [self addChildViewController:aVC];
    
    BViewController *bVC = [[BViewController alloc] init];
    [self addChildViewController:bVC];
    
    aVC.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [self.scrollView addSubview:aVC.view];
    
    bVC.view.frame = CGRectMake(kScreenWidth, 0, kScreenWidth, kScreenHeight);
    [self.scrollView addSubview:bVC.view];
}

- (void)selectedGroup:(NSInteger)type {
    if (type == 1) {
        [_scrollView setPageX:0 animated:YES];
    }else {
        [_scrollView setPageX:1 animated:YES];
    }
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (self.scrollView == scrollView) {
        NSInteger page = scrollView.contentOffset.x / kScreenWidth;
        [((CBTabView *)self.navigationItem.titleView) switchToTab:page + 1];
    }
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.frame = self.view.bounds;
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.bounces = NO;
        _scrollView.contentSize = CGSizeMake(kScreenWidth * 2, kScreenHeight - 64);
    }
    return _scrollView;
}






@end
