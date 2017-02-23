//
//  BViewController.m
//  ComboBox
//
//  Created by pengpeng on 2017/2/15.
//  Copyright © 2017年 pengpeng. All rights reserved.
//

#import "BViewController.h"
#import <Contacts/Contacts.h>
#import "MyDataService.h"
@interface BViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray *contachArray;

@end

@implementation BViewController {
    UITableView *_tableView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getAuthorize];
    
    [self getContacts];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(uploadAction)];
    self.navigationItem.leftBarButtonItem = barItem;
    
}

- (void)getAuthorize {
    if ([CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts] == CNAuthorizationStatusNotDetermined) {
        CNContactStore *store = [[CNContactStore alloc] init];
        [store requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (granted) { //成功
                NSLog(@"授权成功");
            } else {
                NSLog(@"授权失败");
            }
        }];
    }
}


- (void)uploadAction {
//    NSDictionary *param = @{
//                            @"uid":@"1000024",
//                            @"phonebook":[self stringTOjson:self.contachArray]
//                            };

    
//    [MyDataService requestURL:@"phonebook/index" httpMethod:@"POST" params:param completion:^(id result, NSError *error) {
//        NSLog(@"%@",[result objectForKey:@"status"]);
//    }];
}




//获得联系人信息
- (void)getContacts {
    // 获取联系人仓库
    CNContactStore *store = [[CNContactStore alloc] init];
    
    //创建联系人信息的请求对象
    NSArray *keys = @[CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey];
    
    //根据请求Key, 创建请求对象
    CNContactFetchRequest *request = [[CNContactFetchRequest alloc] initWithKeysToFetch:keys];
    
    //发送请求
    self.contachArray = @[].mutableCopy;
    [store enumerateContactsWithFetchRequest:request error:nil usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop) {
        
        // 获取姓名
        NSString *givenName = contact.givenName;
        NSString *familyName = contact.familyName;
        NSString *friendName = [NSString stringWithFormat:@"%@%@",familyName,givenName];
        
        // 获取电话(第一个电话号码)
        NSArray *phoneArray = contact.phoneNumbers;
        CNLabeledValue *labelValue = [phoneArray firstObject];
        CNPhoneNumber *number = labelValue.value;
        
        NSString *friendPhone = @"";
        if (number.stringValue.length > 0) {
            NSArray *array = [number.stringValue componentsSeparatedByString:@"-"];
            friendPhone = [array componentsJoinedByString:@""];//分隔符逗号
        }else {
            friendPhone = @"不详";
        }
        
        NSDictionary *tempDic = @{@"friend_name":friendName,@"friend_phone":friendPhone};
        [self.contachArray addObject:tempDic];
    }];
//    [_tableView reloadData];
}

/*
 [{"friend_name":"好友名称","friend_phone":"好友手机号"},{"friend_name":"好友名称","friend_phone":"好友手机号"}]
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contachArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseID];
    }
    
    NSDictionary *tempDic = [self.contachArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [tempDic objectForKey:@"friend_name"];
    cell.detailTextLabel.text = [tempDic objectForKey:@"friend_phone"];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self uploadAction];

}



@end
