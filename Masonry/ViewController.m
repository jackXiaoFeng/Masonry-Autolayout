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
    
    
    
    
    UIView *sv1 = [UIView new];
    sv1.backgroundColor = [UIColor redColor];
    [sv addSubview:sv1];
    
    [sv1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sv).width.insets(UIEdgeInsetsMake(10, 10, 10, 10));
        
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
