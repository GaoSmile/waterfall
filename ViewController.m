//
//  ViewController.m
//  demo
//
//  Created by bcnet on 16/8/11.
//  Copyright © 2016年 bcnet. All rights reserved.
//

#import "ViewController.h"

#define CJColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

#define CJRandomColor CJColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

// 获取屏幕 宽度、高度
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)

//导航栏的高对、tab按钮的高
#define kStatusBarHeight 20
#define kNavBarHeight 44
#define kNavStatusBarHeight (kStatusBarHeight+kNavBarHeight)

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

/** 结果控制器 **/
@property (nonatomic ,strong) UISearchController *searchVc;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"我是标题";
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    self.searchVc = [[UISearchController alloc] initWithSearchResultsController:[UIViewController new]];
    
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *view = [[UIVisualEffectView alloc] initWithEffect:blur];
    view.frame = CGRectMake(0, kNavStatusBarHeight, kScreenWidth, kScreenHeight - kNavStatusBarHeight);
    [self.searchVc.view addSubview:view];
    
    tableView.tableHeaderView = self.searchVc.searchBar;
    
}


#pragma mark - tableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 30;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.backgroundColor = CJRandomColor;
    return cell;
}

@end
