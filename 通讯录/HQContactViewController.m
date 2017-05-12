//
//  HQContactViewController.m
//  通讯录
//
//  Created by Macbook on 2017/5/9.
//  Copyright © 2017年 Macbook. All rights reserved.
//

#import "HQContactViewController.h"
#import "HQAddContactController.h"
#import "HQEditViewController.h"
#import "HQContactItem.h"

@interface HQContactViewController ()<HQAddContactControllerDelegate>

//存放数据模型
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation HQContactViewController

- (NSMutableArray *)dataArray {
    if(_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)setItem:(HQContactItem *)item {
    _item = item;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTableView) name:@"reloadData" object:nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)reloadTableView{
    [self.tableView reloadData];
}
- (void)setAccountName:(NSString *)accountName {
    _accountName = accountName;
    self.navigationItem.title = [NSString stringWithFormat:@"%@的通讯录",_accountName];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[HQAddContactController class]])
    {
        HQAddContactController *contactVC = (HQAddContactController*)segue.destinationViewController;
        contactVC.delegate = self;
    }else{
        HQEditViewController *editVC = (HQEditViewController *)segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        editVC.item = self.dataArray[indexPath.row];
    }
    
}

- (void)addContactController:(HQAddContactController *)addContactController contactItem:(HQContactItem *)item {
    //保持存放的数据
    [self.dataArray addObject:item];
    [self.tableView reloadData];
    self.tableView.tableFooterView = [[UIView alloc]init];
    
}
- (IBAction)loginOut:(id)sender {
    
    //1.创建控制器
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"确定要退出？" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    //2.创建按钮
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了取消");
    }];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确实" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    //3.添加按钮
    [alertController addAction:action];
    [alertController addAction:action1];
    //4.显示弹框
    [self presentViewController:alertController animated:YES completion:nil];
    
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // Configure the cell...
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:ID];
    }
    
    HQContactItem *item = self.dataArray[indexPath.row];
    cell.textLabel.text = item.name;
    cell.detailTextLabel.text = item.phone;
    
    return cell;
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

@end
