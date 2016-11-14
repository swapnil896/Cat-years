//
//  ViewController.m
//  sCatYears
//
//  Created by Mac on 07/10/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self calculateHeightWidth];
    [self addLabelHead];
    [self addTextLabel];
    [self addTextField];
    [self addButtonClear];
    [self addCalculateButton];
    [self addOutputLabel];
    self.view.layer.borderWidth = 3.0;
    self.view.layer.borderColor = [UIColor blackColor].CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)calculateHeightWidth{
    
    screenHeight = [[UIScreen mainScreen]bounds].size.height;
    screenWidth = [[UIScreen mainScreen]bounds].size.width;
}

-(void)addLabelHead{
    
    labelHead = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 100)];
    
    labelHead.backgroundColor = [UIColor blackColor];
    [labelHead setText:@"CAT YEARS"];
    labelHead.textColor = [UIColor greenColor];
    [labelHead setTextAlignment:NSTextAlignmentCenter];
    [labelHead setFont:[UIFont monospacedDigitSystemFontOfSize:30 weight:30]];
    [self.view addSubview:labelHead];
}

-(void)addTextLabel{
    
    labelText = [[UILabel alloc]initWithFrame:CGRectMake(20, 140, 150, 40)];
    //labelText.backgroundColor = [UIColor redColor];
    [labelText setText:@"Human Age : "];
    [labelText setTextColor:[UIColor blackColor]];
    [labelText setFont:[UIFont monospacedDigitSystemFontOfSize:20 weight:20]];
    [self.view addSubview:labelText];
}

-(void)addTextField{
    
    ageField = [[UITextField alloc]initWithFrame:CGRectMake(170, 140, screenWidth - 180, 40)];
    
    ageField.backgroundColor = [UIColor yellowColor];
    [ageField setFont:[UIFont systemFontOfSize:20 weight:20]];
    [ageField setTextAlignment:NSTextAlignmentCenter];
    
    [ageField setPlaceholder:@"  Enter Human Age.."];
    ageField.layer.borderColor = [UIColor blackColor].CGColor;
    ageField.layer.borderWidth = 3.0;
    ageField.delegate = self;
    
    [ageField setKeyboardType:UIKeyboardTypeNumberPad];
    
    [self.view addSubview:ageField];
}

-(void)addButtonClear{
    
    buttonClear = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 140, 30)];
    
    buttonClear.backgroundColor = [UIColor greenColor];
    [buttonClear setTitle:@"CLEAR" forState:UIControlStateNormal];
    [buttonClear setTitle:@"CLEARING" forState:UIControlStateHighlighted];
    [buttonClear.titleLabel setFont:[UIFont monospacedDigitSystemFontOfSize:20 weight:20]];
    
    [buttonClear setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    buttonClear.layer.cornerRadius = 5.0;
    buttonClear.layer.borderWidth = 2.0;
    buttonClear.layer.borderColor = [UIColor blackColor].CGColor;
    [buttonClear addTarget:self action:@selector(handleClear) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonClear];
}

-(void)addCalculateButton{
    
    buttonCalculate = [[UIButton alloc]initWithFrame:CGRectMake(40, 260, screenWidth - 80, 35)];
    
    buttonCalculate.backgroundColor = [UIColor greenColor];
    [buttonCalculate setTitle:@"Calculate Cat Years" forState:UIControlStateNormal];
    [buttonCalculate setTitle:@"Calculating" forState:UIControlStateHighlighted];
    [buttonCalculate setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonCalculate setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];

    [buttonCalculate.titleLabel setFont:[UIFont monospacedDigitSystemFontOfSize:20 weight:20]];
    buttonCalculate.layer.cornerRadius = 8.0;
    buttonCalculate.layer.borderWidth = 2.0;
    buttonCalculate.layer.borderColor = [UIColor blackColor].CGColor;
    
    [buttonCalculate addTarget:self action:@selector(handleCalculate) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:buttonCalculate];
}

-(void)addOutputLabel{
    
    labelOutput = [[UILabel alloc]initWithFrame:CGRectMake(40, 320, screenWidth - 60, 40)];
    
    //labelOutput.backgroundColor = [UIColor redColor];
    
    [labelOutput setTextAlignment:NSTextAlignmentCenter];
    [labelOutput setFont:[UIFont italicSystemFontOfSize:30]];
    
    [self.view addSubview:labelOutput];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}
-(void)handleClear{
    
    ageField.text = @"";
    labelOutput.text = @"";
}

-(void)handleCalculate{
    
    float ageValue = ageField.text.floatValue;
    if(ageValue > 0 && ageValue <= 120)
    {
        //int ageValue = ageField.text.intValue;
        NSString *value = [NSString stringWithFormat:@"Cat Years = %.1f", ageValue/7];
        labelOutput.text = value;
    }
    
    if(ageValue > 120)
    {
        labelOutput.text = @"Invalid Age..";
    }
    else
    {
        if([ageField.text  isEqual: @""])
        {
            //NSString *value = [NSString stringWithFormat:@"Enter age to calculate"];
            labelOutput.text = @"Enter age to Calculate..";
        }
        //labelOutput.text = @"Enter age to calculate..";
    }
    
}
@end
