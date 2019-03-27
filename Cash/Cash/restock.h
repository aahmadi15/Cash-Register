//
//  Restock.h
//  Cash
//
//  Created by user145521 on 11/15/18.
//  Copyright © 2018 user145521. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "modelList.h"
@protocol restockDelegate


@required
-(void) nextVCDidFinishWith: (Model * ) data atIndex:(int) index;
@end
@interface Restock : UIViewController

@property NSMutableArray* allProducts;
@property (nonatomic,strong) modelList* myModel;

@property(nonatomic, strong)id<restockDelegate>delegate;


@end

