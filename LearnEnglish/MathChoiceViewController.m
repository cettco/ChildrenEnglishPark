//
//  MathChoiceViewController.m
//  LearnEnglish
//
//  Created by zhang on 2/27/13.
//  Copyright (c) 2013 zhang. All rights reserved.
//

#import "MathChoiceViewController.h"
#import "MathPlayViewController.h"
@interface MathChoiceViewController ()
{
    NSString*choice;
}

@end

@implementation MathChoiceViewController
@synthesize  difficulty = _difficulty;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClicked:(UIButton *)sender {
    int d = _difficulty.selectedSegmentIndex;
    int o = _operation.selectedSegmentIndex;
    choice = [NSString stringWithFormat:@"%d%d",d,o];
    [self performSegueWithIdentifier:@"mathPush" sender:self];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"mathPush"]){
        [segue.destinationViewController setChoice:choice];
    }
}
@end
