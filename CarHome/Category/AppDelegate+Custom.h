//
//  AppDelegate+Custom.h
//  BestGroup
//
//  Created by jiyingxin on 16/6/8.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (Custom)

- (void)addCustomGlobalConfig;

@property (nonatomic, readonly, getter=isOnLine) BOOL onLine;

@end
