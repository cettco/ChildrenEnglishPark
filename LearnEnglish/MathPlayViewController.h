//
//  MathPlayViewController.h
//  LearnEnglish
//
//  Created by zhang on 2/27/13.
//  Copyright (c) 2013 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MathPlayViewController : UIViewController<UITextFieldDelegate>
- (void)setChoice:(NSString*)choice;
@property (weak, nonatomic) IBOutlet UITextField *result;
@property (weak, nonatomic) IBOutlet UILabel *first;
@property (weak, nonatomic) IBOutlet UILabel *op;
@property (weak, nonatomic) IBOutlet UILabel *second;
@property (weak, nonatomic) IBOutlet UILabel *wrong;
@end
