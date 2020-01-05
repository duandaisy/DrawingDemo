//
//  LDLineView.h
//  iosDrawDemo
//
//  Created by daisy on 2020/1/4.
//  Copyright © 2020 daisyduan.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LDLineView : UIView

//颜色混合模式
@property (nonatomic,assign)CGBlendMode blendMode;
//绘制文字
@property (nonatomic,strong)NSString *drawText;
//虚线粗细
@property (nonatomic,assign)CGFloat dashWidth;
//虚线颜色
@property (nonatomic,strong)UIColor *dashColor;

//图形类型 1.绘制线条 2.绘制线条,三角形 3.绘制虚心矩形 4.绘制实心矩形 5.绘制弧线 6.绘制图像 7.绘制文字 9.绘制虚线
@property (nonatomic,assign)NSInteger viewType;

-(void)setLineColor:(UIColor *)lineColor LineWidth:(CGFloat)lineWidth;


@end

NS_ASSUME_NONNULL_END
