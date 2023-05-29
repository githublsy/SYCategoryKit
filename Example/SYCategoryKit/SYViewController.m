//
//  SYViewController.m
//  SYCategoryKit
//
//  Created by githublsy on 10/16/2019.
//  Copyright (c) 2019 githublsy. All rights reserved.
//

#import "SYViewController.h"
#import <SYCategoryKit/UIView+SYExtension.h>
#import <SYCategoryKit/NSDate+SYExtension.h>
#import <SYCategoryKit/UIControl+SYExtension.h>
@interface SYViewController ()

@end

@implementation SYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton *btn = [UIButton buttonWithType:0];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.eventInterval = 3.0;
    [btn setBackgroundColor:[UIColor blueColor]];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)click:(UIButton *)sender{
    NSLog(@"点击按钮");
    // 测试代码
    NSArray *array = @[@0, @1, @2, @3];
    NSLog(@"数组:%@",[array objectAtIndex:3]);
    NSLog(@"数组:%@",[array objectAtIndex:4]);
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

@end
