//
//  HJ_ThreeTabController.m
//  ScrollViewCutChildView
//
//  Created by MrHuang on 17/5/20.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "HJ_ThreeTabController.h"


#define HJrgba(r,g,b,a)[UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define HJrgb(r,g,b) HJrgba((r),(g),(b),255)
#define HJRandomColor HJrgb(arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255))
#define HJBGColor(v) HJrgb((v),(v),(v))
#define HJBackGroundColor HJBGColor(206)

@interface HJ_ThreeTabController ()

@end

@implementation HJ_ThreeTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.tableView.contentInset = UIEdgeInsetsMake(64 + 35, 0, 49, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.backgroundColor =  HJRandomColor;
        
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@-%ld",[self class],(long)indexPath.row];
    
    
    return cell;
}
@end
