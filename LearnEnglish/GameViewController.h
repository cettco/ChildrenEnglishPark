//
//  GameViewController.h
//  LearnEnglish
//
//  Created by zhang on 2/27/13.
//  Copyright (c) 2013 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (nonatomic) IBOutlet UIButton *button3;
@property (nonatomic) IBOutlet UIButton *button4;
- (IBAction)buttonClicked:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *correctLabel;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
