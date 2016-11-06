//
//  VideoView.m
//  XVRDemo
//
//  Created by weige on 16/10/30.
//  Copyright © 2016年 Wei. All rights reserved.
//

#import "VideoView.h"
#import "Utils.h"

@interface VideoView ()<GCSVideoViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *playBar;
@property (weak, nonatomic) IBOutlet UIButton *playStartorPause;
@property (weak, nonatomic) IBOutlet UIButton *playStop;
@property (weak, nonatomic) IBOutlet UISlider *playProgress;
@property (weak, nonatomic) IBOutlet UILabel *playTime;
@end

@implementation VideoView{
    BOOL _isPaused;
}

/**
 快速创建View的方法
 */
+ (instancetype)videoPlayView
{
    static VideoView *ManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        ManagerInstance = [[[NSBundle mainBundle] loadNibNamed:@"VideoView" owner:nil options:nil] firstObject];
        [ManagerInstance initWithVideo];
    });
    return ManagerInstance;
}

/**
初始化播放器
*/
- (void)initWithVideo{
    _isPaused = NO;
    self.delegate = self;
    self.enableCardboardButton = YES;
    self.enableFullscreenButton = YES;
    //@"http://120.25.246.21/vrMobile/travelVideo/zhejiang_xuanchuanpian.mp4"
}

#pragma mark - GCSWidgetViewDelegate

-(void)videoView:(GCSVideoView *)videoView didUpdatePosition:(NSTimeInterval)position{
    
    if (position == videoView.duration) {
        //播放结束
        [self seekTo:0];
        _playStartorPause.selected = NO;
    }
    //实时进度
    [_playProgress setValue:position];
    [_playTime setText:[NSString stringWithFormat:@"%@/%@",
                        [Utils TimeformatFromSeconds:position],
                        [Utils TimeformatFromSeconds:videoView.duration]]
     ];
}

#pragma mark - GCSVideoViewDelegate

-(void)widgetViewDidTap:(GCSWidgetView *)widgetView{
    _playBar.hidden = !_playBar.hidden;
}

-(void)widgetView:(GCSWidgetView *)widgetView didFailToLoadContent:(id)content withErrorMessage:(NSString *)errorMessage{
    NSLog(@"播放错误:%@",errorMessage);
}

- (void)widgetView:(GCSWidgetView *)widgetView didLoadContent:(id)content{
    NSLog(@"连接成功url");
    //设置进度条
    _playProgress.minimumValue = 0;
    _playProgress.maximumValue = self.duration;
    //播放按钮
    _playStartorPause.selected = YES;
}

#pragma mark - PlayControl

/**
 选择url
 */
-(void)ChangedURLSwitch:(UISwitch *)sender URL:(UITextField *)URLTextField{
    
    if (sender.on) {
        if ([URLTextField.text length] <= 0) {
            sender.on = NO;
        }
        else{
            [URLTextField setEnabled:NO];
            [self loadFromUrl:[NSURL URLWithString:URLTextField.text]];
        }
    }
    else{
        [URLTextField setEnabled:YES];
        [self stop];
    }
    
}

/**
 进度条
 */
- (IBAction)valueChanged:(UISlider *)sender {
    [self seekTo:sender.value];
}

/**
 停止
 */
- (IBAction)stop:(UIButton *)sender{
    [self stop];
}

/**
 播放与暂停
 */
- (IBAction)pause:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (!sender.selected) {
        [self pause];
    }else{
        [self resume];
    }
}

@end
