//
//  LDLineView.m
//  iosDrawDemo
//
//  Created by daisy on 2020/1/4.
//  Copyright © 2020 daisyduan.com. All rights reserved.
//

#import "LDLineView.h"

@implementation LDLineView

- (void)drawRect:(CGRect)rect {

    switch (self.viewType) {
        case 1: //1.绘制线条
        {
            [self drawLineImageWithRect:rect];
        }
            break;
        case 2: //2.绘制线条,三角形
        {
            [self drawTiangleImageWithRect:rect];
        }
            break;
        case 3: //3.绘制虚心矩形
        {
            [self drawDashRectImageWithRect:rect];
        }
            break;
        case 4: //4.绘制实心矩形
        {
            [self drawFillRectImageWithRect:rect];
        }
            break;
        case 5: //5.绘制弧线
        {
             [self drawArcWithRect:rect];
        }
            break;
        case 6: //6.绘制图像
        {
            [self drawImageWithRect:rect];
        }
            break;
        case 7: //7.绘制文字
        {
            [self drawWordWithRect:rect];
        }
            break;
        case 9:  //9.绘制虚线
        {
            [self drawDashLineWithRect:rect];
        }
            break;
            
        default:
            break;
    }
    
        //1.绘制线条
    //    [self drawLineImageWithRect:rect];
        //2.绘制线条,三角形
    //    [self drawTiangleImageWithRect:rect];
        //3.绘制虚心矩形
    //    [self drawDashRectImageWithRect:rect];
        //4.绘制实心矩形
    //    [self drawFillRectImageWithRect:rect];
        //5.绘制弧线
    //    [self drawArcWithRect:rect];
        //6.绘制图像
    //    [self drawImageWithRect:rect];
        //7.绘制文字
    //    [self drawWordWithRect:rect];
        //8.绘制多路径图形
        //9.绘制虚线
    //    [self drawDashLineWithRect:rect];
    
}

//采用3中方式，推荐使用第三种方式
-(void)drawDashLineWithRect:(CGRect)rect
{
    if (self.dashWidth < rect.size.width) {
        /*
         //        在使用Quartz 2D来绘制虚线最重要也最为强大的一个函数是CGContextSetLineDash(CGContextRef c,CGFloat phase, const CGFloat lengths[],size_t count)，这个函数的第3个参数是关键，该参数是一个CGFloat型数组（第4个参数通常用于指定该数组的长度），每个CGFloat值依次控制点线的实线长度、间距。
         //         lengths 说明虚线如何交替绘制，lengths的值(4,4)表示先绘制4个点，再跳过4个点，如此反复
         //        */
        
        //方法一：
//        //获取上下文
//        CGContextRef context = UIGraphicsGetCurrentContext();
//        //开始一个路径
//        CGContextBeginPath(context);
//        //设置虚线粗细
//        CGContextSetLineWidth(context, self.dashWidth);
//        //设置虚线颜色
//        CGContextSetStrokeColorWithColor(context, self.dashColor.CGColor);
        
//        //画虚线
//        CGFloat lenghts[] = {4,4};
//        CGContextSetLineDash(context, 0, lenghts, 2);
//        //设置开始点位置
//        CGContextMoveToPoint(context, 0.0, rect.size.height/2);
//        //设置终点位置
//        CGContextAddLineToPoint(context, rect.size.width, rect.size.height/2);
//        //开始绘制
//        CGContextStrokePath(context);
//        //封闭当前线路
//        CGContextClosePath(context);
        
//        //方法二  路径方法
//        //获取上下文
//        CGContextRef context = UIGraphicsGetCurrentContext();
//        //开始一个路径
//        CGMutablePathRef path = CGPathCreateMutable();
//        //设置虚线粗细
//        CGContextSetLineWidth(context, self.dashWidth);
//        //设置虚线颜色
//        CGContextSetStrokeColorWithColor(context, self.dashColor.CGColor);
//        //绘制虚线
//        CGFloat lenghts[] = {2,4,2};
//        CGContextSetLineDash(context, 0, lenghts, 3);
//        //设置开始点位置
//        CGPathMoveToPoint(path, NULL, 0.0, rect.size.height/2);
//        //设置终点位置
//        CGPathAddLineToPoint(path, NULL, rect.size.width, rect.size.height/2);
//        //将路径加到上下文
//        CGContextAddPath(context, path);
//        //绘图
//        CGContextDrawPath(context, kCGPathStroke);
//        //释放路径
//        CGPathRelease(path);
        
        //方法三  直接使用上下文内置的路径进行绘图而不是用上下文+路径的方法
        //获取上下文
        CGContextRef context = UIGraphicsGetCurrentContext();
        //设置虚线粗细
        CGContextSetLineWidth(context, self.dashWidth);
        //设置虚线颜色
        CGContextSetStrokeColorWithColor(context, self.dashColor.CGColor);
        //绘制虚线
        CGFloat lenghts[] = {2,4};
        CGContextSetLineDash(context, 0, lenghts,2);
        //设置开始点位置
        CGContextMoveToPoint(context, 0.0, rect.size.height/2);
        //设置终点位置
        CGContextAddLineToPoint(context, rect.size.width, rect.size.height/2);
        //绘图
        CGContextDrawPath(context, kCGPathStroke);
        
    }
}

//绘制虚线
-(void)setLineColor:(UIColor *)lineColor LineWidth:(CGFloat)lineWidth
{
    _dashColor = lineColor;
    _dashWidth = lineWidth;
}

//绘制三角形 直接使用上下文内置的路径进行绘图而不是用上下文+路径的方法
-(void)drawTiangleImageWithRect:(CGRect)rect
{
    //1.获取当前图行的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //2.设置上下文的路径
    CGContextMoveToPoint(context, (rect.size.width - 10)/2, rect.origin.y +10);
    CGContextAddLineToPoint(context, rect.origin.x + 5, rect.size.height - 10);
    CGContextAddLineToPoint(context, rect.size.width - 10, rect.size.height -10);
    CGContextAddLineToPoint(context, (rect.size.width - 10)/2, rect.origin.y +10);
    
    //3.关闭路径
//    CGContextClosePath(context);
    
    //4.设置线条颜色
    [[UIColor redColor] setStroke];
    [[UIColor magentaColor] setFill];
    [[UIColor greenColor] set];
    
    //5.绘制上下文
    CGContextDrawPath(context, kCGPathFillStroke);
    
    /*
     * 填充模式
     * kCGPathFill            填充绘制，针对关闭的路径使用
     * kCGPathStroke          绘制线条，无所谓路径是否关闭
     * kCGPathFillStroke      填充并绘制线条
     * kCGPathEOFill          异或填充，针对关闭路径使用
     * kCGPathEOFillStroke    异或填充并画线
     */
}

//绘制线
-(void)drawLineImageWithRect:(CGRect)rect
{
    //1.获取当前图行上下文，就是要绘制到屏幕
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //2.设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    //2.1移动到某一个点
    CGPathMoveToPoint(path, NULL, rect.origin.x, rect.origin.y);
    //2.2增加一条线
    CGPathAddLineToPoint(path, NULL, rect.size.width, rect.size.height);
    
    //3.将路径添加到上下文
    CGContextAddPath(context, path);

    //4.设置上下文
    //4.1 设置线条颜色
    CGContextSetRGBStrokeColor(context, 220.0/255, 20.0/255, 60.0/255, 1);
    //4.2 设置线条透明度
//    CGContextSetAlpha(context, 0.5);
    
    //5.将上下文中的路径绘制出来
    CGContextDrawPath(context, kCGPathStroke);
    
    //6.绘制完毕，释放路径
    CGPathRelease(path);
    
    //遇到create retain之类的C语言语句，是需要手动释放内存的。这块没有跟着ARC的内存管理方式进行操作
}


//绘制多路径图形
-(void)drawMutiplyImageWithRect:(CGRect)rect
{
    
}

//绘制文字
-(void)drawWordWithRect:(CGRect)rect
{
    UIFont *font = [UIFont systemFontOfSize:15];
    NSDictionary *dict = @{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor redColor]};
//    CGRect rect =[self.drawText boundingRectWithSize:CGSizeMake(rect.size.width - 10, rect.size.height - 10) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
//    rect.origin = CGPointMake(rect.origin.x, rect.origin.y);

    [[UIColor lightGrayColor] set];
    UIRectFill(rect);
    
    [self.drawText drawInRect:rect withAttributes:dict];
}

//绘制图像 提示：绘制的图像，只能看不能交互，相对而言，性能比UIImageView要高
-(void)drawImageWithRect:(CGRect)rect
{
    UIImage *image = [UIImage imageNamed:@"logoImage"];
    //1.在指定坐标绘制
//    [image drawAtPoint:CGPointMake(rect.size.width/4, rect.size.height/4)];
    //2.在指定区域内拉伸绘制
//    [image drawInRect:rect];
    //3.平铺绘制
//    [image drawAsPatternInRect:rect];
    //4.改变图片的颜色，颜色混合
    [image drawInRect:rect blendMode:self.blendMode alpha:1];

    
    /*
    //正常；也是默认的模式。前景图会覆盖背景图
    kCGBlendModeNormal

    // 正片叠底；混合了前景和背景的颜色，最终颜色比原先的都暗
    kCGBlendModeMultiply

    //滤色；把前景和背景图的颜色先反过来，然后混合
    kCGBlendModeScreen

    // 覆盖；能保留灰度信息，结合
    kCGBlendModeOverlay

    //覆盖；能保留灰度信息，结合kCGBlendModeSaturation能保留透明度信息，
    //在imageWithBlendMode方法中两次执行drawInRect方法实现我们基本需求";
    kCGBlendModeOverlay:

    kCGBlendModeDarken// 变暗
    kCGBlendModeLighten// 变亮
    kCGBlendModeColorDodge// 颜色变淡
    kCGBlendModeColorBurn//颜色加深
    kCGBlendModeSoftLight// 柔光
    kCGBlendModeHardLight// 强光
    kCGBlendModeDifference//插值
    kCGBlendModeExclusion//排除
    kCGBlendModeHue// 色调
    kCGBlendModeSaturation//饱和度
    kCGBlendModeColor// 颜色
    kCGBlendModeLuminosity// 亮度

     //Apple额外定义的枚举
                //R: premultiplied result, 表示混合结果
                //S: Source, 表示源颜色(Sa对应透明度值: 0.0-1.0)
                //D: destination colors with alpha, 表示带透明度的目标颜色(Da对应透明度值: 0.0-1.0)
    R表示结果，S表示包含alpha的原色，D表示包含alpha的目标色，Ra，Sa和Da分别是三个的alpha。明白了这些以后，就可以开始寻找我们所需要的blend模式了。相信你可以和我一样，很快找到这个模式

    kCGBlendModeClear: R = 0
    kCGBlendModeCopy: R = S
    kCGBlendModeSourceIn: R = S*Da //就是说目标色 = 原色*目标色的透明度
    kCGBlendModeSourceOut: R = S*(1 - Da)
    kCGBlendModeSourceAtop: R = S*Da + D*(1 - Sa)
    kCGBlendModeDestinationOver: R = S*(1 - Da) + D
    kCGBlendModeXOR: R = S*(1 - Da) + D*(1 - Sa)
    kCGBlendModePlusDarker: R = MAX(0, (1 - D) + (1 - S)
    kCGBlendModePlusLighter: R = MIN(1, S + D)（最后一种混合模式）
     */
}

- (void)changeBlendMode:(UIGestureRecognizer*)gesture {
    static CGBlendMode blendMode = kCGBlendModeNormal;
    NSString *strMsg;
    switch (blendMode) {
        case kCGBlendModeNormal: {
            strMsg = @"kCGBlendModeNormal: 正常；也是默认的模式。前景图会覆盖背景图";
            break;
        }
        case kCGBlendModeMultiply: {
            strMsg = @"kCGBlendModeMultiply: 正片叠底；混合了前景和背景的颜色，最终颜色比原先的都暗";
            break;
        }
        case kCGBlendModeScreen: {
            strMsg = @"kCGBlendModeScreen: 滤色；把前景和背景图的颜色先反过来，然后混合";
            break;
        }
        case kCGBlendModeOverlay: {
            strMsg = @"kCGBlendModeOverlay: 覆盖；能保留灰度信息，结合kCGBlendModeSaturation能保留透明度信息，在imageWithBlendMode方法中两次执行drawInRect方法实现我们基本需求";
            break;
        }
        case kCGBlendModeDarken: {
            strMsg = @"kCGBlendModeDarken: 变暗";
            break;
        }
        case kCGBlendModeLighten: {
            strMsg = @"kCGBlendModeLighten: 变亮";
            break;
        }
        case kCGBlendModeColorDodge: {
            strMsg = @"kCGBlendModeColorDodge: 颜色变淡";
            break;
        }
        case kCGBlendModeColorBurn: {
            strMsg = @"kCGBlendModeColorBurn: 颜色加深";
            break;
        }
        case kCGBlendModeSoftLight: {
            strMsg = @"kCGBlendModeSoftLight: 柔光";
            break;
        }
        case kCGBlendModeHardLight: {
            strMsg = @"kCGBlendModeHardLight: 强光";
            break;
        }
        case kCGBlendModeDifference: {
            strMsg = @"kCGBlendModeDifference: 插值";
            break;
        }
        case kCGBlendModeExclusion: {
            strMsg = @"kCGBlendModeExclusion: 排除";
            break;
        }
        case kCGBlendModeHue: {
            strMsg = @"kCGBlendModeHue: 色调";
            break;
        }
        case kCGBlendModeSaturation: {
            strMsg = @"kCGBlendModeSaturation: 饱和度";
            break;
        }
        case kCGBlendModeColor: {
            strMsg = @"kCGBlendModeColor: 颜色";
            break;
        }
        case kCGBlendModeLuminosity: {
            strMsg = @"kCGBlendModeLuminosity: 亮度";
            break;
        }
            //Apple额外定义的枚举
            //R: premultiplied result, 表示混合结果
            //S: Source, 表示源颜色(Sa对应透明度值: 0.0-1.0)
            //D: destination colors with alpha, 表示带透明度的目标颜色(Da对应透明度值: 0.0-1.0)
        case kCGBlendModeClear: {
            strMsg = @"kCGBlendModeClear: R = 0";
            break;
        }
        case kCGBlendModeCopy: {
            strMsg = @"kCGBlendModeCopy: R = S";
            break;
        }
        case kCGBlendModeSourceIn: {
            strMsg = @"kCGBlendModeSourceIn: R = S*Da";
            break;
        }
        case kCGBlendModeSourceOut: {
            strMsg = @"kCGBlendModeSourceOut: R = S*(1 - Da)";
            break;
        }
        case kCGBlendModeSourceAtop: {
            strMsg = @"kCGBlendModeSourceAtop: R = S*Da + D*(1 - Sa)";
            break;
        }
        case kCGBlendModeDestinationOver: {
            strMsg = @"kCGBlendModeDestinationOver: R = S*(1 - Da) + D";
            break;
        }
        case kCGBlendModeDestinationIn: {
            strMsg = @"kCGBlendModeDestinationIn: R = D*Sa；能保留透明度信息";
            break;
        }
        case kCGBlendModeDestinationOut: {
            strMsg = @"kCGBlendModeDestinationOut: R = D*(1 - Sa)";
            break;
        }
        case kCGBlendModeDestinationAtop: {
            strMsg = @"kCGBlendModeDestinationAtop: R = S*(1 - Da) + D*Sa";
            break;
        }
        case kCGBlendModeXOR: {
            strMsg = @"kCGBlendModeXOR: R = S*(1 - Da) + D*(1 - Sa)";
            break;
        }
        case kCGBlendModePlusDarker: {
            strMsg = @"kCGBlendModePlusDarker: R = MAX(0, (1 - D) + (1 - S))";
            break;
        }
        case kCGBlendModePlusLighter: {
            strMsg = @"kCGBlendModePlusLighter: R = MIN(1, S + D)（最后一种混合模式）";
            break;
        }
        default: {
            break;
        }
    }
    
}

//绘制弧线
-(void)drawArcWithRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddArc(context, rect.origin.x, rect.origin.y, rect.size.width/2, 0, M_PI, 0);
    [[UIColor redColor] set];
    CGContextDrawPath(context, kCGPathFill);

    
    /**
        弧线参数：
        
        1）上下文
        2) x, y 弧线所在圆上的圆心
        3）半径
        4) 开始角度、结束角度，0度是圆形最右侧的点
        5) 顺时针：0 逆时针：1
        */
}

//绘制虚心矩形
-(void)drawDashRectImageWithRect:(CGRect)rect
{
    [[UIColor blueColor] set];
    UIRectFrame(rect);
}

//绘制实心矩形
-(void)drawFillRectImageWithRect:(CGRect)rect
{
    [[UIColor redColor] set];
    UIRectFill(rect);
}




@end
