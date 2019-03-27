//
//  ViewController.m
//  ShoppingCart
//
//  Created by user145521 on 10/17/18.
//  Copyright © 2018 user145521. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "modelList.h"
#import "History.h"
#import "Manager.h"
#import "restock.h"

@interface ViewController ()<UIPickerViewDataSource, UIPickerViewDelegate, restockDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UILabel *pickerText;
@property (weak, nonatomic) IBOutlet UITextField *Display;
@property (weak, nonatomic) IBOutlet UIButton *buy;
@property (weak, nonatomic) IBOutlet UITextField *price;

@property (nonatomic) NSMutableArray* list;
@property NSMutableArray* list2;
@property NSMutableArray* list3;
@property NSInteger selRow;
@property NSInteger numTransactions;
@property(nonatomic, strong) modelList* myModelList;
@end

@implementation ViewController

Model* m;
int indexPath;
int newValue;
-(void)nextVCdata:(modelList *)data
 {
 self.myModelList.allModels = data;
 
 [self dismissViewControllerAnimated:YES completion:nil];
 }
 



-(modelList*)myModelList
{
    if (_myModelList == nil) {
        _myModelList = [[modelList alloc]init];
    }
    return _myModelList;
}

- (IBAction)saveElement:(id)sender {
    indexPath = (int)[self.picker selectedRowInComponent:0];
    //int row2 = (int)[self.picker selectedRowInComponent:1];
    Model* model = nil;
    model = [[Model alloc] init];
    model.itemName = m.itemName;
    NSDate* date = [NSDate date];
    
    model.qty = newValue;

    model.qtyBought = m.qtyBought;
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"hh:mm:ss"];
    NSString* saveData = [formatter stringFromDate:date];
    
    model.date = saveData;
    
    /*[self.myModelList.allModels addObject:model];
    
    self.Display.text = @"";
    int quantityAfter = m.qty -(int)[self.Display.text integerValue];
    [self.myModelList buyProduct:quantityAfter atIndex:indexPath];*/
}

-(IBAction)price:(UITextField *)sender{
        self.Display.text = [[NSString alloc]initWithFormat:@"%.2f",[self.Display.text doubleValue] * m.price];
}
    
-(IBAction)buy:(UIButton*)sender{

    
    if(m ==nil ){
        _myModelList.allModels = [self.myModelList.allModels objectAtIndex:indexPath];
        
    }
    
    if (m.qty == 0)
    
        self.price.text = @"SOLD OUT";
    
    
    else{
        int quantityAfter = m.qty -(int)[self.Display.text integerValue];
        
        if (quantityAfter <= -1 || [self.Display.text integerValue] == 0)
        
            self.Display.text = @"INVALID AMOUNT";
        
        else{
            
            
            
            
            [self.picker reloadAllComponents];
            
            Model* prodBought = m;
            
            [self.myModelList updateProd:prodBought withQuantity:(int)[self.Display.text integerValue] costing:(int)[self.price.text integerValue]];
            
            NSString* in = self.Display.text;
            
            int j = (int)[in integerValue];
            m.qtyBought = j;
            
            
            newValue = m.qty - j;
            
            m.qty = newValue;
            
            _numTransactions+=1;
            
            [self.picker reloadAllComponents];
            
        }
    }
}



-(IBAction)buttonPress:(UIButton*) sender{
    bool typing = NO;
    NSString* num = sender.currentTitle;
    
    if (typing)
    {
        self.Display.text = [self.Display.text stringByAppendingString:num];
    }
    
    else
    {
        self.Display.text = num;
        typing = YES;
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    m = [self.myModelList.modelsPick objectAtIndex:(int)row];
    
    indexPath = (int)row;
    
    self.pickerText.text = m.itemName;
    
    
    
}

-(nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    Model* m = nil;
        //_pickerText.text = [self.list objectAtIndex:row];
        m = [self.myModelList.modelsPick objectAtIndex:(int)row];
    
    self.pickerText.text = m.itemName;
    
    NSString* str = [NSString stringWithFormat: @"%@ qty %d $%d", m.itemName, m.qty, m.price];
    
    return str;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
        return self.myModelList.modelsPick.count;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)nextVCDidFinishWith:(Model *)data atIndex:(int)index{
    [self.myModelList.allModels replaceObjectAtIndex:index withObject:data];
    [self.picker reloadAllComponents];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"second"])
    {        
        Manager* m = (Manager*)segue.destinationViewController;
        
        m.modelListing = self.myModelList;
        
        m.delegate = self;
    }
    
}
@end
