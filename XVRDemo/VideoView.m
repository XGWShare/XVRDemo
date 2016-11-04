//
//  VideoView.m
//  XVRDemo
//
//  Created by weige on 16/10/30.
//  Copyright © 2016年 Wei. All rights reserved.
//

#import "VideoView.h"

@interface VideoView ()<GCSVideoViewDelegate>

@end

@implementation VideoView{
    BOOL _isPaused;
}

/**
 自动初始化播放器
 */
- (void)awakeFromNib{
    [super awakeFromNib];
    
    [self initWithVideo];
}

/**
 手动初始化播放器
 */
- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initWithVideo];
    }
    return self;
    
}

/**
初始化播放器
*/
- (void)initWithVideo{
    _isPaused = NO;
    self.delegate = self;
    self.enableCardboardButton = YES;
    self.enableFullscreenButton = YES;
    //[self loadFromUrl:[NSURL   URLWithString:@"http://120.25.246.21/vrMobile/travelVideo/zhejiang_xuanchuanpian.mp4"]];
}

#pragma mark - GCSWidgetViewDelegate

-(void)videoView:(GCSVideoView *)videoView didUpdatePosition:(NSTimeInterval)position{
    
    if (position == videoView.duration) {
        [self seekTo:0];
    }
}

#pragma mark - GCSVideoViewDelegate

-(void)widgetViewDidTap:(GCSWidgetView *)widgetView{
    if (_isPaused) {
        [self resume];
    }else{
        [self pause];
    }
    _isPaused = !_isPaused;
}

-(void)widgetView:(GCSWidgetView *)widgetView didFailToLoadContent:(id)content withErrorMessage:(NSString *)errorMessage{
    NSLog(@"播放错误:%@",errorMessage);
}

- (void)widgetView:(GCSWidgetView *)widgetView didLoadContent:(id)content{
    NSLog(@"连接成功url:%@",content);
}

#pragma mark - 播放控制

/**
 用UISwitch设置url
 */
- (void)ChangedURLSwitch:(UISwitch *)sender URL:(UITextField *)URLTextField{
    
    if (sender.on) {
        if ([URLTextField.text length] <= 0) {
            sender.on = NO;
        }else{
            [URLTextField setEnabled:NO];
            [self loadFromUrl:[NSURL   URLWithString:URLTextField.text]];
        }
    }else{
        [URLTextField setEnabled:YES];
        [self stop];
    }
    
}

/**
 旋转屏幕
 */
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}


@end
