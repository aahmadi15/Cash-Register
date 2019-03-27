//
//  Model.h
//  ShoppingCart
//
//  Created by user145521 on 10/21/18.
//  Copyright © 2018 user145521. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Model : NSObject

@property (nonatomic, strong) NSString* itemName;
@property int price;
@property int qty;
@property int qtyBought;
@property (nonatomic, strong) NSDate* date;

@end


