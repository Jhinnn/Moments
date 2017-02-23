//
//  AViewController.m
//  ComboBox
//
//  Created by pengpeng on 2017/2/15.
//  Copyright © 2017年 pengpeng. All rights reserved.
//

#import "AViewController.h"
#import "TYTabButtonPagerController.h"
#import "PageViewController.h"


@interface AViewController () <TYPagerControllerDataSource>

@property (nonatomic, strong) TYTabButtonPagerController *pageController;
@property (nonatomic, copy) NSArray *titleArray;

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.titleArray = @[@"最新动态", @"热门动态", @"关注动态", @"好友动态"];
    self.pageController.view.bounds = self.view.bounds;
    [self addChildViewController:self.pageController];
    [self.view addSubview:self.pageController.view];
}

- (NSInteger)numberOfControllersInPagerController {
    return self.titleArray.count;
}

- (NSString *)pagerController:(TYPagerController *)pagerController titleForIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (UIViewController *)pagerController:(TYPagerController *)pagerController controllerForIndex:(NSInteger)index {
    PageViewController *pageVC = [[PageViewController alloc] init];
    pageVC.dynamicType = index + 1;
    return pageVC;
}





- (TYTabButtonPagerController *)pageController {
    if (!_pageController) {
        _pageController = [[TYTabButtonPagerController alloc] init];
        _pageController.dataSource = self;
        _pageController.barStyle = TYPagerBarStyleProgressView;
        _pageController.cellWidth = self.titleArray.count * 65 > kScreenWidth ? 65 : kScreenWidth / self.titleArray.count;
        _pageController.normalTextFont = [UIFont systemFontOfSize:13];
        _pageController.selectedTextFont = [UIFont systemFontOfSize:13];
        _pageController.normalTextColor = [UIColor grayColor];
        _pageController.selectedTextColor = [UIColor redColor];
        _pageController.progressColor = [UIColor redColor];
    }
    return _pageController;
}





@end
