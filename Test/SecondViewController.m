//
//  SecondViewController.m
//  Test
//
//  Created by  wuhiwi on 16/8/16.
//  Copyright © 2016年 wanglibank. All rights reserved.
//

#import "SecondViewController.h"
#import "CustomView.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"全部",@"理财",@"黄金",@"白银"]];
    segmentControl.frame = CGRectMake(20, 100, self.view.bounds.size.width - 40, 40);
    segmentControl.selectedSegmentIndex = 0;
    segmentControl.tintColor = [UIColor greenColor];
    [segmentControl addTarget:self action:@selector(segmentControllerDidClick:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentControl];
    
    
    CustomView *customView = [[CustomView alloc] initWithFrame:CGRectMake(30, 200, self.view.bounds.size.width - 60, 50)];
    customView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:customView];
    [customView addTarget:self action:@selector(clickCustomView) forControllerEvents:UIControlEventTouchUpInside];
}


- (void)clickCustomView
{
    NSLog(@"1");
}

- (void)segmentControllerDidClick:(UISegmentedControl *)segmentController
{
    NSLog(@"%ld",segmentController.selectedSegmentIndex);
}

@end
