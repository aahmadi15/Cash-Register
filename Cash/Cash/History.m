//
//  History.m
//  ShoppingCart
//
//  Created by user145521 on 10/24/18.
//  Copyright © 2018 user145521. All rights reserved.
//

#import "History.h"
#import "Model.h"
#import "modelList.h"
#import "HistoryDetailView.h"

@interface History ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView * tableView;

@end

@implementation History



- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.myModel.allModels.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cellPick"];
    Model* m = [self.myModel.allModels objectAtIndex:indexPath.row];
    cell.textLabel.text =  m.itemName;
    
    cell.detailTextLabel.text = [NSString  stringWithFormat:@"%d",m.qtyBought];
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"historyDetail"])
    {
        HistoryDetailView * history = [segue destinationViewController];
        
        NSIndexPath * index = [self.tableView indexPathForSelectedRow];
        
        Model* p = [self.myModel.allModels objectAtIndex:(int)index.row];
        
        history.itemsName =  p.itemName;
        
        NSDateFormatter* date = [[NSDateFormatter alloc] init];
        
        [date setDateFormat:@"E, d MMM yyyy HH:mm:ss"];
        NSString* dateStr = [date stringFromDate:p.date];
        history.itemsDate = dateStr;
        
        history.priceObj = [[NSString alloc] initWithFormat: @"$%d", p.price];
        
        history.qtyBought = [[NSString alloc] initWithFormat: @"%d", p.qtyBought];
    }
    
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
