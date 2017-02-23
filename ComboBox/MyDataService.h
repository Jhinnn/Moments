//
//  MyDataService.h
//  GongFuYaYi
//
//  Created by pengpeng on 16/2/22.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyDataService : NSObject


+ (NSURLSessionDataTask *)requestURL:(NSString *)urlstring
                          httpMethod:(NSString *)method
                              params:(NSDictionary *)params
                          completion:(void(^)(id result,NSError *error))block;
@end
