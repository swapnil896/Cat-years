//
//  ViewController.h
//  sCatYears
//
//  Created by Mac on 07/10/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
{
    UILabel *labelHead, *labelText, *labelOutput;
    UIButton *buttonCalculate, *buttonClear;
    UITextField *ageField;
    CGFloat screenHeight, screenWidth;
}

@end

