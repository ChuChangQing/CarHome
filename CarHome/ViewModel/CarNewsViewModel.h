//
//  CarNewsViewModel.h
//  CarHome
//
//  Created by tarena on 16/6/12.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRBaseViewModel.h"
#import "TRNetManager.h"

@interface CarNewsViewModel : TRBaseViewModel
@property (nonatomic, readonly) NSInteger rowNumber;
- (NSURL *)iconURLForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)timeForRow:(NSInteger)row;
- (NSString *)replyCountForRow:(NSInteger)row;
- (CarNewsResultNewslistModel *)modelForRow:(NSInteger)row;

//头部滚动栏
- (NSURL *)iconURLForHeaderAtIndex:(NSInteger)index;
@property (nonatomic) NSInteger headerNumber;
@property (nonatomic) NSArray<CarNewsResultFocusimgModel *> *focusList;

@property (nonatomic) NSMutableArray<CarNewsResultNewslistModel *> *dataList;
@property (nonatomic) NSInteger page;
//有更多页
@property (nonatomic) BOOL isLoadMore;
@end









