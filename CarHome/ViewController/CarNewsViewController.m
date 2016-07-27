//
//  CarNewsViewController.m
//  CarHome
//
//  Created by tarena on 16/6/12.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import "CarNewsViewController.h"
#import "CarNewsCell.h"
#import "CarNewsViewModel.h"

@interface CarNewsViewController ()
@property (nonatomic) CarNewsViewModel *carNewsVM;
@end

@implementation CarNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"汽车之家";
    self.tableView.rowHeight = 70;
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerClass:[CarNewsCell class] forCellReuseIdentifier:@"CarNewsCell"];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.carNewsVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
            
            if (error) {
                DDLogError(@"%@", error);
            }else{
                [self.tableView reloadData];
                if (self.carNewsVM.isLoadMore) {
                    [self.tableView.mj_footer resetNoMoreData];
                }else{
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }
            }
            [self.tableView.mj_header endRefreshing];
        }];
    }];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.carNewsVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
            [self.tableView.mj_footer endRefreshing];
            if (error) {
                DDLogError(@"%@", error);
            }else{
                [self.tableView reloadData];
                if (!self.carNewsVM.isLoadMore) {
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }
            }
            
        }];
    }];
    
    [self.tableView.mj_header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.carNewsVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CarNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CarNewsCell" forIndexPath:indexPath];
    NSInteger row = indexPath.row;
    [cell.iconIV sd_setImageWithURL:[self.carNewsVM iconURLForRow:row] placeholderImage:[UIImage imageNamed:@"AV_slider_thumb4"]];
    cell.titleLb.text = [self.carNewsVM titleForRow:row];
    cell.timeLb.text = [self.carNewsVM timeForRow:row];
    cell.replyCountLb.text = [self.carNewsVM replyCountForRow:row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
#pragma mark - LazyLoad 懒加载
- (CarNewsViewModel *)carNewsVM {
    if(_carNewsVM == nil) {
        _carNewsVM = [[CarNewsViewModel alloc] init];
    }
    return _carNewsVM;
}

@end
