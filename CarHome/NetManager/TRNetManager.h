//
//  TRNetManager.h
//  BestGroup
//
//  Created by jiyingxin on 16/6/8.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CarNewsModel.h"
@interface TRNetManager : NSObject

+ (id)getCarNews:(NSInteger)page completionHandler:(void(^)(CarNewsModel *model, NSError *error))completionHandler;

@end
