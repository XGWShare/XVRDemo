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
@property (weak, nonatomic) IBOutlet VideoView *VRPlayerView;
@property (weak, nonatomic) IBOutlet UITextField *URLText;
@property (weak, nonatomic) IBOutlet UISwitch *URLSwitch;
@end

@implementation ViewController{
    BOOL _isPaused;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ChangedURLSwitch:(UISwitch *)sender {
    
    [_VRPlayerView ChangedURLSwitch:sender URL:_URLText];
    
}

- (void)dealloc{
    [_VRPlayerView stop];
}

@end
