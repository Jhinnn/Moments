//
//  ImageModel.h
//  ComboBox
//
//  Created by pengpeng on 2017/2/21.
//  Copyright © 2017年 pengpeng. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ImageModel : NSObject <YYModel>

@property (nonatomic,copy) NSString *img_url;
@property (nonatomic,copy) NSString *img_small_url;

@end
