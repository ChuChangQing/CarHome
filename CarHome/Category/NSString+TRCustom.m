//
//  NSString+TRCustom.m
//  BestGroup
//
//  Created by jiyingxin on 16/6/8.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import "NSString+TRCustom.h"

@implementation NSString (TRCustom)
- (NSURL *)yx_URL{
    return [NSURL URLWithString:self];
}
@end
