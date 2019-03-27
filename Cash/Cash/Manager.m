//
//  Manager.m
//  Cash
//
//  Created by user145521 on 11/8/18.
//  Copyright © 2018 user145521. All rights reserved.
//

#import "Manager.h"
#import "History.h"
#import "modelList.h"
#import "Model.h"
#import "restock.h"

@interface Manager ()

@end

@implementation Manager

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"history"])
    {
        History* NVC = (History*)segue.destinationViewController;
         
        
         NVC.myModel = self.modelListing;
        
    }
    
    if([segue.identifier isEqualToString:@"Restock"])
    {
        Restock* RVC = (Restock*)segue.destinationViewController;
        
        
        RVC.allProducts = self.modelListing.allModels;
        
        RVC.delegate = self.delegate;
    }
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
