//
//  VideoView.h
//  XVRDemo
//
//  Created by weige on 16/10/30.
//  Copyright © 2016年 Wei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoView : UIView

+ (instancetype)videoPlayView;

- (void)ChangedURLSwitch:(UISwitch *)sender URL:(UITextField *)URLTextField;

- (void)stop;
- (void)pause;
@end
