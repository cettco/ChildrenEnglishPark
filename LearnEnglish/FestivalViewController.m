//
//  FestivalViewController.m
//  LearnEnglish
//
//  Created by zhang on 2/22/13.
//  Copyright (c) 2013 zhang. All rights reserved.
//

#import "FestivalViewController.h"

@interface FestivalViewController ()

@end

@implementation FestivalViewController
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
    NSString* index = [sender currentTitle];
    NSString*size =@"05";
    _selection = [NSString stringWithFormat:@"%@%@%@",@"fes",index,size];
    [self performSegueWithIdentifier:@"fesPush" sender:self];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"fesPush"]){
        [segue.destinationViewController setTitle:_selection];
    }
}

@end
