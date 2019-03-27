//
//  modelList.h
//  ShoppingCart
//
//  Created by user145521 on 10/31/18.
//  Copyright © 2018 user145521. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"

@interface modelList : NSObject

@property (nonatomic, strong) NSMutableArray *modelsPick;
@property (nonatomic,strong) NSMutableArray* allModels;

-(void) buyProduct :(int)quantity atIndex: (int)index;

-(void) updateProd:(Model *)prodBought withQuantity: (int) qty costing: (int)price;
@end


