//
//  CarNewsViewModel.m
//  CarHome
//
//  Created by tarena on 16/6/12.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import "CarNewsViewModel.h"

@implementation CarNewsViewModel

- (NSMutableArray<CarNewsResultNewslistModel *> *)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray new];
    }
    return _dataList;
}

- (NSInteger)rowNumber{
    return self.dataList.count;
}

- (CarNewsResultNewslistModel *)modelForRow:(NSInteger)row{
    return self.dataList[row];
}

- (NSURL *)iconURLForRow:(NSInteger)row{
    return [self modelForRow:row].smallPic.yx_URL;
}

- (NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}

- (NSString *)timeForRow:(NSInteger)row{
    return [self modelForRow:row].time;
}

- (NSString *)replyCountForRow:(NSInteger)row{
    NSInteger rc = [self modelForRow:row].replyCount;
    if (rc >= 10000) {
        return [NSString stringWithFormat:@"%.1f万评论", rc/ 10000.0];
    }
    return [NSString stringWithFormat:@"%ld评论", rc];
}

- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    //页数必须从1开始!
    NSInteger tmpPage = 1;
    if (requestMode == VMRequestModeMore) {
        tmpPage = _page + 1;
    }
    _dataTask = [TRNetManager getCarNews:tmpPage completionHandler:^(CarNewsModel *model, NSError *error) {
        if (!error) {
            if (requestMode == VMRequestModeRefresh) {
                [self.dataList removeAllObjects];
            }
            [self.dataList addObjectsFromArray:model.result.newsList];
            //页数的增加必须是在请求成功之后
            _page += tmpPage;
            _isLoadMore = model.result.isLoadMore;
            _focusList = model.result.focusImg;
        }
        !completionHandler ?: completionHandler(error);
    }];
}

- (NSInteger)headerNumber{
    return _focusList.count;
}

- (NSURL *)iconURLForHeaderAtIndex:(NSInteger)index{
    return _focusList[index].imgURL.yx_URL;
}

@end
