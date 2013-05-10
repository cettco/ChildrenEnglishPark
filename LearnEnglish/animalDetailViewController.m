//
//  animalDetailViewController.m
//  LearnEnglish
//
//  Created by zhang on 1/21/13.
//  Copyright (c) 2013 zhang. All rights reserved.
//

#import "animalDetailViewController.h"

@interface animalDetailViewController ()

@end

@implementation animalDetailViewController
@synthesize current = _current;
@synthesize webView = _webView;
@synthesize audioRecorder = _audioRecorder;
@synthesize audioPlayer = _audioPlayer;
@synthesize item = _item;
@synthesize array = _array;

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
    //NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:_current ofType:@"gif"]];
    //[_webView loadData:data MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    NSURL *soundFile = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingString:@"sound.caf"]];
    NSDictionary *soundSetting;
    soundSetting = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:44100.0],AVSampleRateKey,[NSNumber numberWithInt:kAudioFormatMPEG4AAC],AVFormatIDKey,[NSNumber numberWithInt:2],AVNumberOfChannelsKey,[NSNumber numberWithInt:AVAudioQualityHigh],AVEncoderAudioQualityKey, nil];
        self.audioRecorder = [[AVAudioRecorder alloc] initWithURL:soundFile settings:soundSetting error:nil];
    
    
    _array = [[NSMutableArray alloc] initWithObjects:@"bird",@"cat",@"chimpanzee",@"duck",@"frog",@"giraffe",@"monkey",@"mouse",@"pig",@"rabbit", nil];
    _item.title = _array[i-1];
    
    
    //NSURL *noSoundFileURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"norecording" ofType:@"wav"]];
    //NSURL * noSoundFileURL = [ NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sound" ofType:@"car"]];
    //NSLog(@"second");
    //self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:noSoundFileURL error:nil];
    
}
- (void)viewDidUnload
{
    [self setAudioRecorder:nil];
    [self setAudioPlayer:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)play:(id)sender {
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:_current ofType:@"gif"]];
    [_webView loadData:data MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    
}

- (IBAction)record:(UIButton *)sender {
    if([self.recordButton.currentTitle isEqualToString:@"Record Audio"])
        {
            [_audioRecorder record];
            [self.recordButton setTitle:@"Stop Recording" forState:UIControlStateNormal];
            
        }
    else{
        [self.audioRecorder stop];
        [self.recordButton setTitle:@"Record Audio" forState:UIControlStateNormal];
        NSURL *soundFileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingString:@"sound.caf"]];
        self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundFileURL error:nil];
    }
}

- (void)setTitle:(NSString *)myTitle
{
    i = [myTitle intValue];
    _current = [NSString stringWithFormat:@"%@%@",@"animal",myTitle];
}

- (IBAction)nextClicked:(UIButton *)sender {
    if(i==10) i=1;
    else i++;
    _current = [NSString stringWithFormat:@"%@%d",@"animal",i];
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:_current ofType:@"gif"]];
    [_webView loadData:data MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];

}

- (IBAction)forward:(UIButton *)sender {
    if(i==1) i = 10;
    else i--;
    _current = [NSString stringWithFormat:@"%@%d",@"animal",i];
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:_current ofType:@"gif"]];
    [_webView loadData:data MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
}

- (IBAction)playAudio:(UIButton *)sender {
    [self.audioPlayer play];
}

@end
