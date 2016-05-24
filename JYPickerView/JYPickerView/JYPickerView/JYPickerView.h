//
//  JYPickerView.h
//  JYPickerView
//
//  Created by typc on 16/5/24.
//  Copyright © 2016年 com.majinyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYPickerView : UIView

/**
 *  @author mjy
 *
 *  @brief 确定点击
 */
@property (nonatomic, copy) void (^onSubmitClickBlock)(NSInteger col1, NSInteger col2, NSInteger col3);

/**
 *  @author mjy
 *
 *  @brief 天
 */
@property (nonatomic, strong) NSArray *arrDays;

/**
 *  @author mjy
 *
 *  @brief 小时
 */
@property (nonatomic, strong) NSArray *arrHours;

/**
 *  @author mjy
 *
 *  @brief 分钟
 */
@property (nonatomic, strong) NSArray *arrMinutes;




/**
 *  @author mjy
 *
 *  @brief 显示
 */
- (void)show;

/**
 *  @author mjy
 *
 *  @brief 隐藏
 */
- (void)hidden;

@end
