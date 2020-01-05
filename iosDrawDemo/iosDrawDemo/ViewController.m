//
//  ViewController.m
//  iosDrawDemo
//
//  Created by daisy on 2020/1/3.
//  Copyright © 2020 daisyduan.com. All rights reserved.
//

#import "ViewController.h"
#import "CoreGraphicDemo.h"
#import "Quartz2DDemo.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
//主视图
@property (nonatomic,strong)UITableView *tableview;

//数据源
@property (nonatomic,strong)NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = @[@"基本绘图之线圆形等",@"Quartz2D绘图"];
    
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight - 64) style:UITableViewStylePlain];
    [self.view addSubview:self.tableview];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    
}


#pragma mark -- delegate、dataSource 实现

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            CoreGraphicDemo *vc = [[CoreGraphicDemo alloc] init];
            vc.title = self.dataArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            
            break;
        case 1:
        {
            Quartz2DDemo *vc = [[Quartz2DDemo alloc] init];
            vc.title = self.dataArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }
}








@end
