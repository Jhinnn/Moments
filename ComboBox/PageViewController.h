//
//  PageViewController.h
//  ComboBox
//
//  Created by pengpeng on 2017/2/16.
//  Copyright © 2017年 pengpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DynamicType) {
    DynamicTypeNew = 1,
    DynamicTypeHot,
    DynamicTypeFollowed,
    DynamicTypeFriends
};

@interface PageViewController : UIViewController

@property (nonatomic, assign) DynamicType dynamicType;



@end
