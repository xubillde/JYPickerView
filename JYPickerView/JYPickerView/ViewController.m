//
//  ViewController.m
//  JYPickerView
//
//  Created by typc on 16/5/24.
//  Copyright © 2016年 com.majinyu. All rights reserved.
//

#import "ViewController.h"
#import "JYPickerView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    JYPickerView *p =[[JYPickerView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [p show];
    
    
}



@end
