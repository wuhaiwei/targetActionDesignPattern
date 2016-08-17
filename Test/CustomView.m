//
//  CustomView.m
//  Test
//
//  Created by  wuhiwi on 16/8/17.
//  Copyright © 2016年 wanglibank. All rights reserved.
//

#import "CustomView.h"

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

@interface CustomView ()
{
    id _target;
    SEL _action;
    UIControlEvents _controllerEvents;
}
@end


@implementation CustomView


- (void)addTarget:(id)target action:(SEL)action forControllerEvents:(UIControlEvents)controllerEvents
{
    _target = target;
    _action = action;
    _controllerEvents = controllerEvents;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (_controllerEvents == UIControlEventTouchUpInside) {
        if ([_target respondsToSelector:_action]) {
//            //此处是为了消除在ARC下调用[_target performSelector:_action withObject:nil]造成的告警
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
//            [_target performSelector:_action withObject:nil];
//#pragma clang diagnostic pop
            
            //也可以通过定义一个宏来使用  没有返回结果的时候这样使用
            SuppressPerformSelectorLeakWarning([_target performSelector:_action withObject:nil]);
            
            
//            //有返回结果的时候这样使用
//            id result;
//            SuppressPerformSelectorLeakWarning(
//            result = [_target performSelector:_action withObject:self]);
        }
    }
}

@end
