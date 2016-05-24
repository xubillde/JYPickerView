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
    JYPickerView *datePicker;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *showItem = [[UIBarButtonItem alloc] initWithTitle:@"显示"
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(show:)];
    self.navigationItem.rightBarButtonItem = showItem;
    
    
    datePicker =[[JYPickerView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    datePicker.onSubmitClickBlock = ^(NSDate *date){
        NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
        [fmt setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
        NSLog(@"%@",[fmt stringFromDate:date]);
    };
}


- (void)show:(id)sender
{
    [datePicker show];
}


@end
