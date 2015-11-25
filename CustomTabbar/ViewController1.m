//
//  ViewController1.m
//  CustomTabbar
//
//  Created by 黄振宇 on 15/9/28.
//  Copyright (c) 2015年 YunMei. All rights reserved.
//

#import "ViewController1.h"
#import "UIImage+RTTint.h"
#import "customTableViewCell.h"

@interface ViewController1 () <UITableViewDelegate,UITableViewDataSource>
- (void)push:(id)sender;
@property (strong, nonatomic)  UITableView *tableview;
@property (nonatomic,strong) NSMutableArray *colorsArray;
@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择主题";
    [self.view addSubview:self.tableview];
    
    [self.colorsArray addObject:[UIColor redColor]];
    [self.colorsArray addObject:[UIColor colorWithRed:254/255.0 green:113/255.0 blue:154/255.0 alpha:1.0f]];
    [self.colorsArray addObject:[UIColor colorWithRed:252/255.0 green:170/255.0 blue:255/255.0 alpha:1.0f]];
    [self.colorsArray addObject:[UIColor greenColor]];
    [self.colorsArray addObject:[UIColor blueColor]];
    [self.colorsArray addObject:[UIColor colorWithRed:111/255.0 green:240/255.0 blue:255/255.0 alpha:1.0f]];
    [self.colorsArray addObject:[UIColor colorWithRed:187/255.0 green:220/255.0 blue:255/255.0 alpha:1.0f]];
    [self.colorsArray addObject:[UIColor colorWithRed:250/255.0 green:255/255.0 blue:213/255.0 alpha:1.0f]];
    [self.colorsArray addObject:[UIColor colorWithRed:254/255.0 green:164/255.0 blue:156/255.0 alpha:1.0f]];
    [self.colorsArray addObject:[UIColor colorWithRed:255/255.0 green:144/255.0 blue:196/255.0 alpha:1.0f]];
    [self.colorsArray addObject:[UIColor colorWithRed:255/255.0 green:100/255.0 blue:255/255.0 alpha:1.0f]];
    [self.colorsArray addObject:[UIColor colorWithRed:150/255.0 green:142/255.0 blue:254/255.0 alpha:1.0f]];
    [self.colorsArray addObject:[UIColor colorWithRed:198/255.0 green:255/255.0 blue:212/255.0 alpha:1.0f]];
    [self.colorsArray addObject:[UIColor colorWithRed:250/255.0 green:255/255.0 blue:211/255.0 alpha:1.0f]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"push" style:UIBarButtonItemStylePlain target:self action:@selector(push:)];
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    _tableview.frame = self.view.bounds;
}

- (UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        _tableview.dataSource = self;
        _tableview.delegate = self;
    }
    return _tableview;
}

- (NSMutableArray *)colorsArray{
    if (!_colorsArray) {
        _colorsArray = [NSMutableArray array];
    }
    return _colorsArray;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.colorsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    customTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"customTableViewCell" owner:nil options:nil][0];
    
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    cell.backgroundView.backgroundColor = [UIColor clearColor];
    UIColor *color = _colorsArray[indexPath.row];
    cell.colorView.backgroundColor = color;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIColor *color = _colorsArray[indexPath.row];
    
    NSData *objColor = [NSKeyedArchiver archivedDataWithRootObject:color];
    [[NSUserDefaults standardUserDefaults] setObject:objColor forKey:@"myColor"];
    
    UIImage *image = [UIImage imageNamed:@"cm2_set_btn_sign_ad_prs"];
    UIImage *changedImage = [image rt_tintedImageWithColor:color];
    
    UIImage *selTab = [changedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    CGSize tabSize = CGSizeMake(CGRectGetWidth(self.view.frame)/self.tabBarController.viewControllers.count, self.tabBarController.tabBar.frame.size.height);
    UIGraphicsBeginImageContext(tabSize);
    [selTab drawInRect:CGRectMake(0, 0, tabSize.width, tabSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.tabBarController.tabBar setSelectionIndicatorImage:reSizeImage];//添加选中后变色的图片
}

- (void)push:(id)sender {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor yellowColor];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
