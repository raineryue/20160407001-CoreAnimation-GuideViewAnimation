//
//  ViewController.m
//  20160407001-CoreAnimation-GuideViewAnimation
//
//  Created by Rainer on 16/4/7.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *sunImageView;
@property (weak, nonatomic) IBOutlet UIImageView *personImageView;

@end

@implementation ViewController

/**
 *  控制器视图加载完成
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加子控件
    [self setUpSubviews];
}

/**
 *  添加控制器上的子控件
 */
- (void)setUpSubviews {
    // 1.设置滚动视图的内容视图大小
    self.scrollView.contentSize = self.backgroundImageView.bounds.size;
    // 2.设置滚动视图停止滑动时的惯性大小
    self.scrollView.decelerationRate = 0.1;
    // 3.设置滚动视图的水平滚动条的显示
    self.scrollView.showsHorizontalScrollIndicator = NO;
    // 4.设置滚动视图的垂直滚动条的显示
    self.scrollView.showsVerticalScrollIndicator = NO;
    // 5.设置滚动视图是否有弹簧效果
    self.scrollView.bounces = NO;
}

/**
 *  滚动视图开始滚动时调用方法
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 人物走动
    int contentOffsetX = scrollView.contentOffset.x;
    
    NSString *personImageName = [NSString stringWithFormat:@"520_userguid_person_taitou_%d", contentOffsetX % 2 + 1];
    
    self.personImageView.image = [UIImage imageNamed:personImageName];
    
    self.sunImageView.transform = CGAffineTransformRotate(self.sunImageView.transform, 15 / M_PI * 180);
}

#pragma mark - 控件懒加载
/**
 *  滚动视图懒加载
 */
- (UIScrollView *)scrollView {
    if (nil == _scrollView) {
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
        
        scrollView.delegate = self;
        
        _scrollView = scrollView;
        
        [self.view insertSubview:_scrollView atIndex:0];
    }
    
    return _scrollView;
}

/**
 *  背景视图懒加载
 */
- (UIImageView *)backgroundImageView {
    if (nil == _backgroundImageView) {
        UIImageView *backgroundImageView = [[UIImageView alloc] init];
        
        UIImage *backgroundImage = [UIImage imageNamed:@"520_userguid_bg"];
        
        backgroundImageView.image = backgroundImage;
        backgroundImageView.frame = CGRectMake(0, 0, backgroundImage.size.width, backgroundImage.size.height);
        
        _backgroundImageView = backgroundImageView;
        
        [self.scrollView addSubview:_backgroundImageView];
    }
    
    return _backgroundImageView;
}

@end
