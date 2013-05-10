//
//  animalViewController.m
//  LearnEnglish
//
//  Created by zhang on 1/20/13.
//  Copyright (c) 2013 zhang. All rights reserved.
//

#import "animalViewController.h"
#import "animalDetailViewController.h"
@interface animalViewController ()

@end

@implementation animalViewController
@synthesize selection = _selection;

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
    _selection = sender.currentTitle;
    [self performSegueWithIdentifier:@"animalPush" sender:sender];
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"animalPush"])
    {
        [segue.destinationViewController setTitle:self.selection];
    }
}
@end
