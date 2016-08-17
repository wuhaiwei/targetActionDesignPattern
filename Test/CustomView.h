//
//  CustomView.h
//  Test
//
//  Created by  wuhiwi on 16/8/17.
//  Copyright © 2016年 wanglibank. All rights reserved.
//
/**
 *  target Action设计模式
 */
#import <UIKit/UIKit.h>

@interface CustomView : UIView

- (void)addTarget:(id)target action:(SEL)action forControllerEvents:(UIControlEvents)controllerEvents;

@end
