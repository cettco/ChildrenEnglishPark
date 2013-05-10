//
//  GameViewController.m
//  LearnEnglish
//
//  Created by zhang on 2/27/13.
//  Copyright (c) 2013 zhang. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()
{
    NSString* word;
    NSString*path;
    NSDictionary* root;
    NSDictionary * current;
    NSDictionary * typeDic;
    NSArray * array;
    NSArray * arraySize;
    int total;
    int correct;
    NSString * c1;
    NSString* c2;
    NSString *c3;
    NSString *c4;
    NSString* currentWord;
}
@end

@implementation GameViewController
@synthesize button1 = _button1;
@synthesize button2 = _button2;
@synthesize button3 = _button3;
@synthesize button4 = _button4;
@synthesize totalLabel = _totalLabel;
@synthesize correctLabel = _correctLabel;
@synthesize webView = _webView;

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
    path = [[NSBundle mainBundle] pathForResource:@"source" ofType:@"plist"];
    root = [[NSDictionary alloc]initWithContentsOfFile:path];
    array = [[NSArray alloc]initWithObjects:@"ani",@"spo",@"fes",@"tra",@"abc", nil];
    arraySize = [[NSArray alloc] initWithObjects:@"10",@"8",@"5",@"7",@"26", nil];
    total = 0;
    correct = 0;
    [self createWord];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonClicked:(UIButton *)sender {
    if([sender.currentTitle isEqualToString:word]){
        correct++;
    }
    total++;
    _totalLabel.text = [NSString stringWithFormat:@"%d",total];
    _correctLabel.text = [ NSString stringWithFormat:@"%d",correct];
    if((total-correct)>6){
        [self stopPlay];
        [self createWord];
    }
    else{
        [self createWord];
    }
}
- (void)stopPlay{
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"结束" message:@"你的错误次数已达到6次，请重新开始" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    correct = 0;
    total = 0;
    _correctLabel.text = @"0";
    _totalLabel.text = @"0";
}

- (NSString*)randomWord{
    int i = arc4random()%5;
    NSString*type = array[i];
    int size = [arraySize[i] intValue];
    int j = arc4random()%size+1;
    currentWord = [NSString stringWithFormat:@"%@%d",type,j];
    typeDic = [ root objectForKey:type];
    current = [typeDic objectForKey:currentWord];
    return [current objectForKey:@"word"];
}

- (void)createWord{
    NSString * s1;
    NSString *s2;
    NSString * s3;
    NSString* s4;
    while(true){
        
        s1 = [self randomWord];
        c1 = currentWord;
        s2 = [self randomWord];
        c2 = currentWord;
        s3 = [self randomWord];
        c3 = currentWord;
        s4 = [self randomWord];
        c4 = currentWord;
        if(![s1 isEqualToString:s2]&&![s1 isEqualToString:s3]&&![s1 isEqualToString:s4]&&![s2 isEqualToString:s3]&&![s2 isEqualToString:s3]&&![s3 isEqualToString:s4]){
            break;
        }
        
    }
    int i = arc4random()%4+1;
    switch (i) {
        case 1:{
            word = s1;
            NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:c1 ofType:@"gif"]];
            [_webView loadData:data MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
        }
            break;
        case 2:{
            word = s2;
            NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:c2 ofType:@"gif"]];
            [_webView loadData:data MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
        }
            break;
        case 3:{
            word = s3;
            NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:c3 ofType:@"gif"]];
            [_webView loadData:data MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
        }
            break;
        case 4:{
            word = s4;
            NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:c4 ofType:@"gif"]];
            [_webView loadData:data MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
        }            
            break;
        default:word = s2;
            break;
    }
 
    [self.button3 setTitle:s3 forState:UIControlStateNormal];
    [self.button4 setTitle:s4 forState:UIControlStateNormal];
    [self.button1 setTitle:s1 forState:UIControlStateNormal];
    [self.button2 setTitle:s2 forState:UIControlStateNormal];
}

@end
