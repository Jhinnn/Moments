//
//  PageViewController.m
//  ComboBox
//
//  Created by pengpeng on 2017/2/16.
//  Copyright © 2017年 pengpeng. All rights reserved.
//

#import "PageViewController.h"
#import "MyDataService.h"
#import "PageModel.h"
#import "PageCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
@interface PageViewController () <UITableViewDelegate,UITableViewDataSource,PageCellDelegate> {
    NSMutableArray *dataArray;
    NSString *indetity;
}

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic, assign) NSInteger newfeedsListPage;
@property (nonatomic, assign) NSInteger hotfeedsListPage;
@property (nonatomic, assign) NSInteger fowllowfeedsListPage;
@property (nonatomic, assign) NSInteger firendsfeedsListPage;

@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];;
   
    self.view.backgroundColor = [UIColor whiteColor];
    

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64 - 36) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = 500;
    _tableView.tableFooterView = [UIView new];
    [self.view addSubview:_tableView];
    
    indetity = @"cell";
    [_tableView registerNib:[UINib nibWithNibName:@"PageCell" bundle:nil] forCellReuseIdentifier:indetity];
    
    //添加下拉刷新控件
    MJRefreshNormalHeader * header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(bee_headerRefresh)];
    _tableView.mj_header = header;
    
    //进入页面显示刷新
    [_tableView.mj_header beginRefreshing];
    
}

#pragma mark --刷新列表
- (void)bee_headerRefresh {
    NSDictionary *param = @{
                            @"uid":@"1000024",
                            @"type":@"1"
                            };
    dataArray = @[].mutableCopy;
    [MyDataService requestURL:@"track/track_list" httpMethod:@"GET" params:param completion:^(id result, NSError *error) {
        [_tableView.mj_header endRefreshing];
        NSArray *array = [result objectForKey:@"data"];
        [array enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL * _Nonnull stop) {
            
            PageModel *model = [PageModel yy_modelWithJSON:dic];
            [dataArray addObject:model];
            
        }];
        [self.tableView reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PageCell *cell = [tableView dequeueReusableCellWithIdentifier:indetity forIndexPath:indexPath];
    cell.delegate = self;
    [self setupModelOfCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)setupModelOfCell:(PageCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    // 采用计算frame模式还是自动布局模式，默认为NO，自动布局模式
    //        cell.fd_enforceFrameLayout = YES;
    cell.model = dataArray[indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView fd_heightForCellWithIdentifier:indetity cacheByIndexPath:indexPath configuration:^(PageCell *cell)
            {
                [self setupModelOfCell:cell atIndexPath:indexPath];
            }];
}


- (void)onPressHeadImage:(PageCell *)cell {
    NSLog(@"点击头像了");
}



@end
