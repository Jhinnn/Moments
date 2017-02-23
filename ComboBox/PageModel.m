//
//  PageModel.m
//  ComboBox
//
//  Created by pengpeng on 2017/2/16.
//  Copyright © 2017年 pengpeng. All rights reserved.
//

#import "PageModel.h"
#import "ImageModel.h"
@implementation PageModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"image" : [ImageModel class]};
}


@end
