//
//  Utils.m
//  XVRDemo
//
//  Created by weige on 16/10/25.
//  Copyright © 2016年 Wei. All rights reserved.
//

#import "Utils.h"

@implementation Utils

#pragma mark - 秒格式化为时分秒
+ (NSString*)TimeformatFromSeconds:(NSInteger)seconds
{
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    return format_time;
}

@end
