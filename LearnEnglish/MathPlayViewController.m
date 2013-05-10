//
//  MathPlayViewController.m
//  LearnEnglish
//
//  Created by zhang on 2/27/13.
//  Copyright (c) 2013 zhang. All rights reserved.
//

#import "MathPlayViewController.h"

@interface MathPlayViewController ()
{
    NSString *selection;
    int diff;
    int operation;
    NSString *total;
}

@end

@implementation MathPlayViewController
@synthesize  first = _first;
@synthesize second = _second;
@synthesize op = _op;
@synthesize result = _result;
@synthesize wrong = _wrong;

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
    _result.delegate = self;
    if(operation==0){
        [self plus:diff];
    }else if(operation==1){
        [self minus:diff];
    }
    else if(operation==2){
        [self multiply:diff];
        
    }else if(operation==3){
        [self divide:diff];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setChoice:(NSString *)choice{
    selection = choice;
    diff = [[selection substringWithRange:NSMakeRange(0, 1)] intValue];
    operation = [[selection substringFromIndex:1] intValue];
}
- (void)plus:(int)level{

    int f,s;
    if(level==0){
        f = arc4random()%10+1;
        s = arc4random()%10+1;
        
    }else if(level==1){
        f = arc4random()%10+1;
        s = arc4random()%100+1;
    }else{
        f = arc4random()%100+1;
        s = arc4random()%100+1;        
    }
    total = [NSString stringWithFormat:@"%d",f+s];
    _first.text = [NSString stringWithFormat:@"%d",f];
    _second.text = [NSString stringWithFormat:@"%d",s];
    _op.text =@"+";

}

- (void)minus:(int)level{
    int f,s;
    if(level==0){
        f = arc4random()%10+1;
        s = arc4random()%10+1;
        
    }else if(level==1){
        f = arc4random()%100+1;
        s = arc4random()%10+1;
    }else{
        f = arc4random()%100+1;
        s = arc4random()%100+1;
        
    }
    total = [NSString stringWithFormat:@"%d",f-s];
    _first.text = [NSString stringWithFormat:@"%d",f];
    _second.text = [NSString stringWithFormat:@"%d",s];
    _op.text =@"-";
}

- (void)multiply:(int)level{
    int f,s;
    if(level==0){
        f = arc4random()%10+1;
        s = arc4random()%10+1;
        
    }else if(level==1){
        f = arc4random()%10+1;
        s = arc4random()%100+1;
    }else{
        f = arc4random()%100+1;
        s = arc4random()%100+1;
        
    }
    total = [NSString stringWithFormat:@"%d",f*s];
    _first.text = [NSString stringWithFormat:@"%d",f];
    _second.text = [NSString stringWithFormat:@"%d",s];
    _op.text =@"*";
}

- (void)divide:(int)level{
    int f,s;
    while(true){
    if(level==0){
        f = arc4random()%10+1;
        s = arc4random()%10+1;
        if (f%s==0) {
            break;
        }
        
    }else if(level==1){
        f = arc4random()%10+1;
        s = arc4random()%100+1;
        if (f%s==0) {
            break;
        }
    }else{
        f = arc4random()%100+1;
        s = arc4random()%100+1;
        if (f%s==0) {
            break;
        }
        
    }
    }
    total = [NSString stringWithFormat:@"%d",f/s];
    _first.text = [NSString stringWithFormat:@"%d",f];
    _second.text = [NSString stringWithFormat:@"%d",s];
    _op.text =@"/";
}
- (void)check{
    if(![total isEqualToString:_result.text]){
        _wrong.text = @"Opps. The answer is wrong";
        _result.text = @"";
        //[NSThread sleepForTimeInterval:1.0];
        //_wrong.text = @"";
    }
    else{
        _wrong.text=@"";
        _result.text=@"";
        if(operation==0){
            [self plus:diff];
        }else if(operation==1){
            [self minus:diff];
        }
        else if(operation==2){
            [self multiply:diff];
            
        }else if(operation==3){
            [self divide:diff];
        }
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self check];
    return YES;
}


@end
