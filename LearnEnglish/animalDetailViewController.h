//
//  animalDetailViewController.h
//  LearnEnglish
//
//  Created by zhang on 1/21/13.
//  Copyright (c) 2013 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>
@interface animalDetailViewController : UIViewController
{
    int i;
}
@property (nonatomic) NSMutableArray * array;
@property (weak, nonatomic) IBOutlet UINavigationItem *item;
@property (weak, nonatomic) IBOutlet UIButton *recordButton;
@property (strong,nonatomic) AVAudioPlayer *audioPlayer;
@property (nonatomic) NSString* current;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong,nonatomic) AVAudioRecorder *audioRecorder;
- (IBAction)play:(id)sender;
- (IBAction)record:(UIButton *)sender;
-  (void)setTitle:(NSString*)myTitle;
- (IBAction)nextClicked:(UIButton *)sender;
- (IBAction)forward:(UIButton *)sender;
- (IBAction)playAudio:(UIButton *)sender;
@end
