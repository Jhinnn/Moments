//
//  PageCell.m
//  ComboBox
//
//  Created by pengpeng on 2017/2/16.
//  Copyright © 2017年 pengpeng. All rights reserved.
//

#import "PageCell.h"
#import "PageModel.h"
#import "ImageModel.h"
#import "PYPhotosView.h"
#import "UIImageView+WebCache.h"
@implementation PageCell

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        _photosView.scrollEnabled = NO;
        [self addEvent];
    }
    return self;
}

- (void)addEvent {
    self.imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showDetail)];
    [self addGestureRecognizer:tap];
}

- (void)showDetail {
    if (_delegate && [_delegate respondsToSelector:@selector(onPressHeadImage:)]) {
        [_delegate onPressHeadImage:self];
    }
}




- (void)setModel:(PageModel *)model {
    _model = model;

    [_userImg sd_setImageWithURL:[NSURL URLWithString:_model.head]];
    
    _userNameLabel.text = _model.nickname;
    _contentLabel.text = _model.content;
    
    NSMutableArray *smallUrlArray = @[].mutableCopy;
    NSMutableArray *bigUrlArray = @[].mutableCopy;
    
    
    NSInteger count = _model.image.count;
    
    if (count == 0) {
        _bottomConstraint.constant = 0;
        _imageHeightConstraint.constant = 0;
        _photosView.hidden = YES;
    }else {
        _photosView.hidden = NO;
        _bottomConstraint.constant = 10;
        if (count <= 3) {
            _imageHeightConstraint.constant = _photosView.photoWidth;
            if (count == 1) {
                _imageRightConstraint.constant = (kScreenWidth - _photosView.mj_x + 20) / 3 * 2 ;
            }
        }
        else if (count >3 && count <= 6) {
            _imageHeightConstraint.constant = _photosView.photoWidth * 2;
        }else {
            _imageHeightConstraint.constant = _photosView.photoWidth * 3;
        }
    
    }
    
    [_model.image enumerateObjectsUsingBlock:^(ImageModel  *model, NSUInteger idx, BOOL * _Nonnull stop) {
        [smallUrlArray addObject:model.img_small_url];
        [bigUrlArray addObject:model.img_url];
    }];

    _photosView.thumbnailUrls = smallUrlArray;
    _photosView.originalUrls = bigUrlArray;
    
    
}



@end
