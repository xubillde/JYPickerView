//
//  ViewController.m
//  JYPickerView
//
//  Created by typc on 16/5/24.
//  Copyright © 2016年 com.majinyu. All rights reserved.
//

#import "ViewController.h"
#import "JYPickerView.h"

@interface ViewController (){
    JYPickerView *p;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    p =[[JYPickerView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    p.onSubmitClickBlock = ^(NSInteger c1, NSInteger c2, NSInteger c3){
        NSLog(@"%d %d %d",c1,c2,c3);
    };
}
- (IBAction)show:(id)sender {
    [p show];
}


@end
