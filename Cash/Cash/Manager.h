//
//  Manager.h
//  Cash
//
//  Created by user145521 on 11/8/18.
//  Copyright © 2018 user145521. All rights reserved.
//

#import "modelList.h"
#import "restock.h"
#import "ViewController.h"
#import <UIKit/UIKit.h>



@interface Manager : UIViewController
@property (nonatomic, strong) modelList* modelListing;
@property (nonatomic, strong)id <restockDelegate> delegate;
@end

