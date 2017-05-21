//
//  ViewController.m
//  ScrollViewCutChildView
//
//  Created by MrHuang on 17/5/20.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "ViewController.h"
#import "UIView+HJ_Category.h"
#import "HJ_TitleButton.h"
#import "HJ_OneTabController.h"
#import "HJ_TwoTabController.h"
#import "HJ_ThreeTabController.h"
#import "HJ_FourTabController.h"
#import "HJ_FiveTabController.h"

#define HJrgba(r,g,b,a)[UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define HJrgb(r,g,b) HJrgba((r),(g),(b),255)
#define HJRandomColor HJrgb(arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255))
#define HJBGColor(v) HJrgb((v),(v),(v))
#define HJBackGroundColor HJBGColor(206)

@interface ViewController ()<UIScrollViewDelegate>


@property(nonatomic,weak)UIView *indicatorView;
@property(nonatomic,weak)HJ_TitleButton *titleButton;
@property(nonatomic,weak)UIScrollView *scrollView;
@property(nonatomic,weak)UIView *titlesView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setChildViewController];
    
    [self setScrollView];
    
    [self setTitleView];
    
    //默认情况下加载第一个自控制器中的内容
    [self addChildVCview];
}


-(void)setChildViewController{
    
    HJ_OneTabController * one = [[HJ_OneTabController alloc]init];
    [self addChildViewController:one];
    
    HJ_TwoTabController *Two = [[HJ_TwoTabController alloc]init];
    [self addChildViewController:Two];
    
    HJ_ThreeTabController *Three = [[HJ_ThreeTabController alloc]init];
    [self addChildViewController:Three];
    
    HJ_FourTabController *Four = [[HJ_FourTabController alloc]init];
    [self addChildViewController:Four];
    
    HJ_FiveTabController *Five = [[HJ_FiveTabController alloc]init];
    [self addChildViewController:Five];


}
-(void)setScrollView{
    
    //不许scrollView 自动调整
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *scrollView = [[UIScrollView  alloc]init];
    scrollView.frame = self.view.bounds;
    scrollView.backgroundColor = [UIColor yellowColor];
    scrollView.pagingEnabled = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
 // 这样的创建方式 一次性创建了所有暂时不需要用到的子控制器 所以利用懒加载更合理。
//    NSUInteger count = self.childViewControllers.count;
//    
//    for (NSInteger i = 0; i < count; i++) {
//        
//        UITableView *childView = (UITableView *)self.childViewControllers[i].view;
//        childView.backgroundColor = HJRandomColor;
//        childView.HJ_x = i * scrollView.HJ_Width;
//        childView.HJ_y = 0;
//        childView.HJ_Height = scrollView.HJ_Height;
//        
//        [scrollView addSubview:childView];
//        
//        //调整内边距
//        childView.contentInset = UIEdgeInsetsMake(64 + 35, 0, 49, 0);
//        //滚动条内边距调整
//        childView.scrollIndicatorInsets = childView.contentInset;
//    }
//   
//    
    
    
    //scorllview的contentSize
    scrollView.contentSize = CGSizeMake(self.childViewControllers.count * scrollView.HJ_Width, 0);
    
}


-(void)setTitleView{

    UIView *titleView = [[UIView alloc]init];
    titleView.HJ_Width = self.view.HJ_Width;
    titleView.HJ_Height = 35;
    titleView.HJ_x = 0;
    titleView.HJ_y = 64;
    titleView.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.6f];
    
    [self.view addSubview:titleView];
    self.titlesView = titleView;
    
    NSArray *titlesArray = @[@"字段1",@"第二个字段",@"字3",@"这个操作很是6",@"很舒服"];
    
    CGFloat buttonW = titleView.HJ_Width / titlesArray.count;
    CGFloat buttonH = titleView.HJ_Height;
    
    for (NSUInteger i = 0;  i < titlesArray.count; i++) {
        
        HJ_TitleButton *titleButton = [HJ_TitleButton buttonWithType:UIButtonTypeCustom];
        titleButton.tag = i;
        titleButton.frame = CGRectMake(i * buttonW, 0, buttonW, buttonH);
        
        
        [titleButton setTitle:titlesArray[i] forState:UIControlStateNormal];
        
               [titleButton addTarget:self
                        action:@selector(buttonClik:)
                     forControlEvents:UIControlEventTouchUpInside];
        
        [titleView addSubview:titleButton];
        
    }
    
    //按钮选中的颜色
    HJ_TitleButton *firstButton = titleView.subviews.firstObject;
    //底部指示器
    UIView * indicatorView = [[UIView alloc]init];
    indicatorView.HJ_Height = 1;
    //指示器的背景颜色和按钮颜色状态一致
    indicatorView.backgroundColor = [firstButton titleColorForState:UIControlStateSelected];
    indicatorView.HJ_y = titleView.HJ_Height - indicatorView.HJ_Height;
    
    
    [titleView addSubview:indicatorView];
    self.indicatorView = indicatorView;
    
    //立刻根据文本内容计算文本的宽度。
    [firstButton.titleLabel sizeToFit];

    indicatorView.HJ_Width = firstButton.titleLabel.HJ_Width;
    indicatorView.HJ_CenterX = firstButton.HJ_CenterX;
    
    //默认情况下选择最前面的按钮
    firstButton.selected = YES;
    self.titleButton = firstButton;
//    [self buttonClik:firstButton];
    
}



-(void)buttonClik:(HJ_TitleButton *)button {

    self.titleButton.selected = NO;
    button.selected = YES;
    self.titleButton= button;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.indicatorView.HJ_Width = button.titleLabel.HJ_Width;
        self.indicatorView.HJ_CenterX  = button.HJ_CenterX;
        
    }];
    
    //让scrollView滚动到点击的对应位置
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = button.tag * self.scrollView.HJ_Width;
    
    [self.scrollView setContentOffset:offset animated:YES];
    
    NSLog(@"点击生效-tag:%zd",button.tag);
}


-(void)addChildVCview{
    
    //取得子控制器的索引值
    NSUInteger index = self.scrollView.contentOffset.x / self.scrollView.HJ_Width;
    
    //取出子控制器
    UIViewController * childVC = self.childViewControllers[index];
    
//    childVC.view.HJ_x = index * self.scrollView.HJ_Width;
//    childVC.view.HJ_y = 0;
//    ----->
    childVC.view.HJ_x = self.scrollView.contentOffset.x / self.scrollView.HJ_Width * self.scrollView.HJ_Width;
//    ====>
    childVC.view.HJ_x = self.scrollView.contentOffset.x;
    childVC.view.HJ_y = self.scrollView.contentOffset.y;
//=====>bounds.origin == contentOffset
    childVC.view.HJ_x = self.scrollView.bounds.origin.x;
    childVC.view.HJ_y = self.scrollView.bounds.origin.y;
//    childVC.view.HJ_Width = self.scrollView.HJ_Width;
//    childVC.view.HJ_Height = self.scrollView.HJ_Height;
//    childVc.view.frame = CGRectMake(self.scrollView.bounds.origin.x, self.scrollView.bounds.origin.y, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height);
    
//    bounds.origin == contentOffset
    NSLog(@"%@ --- %@",NSStringFromCGPoint(self.scrollView.bounds.origin),NSStringFromCGPoint(self.scrollView.contentOffset));

    
    childVC.view.frame = self.scrollView.bounds;
    [self.scrollView addSubview:childVC.view];

    

}
#pragma mark - ScrollViewDelegate
/**
 * 在scrollView滚动动画结束时, 就会调用这个方法
 * 前提: 使用setContentOffset:animated:或者scrollRectVisible:animated:方法让scrollView产生滚动动画
 */

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSLog(@"%s",__func__);
    
    [self addChildVCview];
}

/**
 * 在scrollView滚动动画结束时, 就会调用这个方法
 * 前提: 人为拖拽scrollView产生的滚动动画
 */

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"%s",__func__);
    
    NSUInteger index = scrollView.contentOffset.x / scrollView.HJ_Width;
    
    HJ_TitleButton * titleBuuton = (HJ_TitleButton *)self.titlesView.subviews[index];

    [self buttonClik:titleBuuton];
    
    [self addChildVCview];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
