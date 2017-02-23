//
//  MyDataService.m
//  GongFuYaYi
//
//  Created by pengpeng on 16/2/22.
//  Copyright © 2016年 徐佳鹏. All rights reserved.
//

#import "MyDataService.h"
#import "AFNetworking.h"
@implementation MyDataService

+ (NSURLSessionDataTask *)requestURL:(NSString *)urlstring
                          httpMethod:(NSString *)method
                              params:(NSDictionary *)params
                          completion:(void(^)(id result,NSError *error))block {
    //1.拼接url
    //1.拼接URL
    NSString *url = [BASE_URL stringByAppendingString:urlstring];
    NSMutableString *mutableParmas = params.mutableCopy;
    if (mutableParmas == nil) {
        mutableParmas = @{}.mutableCopy;
    }
    //创建session对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer=[AFJSONRequestSerializer serializer];//申明请求的数据是json类型
    //判断请求方式
    if ([method caseInsensitiveCompare:@"GET"] == NSOrderedSame) {
        NSURLSessionDataTask *task = [manager GET:url parameters:mutableParmas progress:^(NSProgress * _Nonnull downloadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            block(responseObject,nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            block(nil,error);
        }];
        return task;
    }
    else if ([method caseInsensitiveCompare:@"POST"] == NSOrderedSame) {
        NSURLSessionDataTask *task = [manager POST:url parameters:mutableParmas progress:^(NSProgress * _Nonnull uploadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            block(responseObject,nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            block(nil,error);
        }];
        return task;
    }
    else if ([method caseInsensitiveCompare:@"PUT"] == NSOrderedSame) {
        NSURLSessionDataTask *task = [manager PUT:url parameters:mutableParmas success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            block(responseObject,nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            block(nil,error);
        }];
        return task;
    }
    return nil;
}


@end
