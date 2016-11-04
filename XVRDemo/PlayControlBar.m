//
//  PlayControlBar.m
//  XVRDemo
//
//  Created by weige on 16/10/24.
//  Copyright © 2016年 Wei. All rights reserved.
//

#import "PlayControlBar.h"
#import "UIView+Frame.h"

const static CGFloat Hight = 30;
const static CGFloat Width = 30;

@interface PlayControlBar()
@property (nonatomic,strong) UIView *topView;
@property (nonatomic,strong) UIView *bottomView;
@end

@implementation PlayControlBar

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.topView];
        [self addSubview:self.bottomView];
    }
    return self;
}

/**
 顶部控制条

 @return UIView
 */
- (UIView *)topView{
    if (!_topView) {
        _topView = [[UIView alloc]initWithFrame:self.frame];
        [_topView setHeight:Hight];
        [_topView setBackgroundColor:[UIColor blueColor]];
    }
    return _topView;
}

/**
 底部控制条

 @return UIView
 */
- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]initWithFrame:self.frame];
        [_bottomView setY:_bottomView.frame.size.height - Hight];
        [_bottomView setHeight:Hight];
        [_bottomView setBackgroundColor:[UIColor redColor]];
        [self setBottomView:_bottomView];
    }
    return _bottomView;
}

#pragma mark - 按钮
- (void)setViewButton:(UIView *)view{
    if (view == _bottomView) {
        UIButton *retreat = [[UIButton alloc]initWithFrame:CGRectMake(10, 0, Width, Hight)];
        UIButton *pause = [[UIButton alloc]initWithFrame:CGRectMake(10+Width, 0, Width, Hight)];
        UIButton *advance = [[UIButton alloc]initWithFrame:CGRectMake(10+Width*2, 0, Width, Hight)];
        [view addSubview:retreat];
        [view addSubview:pause];
        [view addSubview:advance];
    }
    
    if (view == _topView) {
        
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
