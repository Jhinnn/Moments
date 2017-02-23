//
//  CBTabView.m
//  ComboBox
//
//  Created by pengpeng on 2017/2/14.
//  Copyright © 2017年 pengpeng. All rights reserved.
//

#import "CBTabView.h"
#import "Masonry.h"
@implementation CBTabView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    self.backgroundColor = [UIColor clearColor];
    UIButton *findPersonBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    findPersonBtn.tag = 1;
    [findPersonBtn setTitle:@"动态" forState:UIControlStateNormal];
    [findPersonBtn addTarget:self action:@selector(tabBtnSwitch:) forControlEvents:UIControlEventTouchUpInside];
    findPersonBtn.selected = YES;
    _type = 1;
    [self addSubview:findPersonBtn];
    self.firButton = findPersonBtn;
    
    UIButton *findGroupBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    findGroupBtn.tag = 2;
    [findGroupBtn setTitle:@"秀场" forState:UIControlStateNormal];
    [findGroupBtn addTarget:self action:@selector(tabBtnSwitch:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:findGroupBtn];
    self.secButton = findGroupBtn;
    
    UIView *singleView = [[UIView alloc] init];
    singleView.backgroundColor = [UIColor whiteColor];
    self.lineView = singleView;
    [self addSubview:singleView];
    
    [findPersonBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(0);
        make.right.mas_equalTo(findGroupBtn.mas_left);
        make.width.equalTo(findGroupBtn.mas_width);
    }];
    
    [findGroupBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.mas_equalTo(0);
        make.left.mas_equalTo(findPersonBtn.mas_right);
    }];
    
    
    [singleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(1);
        make.bottom.mas_equalTo(self);
        make.centerX.equalTo(findPersonBtn.mas_centerX);
    }];
    
    
}

- (void)tabBtnSwitch:(UIButton *)btn {
    if (btn.selected) {
        return;
    }
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UIButton class]]) {
            ((UIButton *)obj).selected = NO;
        }
    }];
    
    btn.selected = YES;
    _type = btn.tag;
    

    [UIView animateWithDuration:0.3 animations:^{
        [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(1);
            make.bottom.mas_equalTo(self);
            make.centerX.equalTo(btn.mas_centerX);
        }];
        
    }];
    
    if ([self.delegate respondsToSelector:@selector(selectedGroup:)]) {
        [self.delegate selectedGroup:btn.tag];
    }
}

- (void)switchToTab:(NSInteger)tab {
    if (tab == 1) {
        [self.firButton sendAction:@selector(tabBtnSwitch:) to:self forEvent:[UIEvent new]];
    }else if (tab == 2) {
        [self.secButton sendAction:@selector(tabBtnSwitch:) to:self forEvent:[UIEvent new]];
    }
}


@end
