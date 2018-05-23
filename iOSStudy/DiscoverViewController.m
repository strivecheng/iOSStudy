//
//  MainViewController.m
//  HelloWorld
//
//  Created by strive cheng on 2018/5/15.
//  Copyright © 2018年 rbl. All rights reserved.
//

#import "DiscoverViewController.h"
#import "MessageTableViewCell.h"

@interface DiscoverViewController ()<UITableViewDelegate,UITableViewDataSource>

/** 注释 */
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *tableDataArr;

@end

static NSString *identifier =@"TableViewCell";


@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self loadData];
    
//    UINavigationBar *nb=[[UINavigationBar alloc ] init];
//    nb.frame = CGRectMake(0, 44,  [UIScreen mainScreen].bounds.size.width, 44);
//    nb.barStyle = UIBarStyleDefault;
//    nb.backgroundColor = [UIColor blackColor];
    self.navigationController.navigationBar.topItem.title = @"发现";
//    self.navigationController.navigationBar.backgroundColor = [UIColor blackColor];
//    self.navigationController.navigationBar.translucent = NO;
   
    [self.view addSubview:self.tableView];
//    [self.view addSubview:nb];
    
  
//注册方式添加cell
//    [self.tableView registerClass:NSClassFromString(@"UITableViewCell") forCellReuseIdentifier:identifier];
}

- (void)loadData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"discoverPageData.plist" ofType:nil];
    self.tableDataArr = [NSMutableArray arrayWithContentsOfFile:path];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.tableDataArr.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    NSArray *arr = [self.tableDataArr objectAtIndex:indexPath.section];
    NSDictionary *dy = arr[indexPath.row];
    
    NSString *title =[dy valueForKey:@"title"];
    NSLog(@"%@",title);
    NSString *image=[dy valueForKey:@"image"];
    NSLog(@"%@",image);
    cell.textLabel.text =title;
    cell.imageView.image = [UIImage imageNamed:image];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //    cell.imageView.frame.size = CGSizeMake(20, 20);
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray * arr = self.tableDataArr[section];
    return [arr count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (0 == section) {
        return 15;
    }else{
        return 20;
    }

}


//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    return nil;
//}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    NSString* sectionName;
//    switch(section){
//        default: sectionName = @"";
//    }
//    return sectionName;
//}

#pragma mark 懒加载

- (UITableView *)tableView{
    if (_tableView == nil) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,88, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAlways;
        
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        
        self.tableView.sectionFooterHeight = 0.1;
        
        self.tableView.estimatedRowHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
    }
    return _tableView;
    
}


@end
