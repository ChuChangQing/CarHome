//
//  NSObject+Parse.h
//  HappyBuy
//
//  Created by tarena on 16/3/30.
//  Copyright © 2016年 tedu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <NSObject+YYModel.h>

@interface NSObject (Parse)<YYModel>

+ (id)parseJSON:(id)json;

@end









