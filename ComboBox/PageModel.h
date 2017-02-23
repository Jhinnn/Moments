//
//  PageModel.h
//  ComboBox
//
//  Created by pengpeng on 2017/2/16.
//  Copyright © 2017年 pengpeng. All rights reserved.
//

#import "PageModel.h"
@class  ImageModel;
@interface PageModel : NSObject

@property (nonatomic,copy) NSString *head;
@property (nonatomic,copy) NSString *nickname;
@property (nonatomic,copy) NSString *content;
@property (nonatomic,assign) NSInteger comment;
@property (nonatomic,copy) NSString *addtime;
@property (nonatomic,assign) NSInteger *is_like;
@property (nonatomic,strong) NSArray <ImageModel *>*image;

@end


