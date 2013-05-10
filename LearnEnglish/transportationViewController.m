//
//  transportationViewController.m
//  LearnEnglish
//
//  Created by zhang on 2/22/13.
//  Copyright (c) 2013 zhang. All rights reserved.
//

#import "transportationViewController.h"
#import "DetailViewController.h"
@interface transportationViewController ()

@end

@implementation transportationViewController
@synthesize selection=_selection;
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
    NSString*size =@"07";
    _selection = [NSString stringWithFormat:@"%@%@%@",@"tra",index,size];
    [self performSegueWithIdentifier:@"traPush" sender:self];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"traPush"]){
        [segue.destinationViewController setTitle:_selection];
    }
}
@end
