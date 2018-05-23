//
//  MessageViewController.m
//  HelloWorld
//
//  Created by strive cheng on 2018/5/22.
//  Copyright © 2018年 rbl. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageInfo.h"
#import "MessageTableViewCell.h"
#import "SearchResultViewController.h"



static NSString *identifier =@"TableViewCell";

@interface MessageViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchControllerDelegate,UISearchBarDelegate>

/** tableView */
@property (nonatomic,strong) UITableView *messageTableView;
/** tableView里面的数据 */
@property (nonatomic,strong) NSMutableArray *messageArray;
/** searchViewController */
@property (nonatomic,strong) UISearchController *searchController;
/** 搜索结果的view */
@property (nonatomic,strong) SearchResultViewController *searchResultVc;

@end

@implementation MessageViewController

- (NSMutableArray *)messageArray{
    if (!_messageArray) {
        _messageArray = [[NSMutableArray alloc] init];
        for (int i=0; i<30; i++) {
            MessageInfo *msg = [[MessageInfo alloc]init];
            msg.title = [NSString stringWithFormat:@"周杰伦%d", i];
            msg.time = @"12:66";
            msg.lastMessage = [NSString stringWithFormat:@"你好，我是周杰伦%d", i];
            [_messageArray addObject:msg];
        }
    }
    return _messageArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"微信";
    [self.view addSubview:self.messageTableView];
    self.messageTableView.tableHeaderView = self.searchController.searchBar;
//    [self.messageTableView registerClass:NSClassFromString(@"MessageTableViewCell") forCellReuseIdentifier:identifier];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MessageTableViewCell *cell = [self.messageTableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[MessageTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    MessageInfo *msg = [self.messageArray objectAtIndex:indexPath.row];
    cell.message = msg;
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.messageArray.count;
}


#pragma mark - UISearchControllerDelegate代理
//测试UISearchController的执行过程

- (void)willPresentSearchController:(UISearchController *)searchController
{
    NSLog(@"willPresentSearchController");
}

- (void)didPresentSearchController:(UISearchController *)searchController
{
    NSLog(@"didPresentSearchController");
}

- (void)willDismissSearchController:(UISearchController *)searchController
{
    NSLog(@"willDismissSearchController");
}

- (void)didDismissSearchController:(UISearchController *)searchController
{
    NSLog(@"didDismissSearchController");
}

- (void)presentSearchController:(UISearchController *)searchController
{
    NSLog(@"presentSearchController");
}

# pragma mark 懒加载

- (UITableView *) messageTableView{
    if (!_messageTableView) {
        self.messageTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        self.messageTableView.dataSource = self;
        self.messageTableView.delegate = self;
    }
    return _messageTableView;
}

- (UISearchController *)searchController{
    if (!_searchController) {
        _searchController = [[UISearchController alloc]initWithSearchResultsController:self.searchResultVc];
        _searchController.searchResultsUpdater = self.searchResultVc;
        [_searchController.searchBar sizeToFit];
        _searchController.delegate = self;
        _searchController.searchBar.delegate = self;
        _searchController.searchBar.placeholder = @"搜索";
        _searchController.searchBar.barTintColor = [UIColor colorWithRed:205/225.0 green:205/225.0 blue:205/225.0 alpha:1.0];
        _searchController.hidesBottomBarWhenPushed = YES;
    
    }
    return _searchController;
}

- (SearchResultViewController *)searchResultVc{
    if (!_searchResultVc) {
        _searchResultVc = [[SearchResultViewController alloc] init];
        _searchResultVc.allDataArray = self.messageArray;
        //        self.searchResultVc. = self.searchController.searchBar;
        
    }
    return _searchResultVc;
}


@end
