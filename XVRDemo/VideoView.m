//
//  VideoView.m
//  XVRDemo
//
//  Created by weige on 16/10/30.
//  Copyright © 2016年 Wei. All rights reserved.
//

#import "VideoView.h"
#import "GCSVideoView.h"

@interface VideoView ()<GCSVideoViewDelegate>
@property (weak, nonatomic) IBOutlet GCSVideoView *ViewPlay;
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
    _ViewPlay.delegate = self;
    _ViewPlay.enableCardboardButton = YES;
    _ViewPlay.enableFullscreenButton = YES;
    //[self loadFromUrl:[NSURL   URLWithString:@"http://120.25.246.21/vrMobile/travelVideo/zhejiang_xuanchuanpian.mp4"]];
}

#pragma mark - GCSWidgetViewDelegate

-(void)videoView:(GCSVideoView *)videoView didUpdatePosition:(NSTimeInterval)position{
    
    if (position == videoView.duration) {
        [_ViewPlay seekTo:0];
    }
}

#pragma mark - GCSVideoViewDelegate

-(void)widgetViewDidTap:(GCSWidgetView *)widgetView{
    if (_isPaused) {
        [_ViewPlay resume];
    }else{
        [_ViewPlay pause];
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

-(void)ChangedURLSwitch:(UISwitch *)sender URL:(UITextField *)URLTextField{
    
    if (sender.on) {
        if ([URLTextField.text length] <= 0) {
            sender.on = NO;
        }else{
            [URLTextField setEnabled:NO];
            [_ViewPlay loadFromUrl:[NSURL   URLWithString:URLTextField.text]];
        }
    }else{
        [URLTextField setEnabled:YES];
        [_ViewPlay stop];
    }
    
}

- (void)stop{
    [_ViewPlay stop];
}

- (void)pause{
    [_ViewPlay pause];
}

@end
