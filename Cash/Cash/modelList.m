//
//  modelList.m
//  ShoppingCart
//
//  Created by user145521 on 10/31/18.
//  Copyright © 2018 user145521. All rights reserved.
//

#import "modelList.h"
#import "Model.h"

@implementation modelList

-(NSMutableArray*)modelsPick{
 if (_modelsPick == nil){
     
     Model* m1 = [[Model alloc]init];
     
     [m1 setItemName : @"Jeans" ];
     [m1 setPrice : 120];
     [m1 setQty : 10];
     
     Model* m2 = [[Model alloc]init];
     
     [m2 setItemName : @"Shirts"] ;
     [m2 setPrice : 143];
     [m2 setQty : 10];
     
     Model* m3 = [[Model alloc]init];
     
     [m3 setItemName : @"Ties" ];
     [m3 setPrice : 40];
     [m3 setQty : 10];
     
     Model* m4 = [[Model alloc]init];
     
     [m4 setItemName : @"Socks"];
     [m4 setPrice : 50];
     [m4 setQty : 10];
     
     Model* m5 = [[Model alloc]init];
     
     [m5 setItemName : @"Underwear"];
     [m5 setPrice : 100];
     [m5 setQty : 10];
     
     Model* m6 = [[Model alloc]init];
     
     [m6 setItemName : @"Shoes"];
     [m6 setPrice : 200];
     [m6 setQty : 10];
     
     _modelsPick = [[NSMutableArray alloc]initWithObjects:m1, m2, m3, m4, m5, m6, nil];
     
     /*_pricePick = [[NSMutableArray alloc] initWithObjects:@"100", @"200", @"50", @"80", @"100", @"200", nil];
     
     _qtyPick = [[NSMutableArray alloc]initWithObjects:@"10", @"10", @"10", @"10", @"10", @"10", nil ];*/
}
    
    return _modelsPick;
 }

-(NSMutableArray*) allModels{
    if(_allModels == nil)
    {
        _allModels = [[NSMutableArray alloc]init];
    }
    return _allModels;
}

-(void) buyProduct:(int)quantity atIndex:(int)index{
    Model* boughtModel = [self.allModels objectAtIndex:index];
    [boughtModel setQtyBought: quantity];
    [self.modelsPick replaceObjectAtIndex:(NSUInteger)index withObject: boughtModel];
}
     
-(void) updateProd:(Model *)prodBought withQuantity:(int)qty costing:(int)price{
    
    Model* model = [[Model alloc]init];
    
    [model setQtyBought:prodBought.qtyBought];
    [model setItemName:prodBought.itemName];
    [model setDate:[NSDate date]];
    [model setQty:qty];
    [model setPrice:price];
    
    [self.allModels addObject:prodBought];
}
@end
