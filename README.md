## JYPickerView
======
###时间选择,可选取:天(今天和明天)、小时(24小时)、分钟(0分和30分).
------
####如何使用  
* 1.将JYPickerView.h 和 JYPickerView.m 拖入您的工程<br>
* 2.在需要的ViewControlller中 <br>
\#import JYPickerView.h <br>
声明属性 JYPickerView *datePicker; <br>
并初始化 datePicker = [[JYPickerView alloc] initWithFrame:[UIScreen mainScreen].bounds]; <br>
调用 show 方法即可 [datePicker show]; <br>
* 3.实现block回调 <br>
datePicker.onSubmitClickBlock = ^(NSDate *date){//这是处理回调事件};

![](https://github.com/majinyu888/JYPickerView/blob/master/JYPickerViewDemo.gif)  



  
