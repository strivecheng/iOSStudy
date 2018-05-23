//
//  SearchResultViewController.m
//  HelloWorld
//
//  Created by strive cheng on 2018/5/22.
//  Copyright © 2018年 rbl. All rights reserved.
//

#import "SearchResultViewController.h"
#import "MessageTableViewCell.h"
#import "MessageInfo.h"

static NSString *identifier =@"msgTableViewCell";
@interface SearchResultViewController ()<UITableViewDelegate,UITableViewDataSource>


/** tableView */
@property (nonatomic,strong) UITableView *resultTableView;
/** 搜索出来的数据 */
@property (nonatomic,strong) NSMutableArray *resultDataArray;
/**  */
@property (nonatomic,strong) UISearchBar *searchBar;

@end

@implementation SearchResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view from its nib.
    if (self.resultDataArray!=nil) {
        [self.resultDataArray removeAllObjects];
    }
    [self.view addSubview:self.resultTableView];
    [self.resultTableView registerClass:NSClassFromString(@"MessageTableViewCell") forCellReuseIdentifier:identifier];

    self.resultTableView.contentInsetAdjustmentBehavior = YES;
    //下降searchBar的高度
    self.resultTableView.contentInset = UIEdgeInsetsMake(54, 0, 0, 0);

    self.automaticallyAdjustsScrollViewInsets = NO;//不加的话，table会下移


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)updateSearchResultsForSearchController:(nonnull UISearchController *)searchController {
    self.searchBar = searchController.searchBar;
    searchController.searchResultsController.view.hidden = NO;
    NSString *text = searchController.searchBar.text;
//    if(text.length==0){
//        return;
//    }
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"title CONTAINS %@", text];
    if (self.resultDataArray!=nil) {
        [self.resultDataArray removeAllObjects];
    }
    NSArray *filteredArray = [self.allDataArray filteredArrayUsingPredicate:predicate];

    for (MessageInfo *msg in filteredArray) {
        [self.resultDataArray addObject:msg];
    }
//    for (NSArray *ary in self.allDataArray) {
//        self.resultDataArray = [NSMutableArray arrayWithArray:[ary filteredArrayUsingPredicate:predicate]];
//    }
    
    //刷新表格
    [self.resultTableView reloadData];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MessageTableViewCell *cell = [self.resultTableView dequeueReusableCellWithIdentifier:identifier];
//    if (cell == nil) {
//        cell = [[MessageTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
//    }
    MessageInfo *msg = [self.resultDataArray objectAtIndex:indexPath.row];
    cell.message = msg;
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.resultDataArray.count;
}

- (UITableView *) resultTableView{
    if (!_resultTableView) {
        self.resultTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        self.resultTableView.dataSource = self;
        self.resultTableView.delegate = self;
    }
    return _resultTableView;
}

-(NSMutableArray *)resultDataArray{
    if (!_resultDataArray) {
        _resultDataArray = [[NSMutableArray alloc] init];
    }
    return _resultDataArray;
}

@end
