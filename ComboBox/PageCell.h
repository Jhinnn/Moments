//
//  PageCell.h
//  ComboBox
//
//  Created by pengpeng on 2017/2/16.
//  Copyright © 2017年 pengpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PYPhotosView;
@class PageModel;
@class PageCell;

@protocol PageCellDelegate <NSObject>

@optional

- (void)onPressHeadImage:(PageCell *)cell;

@end



@interface PageCell : UITableViewCell {
    
    __weak IBOutlet UIImageView *_userImg;
    __weak IBOutlet UILabel *_userNameLabel;
    __weak IBOutlet UILabel *_contentLabel;
    __weak IBOutlet PYPhotosView *_photosView;
  
    __weak IBOutlet NSLayoutConstraint *_bottomConstraint;
    
    __weak IBOutlet NSLayoutConstraint *_imageRightConstraint;
   
    __weak IBOutlet NSLayoutConstraint *_imageHeightConstraint;
}

@property (nonatomic,assign) PageModel *model;

@property (nonatomic,weak) __weak id <PageCellDelegate> delegate;
@end
