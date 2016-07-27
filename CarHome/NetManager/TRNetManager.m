//
//  TRNetManager.m
//  BestGroup
//
//  Created by jiyingxin on 16/6/8.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import "TRNetManager.h"

@implementation TRNetManager

+ (id)getCarNews:(NSInteger)page completionHandler:(void (^)(CarNewsModel *, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:kNewsListPath, page];
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([CarNewsModel parseJSON:jsonObject], error);
    }];
}

@end
