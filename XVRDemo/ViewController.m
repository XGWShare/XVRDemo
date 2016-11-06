//
//  ViewController.m
//  XVRDemo
//
//  Created by weige on 16/10/24.
//  Copyright © 2016年 Wei. All rights reserved.
//

#import "ViewController.h"
#import "VideoView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *Playframe;
@property (weak, nonatomic) IBOutlet UITextField *URLText;
@property (weak, nonatomic) IBOutlet UISwitch *URLSwitch;
@end

@implementation ViewController{
    VideoView *VRVideoView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    //初始化播放器
    CGRect frame = CGRectMake(0, 0, self.Playframe.frame.size.width, self.Playframe.frame.size.height);
    VRVideoView = [VideoView videoPlayView];
    [VRVideoView setFrame:frame];
    [self.Playframe addSubview:VRVideoView];
    
}

- (void)viewDidDisappear:(BOOL)animated{
    [VRVideoView stop];
}

- (IBAction)ChangedURLSwitch:(UISwitch *)sender {
    
    [VRVideoView ChangedURLSwitch:sender URL:_URLText];
    
}

@end
