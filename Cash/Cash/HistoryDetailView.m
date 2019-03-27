//
//  HistoryDetailView.m
//  Cash
//
//  Created by user145521 on 11/12/18.
//  Copyright © 2018 user145521. All rights reserved.
//

#import "HistoryDetailView.h"

@interface HistoryDetailView ()

@property (weak, nonatomic) IBOutlet UILabel *Name;
@property (weak, nonatomic) IBOutlet UILabel *Date;
@property (weak, nonatomic) IBOutlet UILabel *quantity;
@property (weak, nonatomic) IBOutlet UILabel *objPrice;

@end

@implementation HistoryDetailView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.Name.text = self.itemsName ;

    self.Date.text = self.itemsDate;
    
    self.quantity.text = self.qtyBought;
    
    self.objPrice.text = self.priceObj;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
