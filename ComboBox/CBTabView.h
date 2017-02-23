//
//  CBTabView.h
//  ComboBox
//
//  Created by pengpeng on 2017/2/14.
//  Copyright © 2017年 pengpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CBTabViewDelegate <NSObject>

- (void)selectedGroup:(NSInteger)type;

@end

@interface CBTabView : UIView

@property (nonatomic,weak) __weak id <CBTabViewDelegate> delegate;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, strong) UIButton * firButton;

@property (nonatomic, strong) UIButton * secButton;

@property (nonatomic, strong) UIView * lineView;

- (void)switchToTab:(NSInteger)tab; // 1  2


@end
