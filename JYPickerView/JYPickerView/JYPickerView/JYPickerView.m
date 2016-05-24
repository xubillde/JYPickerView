//
//  JYPickerView.m
//  JYPickerView
//
//  Created by typc on 16/5/24.
//  Copyright © 2016年 com.majinyu. All rights reserved.
//

#define k_toolbar_height    40
#define k_pickerView_height 200
#define k_screen_height  [UIScreen mainScreen].bounds.size.height
#define k_screen_width   [UIScreen mainScreen].bounds.size.width


#import "JYPickerView.h"

static UIWindow *__sheetWindow = nil;

@interface JYPickerView()<
UIPickerViewDataSource,
UIPickerViewDelegate
>

@property (nonatomic, strong) UIToolbar    *toorbar;
@property (nonatomic, strong) UIButton     *btnCancel;
@property (nonatomic, strong) UIButton     *btnSubmit;
@property (nonatomic, strong) UIPickerView *pickerView;

@property (nonatomic, assign) NSInteger col1;
@property (nonatomic, assign) NSInteger col2;
@property (nonatomic, assign) NSInteger col3;

@end

@implementation JYPickerView

#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.arrDays = @[
                         @"今天",
                         @"明天"
                         ];
        
        self.arrHours = @[
                          @"0",
                          @"1",
                          @"2",
                          @"3",
                          @"4",
                          @"5",
                          @"6",
                          @"7",
                          @"8",
                          @"9",
                          @"10",
                          @"11",
                          @"12",
                          @"13",
                          @"14",
                          @"15",
                          @"16",
                          @"17",
                          @"18",
                          @"19",
                          @"20",
                          @"21",
                          @"22",
                          @"23"
                          ];
        
        self.arrMinutes = @[
                            @"0",
                            @"30"
                            ];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidden)];
        [self addGestureRecognizer:tap];
        
        self.col1 = 0;
        self.col2 = 0;
        self.col3 = 0;
        
        self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0,
                                                                         k_screen_height - k_pickerView_height,
                                                                         k_screen_width,
                                                                         k_pickerView_height)];
        self.pickerView.backgroundColor = [UIColor whiteColor];
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
        [self.pickerView selectRow:0 inComponent:0 animated:NO];
        [self.pickerView selectRow:0 inComponent:1 animated:NO];
        [self.pickerView selectRow:0 inComponent:2 animated:NO];
        [self addSubview:self.pickerView];
        
        self.toorbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0,
                                                                   k_screen_height - k_pickerView_height - k_toolbar_height,
                                                                   k_screen_width,
                                                                   k_toolbar_height)];
        
        self.btnCancel = [[UIButton alloc] initWithFrame:CGRectMake(0,
                                                                    0,
                                                                    k_toolbar_height * 2,
                                                                    k_toolbar_height)];
        [self.btnCancel setTitle:@"取消" forState:UIControlStateNormal];
        [self.btnCancel.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [self.btnCancel setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self.btnCancel addTarget:self action:@selector(cancelClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.toorbar addSubview:self.btnCancel];
        
        self.btnSubmit = [[UIButton alloc] initWithFrame:CGRectMake(k_screen_width - k_toolbar_height * 2,
                                                                    0,
                                                                    k_toolbar_height * 2,
                                                                    k_toolbar_height)];
        [self.btnSubmit setTitle:@"确定" forState:UIControlStateNormal];
        [self.btnSubmit.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [self.btnSubmit setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self.btnSubmit addTarget:self action:@selector(submitClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.toorbar addSubview:self.btnSubmit];
        
        [self addSubview:self.toorbar];
    }
    
    return self;
}

#pragma mark - Public Method

- (void)show
{
    UIWindow *window = [[UIWindow alloc] initWithFrame:(CGRect) {{0.f, 0.f}, [[UIScreen mainScreen] bounds].size}];
    window.backgroundColor = [UIColor clearColor];
    window.windowLevel = UIWindowLevelNormal;
    window.alpha = 1.f;
    window.hidden = NO;
    window.rootViewController = [UIViewController new];
    __sheetWindow = window;
    
    BOOL hasPickerView = NO;
    for (UIView *view in __sheetWindow.subviews) {
        if (view.tag == 888888) {
            hasPickerView = YES;
            break;
        }
    }
    if (!hasPickerView) {
        [__sheetWindow addSubview:self];
    }
    __sheetWindow.hidden = NO;
}

- (void)hidden
{
    __sheetWindow.hidden = YES;
    __sheetWindow = nil;
}

#pragma mark - Private Method

- (void)cancelClicked
{
    [self hidden];
}

- (void)submitClicked
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"yyyy-MM-dd";
    NSString *nowDateStr = [format stringFromDate:[NSDate date]];
    //找出今天0点的时间
    NSDate *date = [format dateFromString:nowDateStr];
    //用户选择的时间  (天  小时  分钟 )
    NSDate *userSelectDate = [date dateByAddingTimeInterval:60 * 60 * 24 * self.col1 + 60 * 60 *self.col2 + 60 * 30 * self.col3];
    
    if (self.onSubmitClickBlock) {
        self.onSubmitClickBlock(userSelectDate);
    }
    
    [self hidden];
    
}

#pragma mark - DataSource & Delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return self.arrDays.count;
    } else if (component == 1) {
        return self.arrHours.count;
    } else {
        return self.arrMinutes.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return self.arrDays[row];
    } else if (component == 1) {
        return [NSString stringWithFormat:@"%@ 点",self.arrHours[row]];
    } else {
        return [NSString stringWithFormat:@"%@ 分",self.arrMinutes[row]];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        self.col1 = row;
    } else if (component == 1) {
        self.col2 = row;
    } else {
        self.col3 = row;
    }
}


@end
