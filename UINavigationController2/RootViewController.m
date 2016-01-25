//
//  NavViewController.m
//  UINavigationController2
//
//  Created by mac373 on 16/1/21.
//  Copyright © 2016年 ole. All rights reserved.
//

#import "RootViewController.h"

// 获取屏幕高度
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height
// 获取屏幕宽度
#define kDeviceWidth  [UIScreen mainScreen].bounds.size.width

@interface RootViewController ()

@end

@implementation RootViewController

@synthesize navRowView;
@synthesize navRowList;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //初始化数据
    [self getData];
    
    //标题
    self.title = @"首页";
    
    navRowView = [[UITableView alloc] initWithFrame:CGRectMake(0, [[UIApplication sharedApplication] statusBarFrame].size.height, kDeviceWidth, kDeviceHeight) ];
    navRowView.delegate = self;
    navRowView.dataSource = self;
    
    navRowView.scrollEnabled = YES;
    navRowView.userInteractionEnabled = YES;
    [self.view addSubview:navRowView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.navRowList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RootViewCell *cell = [RootViewCell cellWithTableView:tableView];
    [cell setWithId:[NSString stringWithFormat:@"%@",[[self.navRowList objectAtIndex:indexPath.row] objectForKey:@"ID"]]
            andName:[[self.navRowList objectAtIndex:indexPath.row] objectForKey:@"NAME"]
             andQty:[NSString stringWithFormat:@"%@",[[self.navRowList objectAtIndex:indexPath.row] objectForKey:@"QTY"]]
    ];
    return cell;
}

#pragma mark - Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
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

- (void) getData
{
    NSString *sUrl = @"http://192.168.19.123:8181/paper/client/nav/getNavDataJson.action";
    sUrl=[sUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL * url=[NSURL URLWithString:sUrl];
    
    NSURLRequest *request=[[NSURLRequest alloc]initWithURL:url cachePolicy:0 timeoutInterval:15.0f];
    
    //发送异步请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError)
    {
        if (connectionError)
        {
            NSLog(@"%@",connectionError.localizedDescription);
        }
        else
        {
            NSArray *aJson = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: nil];
            navRowList = aJson;
//            for(NSDictionary *item in aJson) {
//                NSLog(@"Id: %@", [item objectForKey:@"ID"]);
//                NSLog(@"Name: %@", [item objectForKey:@"NAME"]);
//                NSLog(@"Qty: %@", [item objectForKey:@"QTY"]);
//            }
            [navRowView reloadData];
        }
    }];
}

@end
