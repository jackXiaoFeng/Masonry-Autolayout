//
//  ViewController.m
//  Masonry
//
//  Created by yangkaifeng on 15/5/7.
//  Copyright (c) 2015年 yangkaifeng. All rights reserved.
//
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#import "ViewController.h"
#import "Masonry.h"
#import "MMPlaceHolder.h"
#import "UIView+Category.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    WS(ws);
    
    //从此以后基本可以抛弃CGRectMake了
    UIView *sv = [UIView new];
    //在做autoLayout之前 一定要先将view添加到superview上 否则会报错
    
    sv.backgroundColor = [UIColor blackColor];
    [self.view addSubview:sv];
    //mas_makeConstraints就是Masonry的autolayout添加函数 将所需的约束添加到block中行了
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        //将sv居中(很容易理解吧?)
        make.center.equalTo(ws.view);
        
        //将size设置成(300,300)
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    
    
    
//    UIView *sv1 = [UIView new];
//    sv1.backgroundColor = [UIColor redColor];
//    [sv addSubview:sv1];
//    
//    [sv1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(sv).width.insets(UIEdgeInsetsMake(10, 10, 10, 10));
//    }];
    
    /*
    //让两个高度为150的view垂直居中且等宽且等间隔排列 间隔为10(自动计算其宽度)
    int padding1 = 20;
    UIView *sv2 = [UIView new];
    sv2.backgroundColor = [UIColor blueColor];
    [sv addSubview:sv2];
    
    UIView *sv3 = [UIView new];
    sv3.backgroundColor = [UIColor blueColor];
    [sv addSubview:sv3];
    
    [sv2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(sv.mas_centerY);
        make.left.equalTo(sv.mas_left).offset(padding1);
        make.right.equalTo(sv3.mas_left).offset(-padding1);
        make.height.mas_equalTo(@150);
        make.width.equalTo(sv3);
    }];
    [sv3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(sv.mas_centerY);
        make.left.equalTo(sv2.mas_right).offset(padding1);
        make.right.equalTo(sv.mas_right).offset(-padding1);
        make.height.mas_equalTo(@150);
        make.width.equalTo(sv2);
    }];
    
    */
    
    /*
    //中级] 在UIScrollView顺序排列一些view并自动计算contentSize
    
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor whiteColor];
    [sv addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sv).insets(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
    
    UIView *constrain = [UIView new];
    scrollView.backgroundColor = [UIColor purpleColor];
    [scrollView addSubview:constrain];
    
    [constrain mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView);
    }];
    
    
    UIView *lastView = nil;
    for (int i = 1; i <= 10; i ++) {
        UIView *subv = [UIView new];
        [constrain addSubview:subv];
        subv.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
                                          saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                          brightness:( arc4random() % 128 / 256.0 ) + 0.5
                                               alpha:1];
        
        [subv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(constrain);
            make.height.equalTo(@(20*i));
            
            if ( lastView )
            {
                make.top.mas_equalTo(lastView.mas_bottom);
            }
            else
            {
                make.top.mas_equalTo(constrain.mas_top);
            }
            
        }];
            lastView = subv;
    }
    [constrain mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
    }];
    */
    
    
    
    //[高级] 横向或者纵向等间隙的排列一组view
    UIView *sv11 = [UIView new];
    UIView *sv12 = [UIView new];
    UIView *sv13 = [UIView new];
    UIView *sv21 = [UIView new];
    UIView *sv31 = [UIView new];
    sv11.backgroundColor = [UIColor redColor];
    sv12.backgroundColor = [UIColor redColor];
    sv13.backgroundColor = [UIColor redColor];
    sv21.backgroundColor = [UIColor redColor];
    sv31.backgroundColor = [UIColor redColor];
    [sv addSubview:sv11];
    [sv addSubview:sv12];
    [sv addSubview:sv13];
    [sv addSubview:sv21];
    [sv addSubview:sv31];
    //给予不同的大小 测试效果
    [sv11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@[sv12,sv13]);
        make.centerX.equalTo(@[sv21,sv31]);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    [sv12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 20));
    }];
    [sv13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    [sv21 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 20));
    }];
    [sv31 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 60));
    }];
    [sv distributeSpacingHorizontallyWith:@[sv11,sv12,sv13]];
    [sv distributeSpacingVerticallyWith:@[sv11,sv21,sv31]];
    [sv showPlaceHolderWithAllSubviews];
    [sv hidePlaceHolder];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
