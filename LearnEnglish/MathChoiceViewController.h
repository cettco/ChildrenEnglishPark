//
//  MathChoiceViewController.h
//  LearnEnglish
//
//  Created by zhang on 2/27/13.
//  Copyright (c) 2013 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MathChoiceViewController : UIViewController
@property (strong, nonatomic) IBOutlet UISegmentedControl *difficulty;
- (IBAction)buttonClicked:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *operation;

@end
