//
//  Restock.m
//  Cash
//
//  Created by user145521 on 11/15/18.
//  Copyright © 2018 user145521. All rights reserved.
//

#import "ViewController.h"
#import "restock.h"
#import "Model.h"
#import "modelList.h"

@interface Restock ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UITextField *restocking;


@end

@implementation Restock
Model* update = nil;
int prodIndex = -1;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)ok:(id)sender {
    if ((prodIndex = -1))
    {
        update.qty +=(int)[self.restocking.text integerValue];
        
        [self.delegate nextVCDidFinishWith:update atIndex:prodIndex];
        
        [self.allProducts replaceObjectAtIndex:prodIndex withObject: update];
        
        [self.tableView reloadData];
    }
}

- (IBAction)cancel:(id)sender {
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    update = nil;
    
    update = [self.allProducts objectAtIndex:indexPath.row];
    
    prodIndex =(int) indexPath.row;
    self.restocking.text = [NSString stringWithFormat:@"%d",update.qty];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Model* m = [self.allProducts objectAtIndex:indexPath.row];
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    NSString* str = [NSString stringWithFormat: @"%@ - %d", m.itemName, m.price];
    
    cell.textLabel.text =  str;
    cell.detailTextLabel.text = [NSString stringWithFormat: @"%d", m.qty];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.allProducts.count;
}

@end
