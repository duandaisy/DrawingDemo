//
//  Quartz2DDemo.m
//  iosDrawDemo
//
//  Created by daisy on 2020/1/4.
//  Copyright © 2020 daisyduan.com. All rights reserved.
//

#import "Quartz2DDemo.h"
#import "LDLineView.h"

@interface Quartz2DDemo ()
{
    UIImage *image;
    LDLineView *lineView;
    int index;
}
@end

@implementation Quartz2DDemo

- (void)viewDidLoad {
    [super viewDidLoad];

    index = 0;
    self.view.backgroundColor = [UIColor whiteColor];
    lineView = [[LDLineView alloc] init];
    lineView.viewType = 0;
    lineView.drawText = @"2020年，一切顺利美好！！！";
    lineView.frame = CGRectMake(50, 100, 300, 100);
    [lineView setLineColor:[UIColor grayColor] LineWidth:2.0];
    lineView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:lineView];
    

    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    static CGBlendMode blendMode = kCGBlendModeNormal;
    if (lineView.viewType == 6) {
        if (index > 30) {
            index = 0;
        }
        NSString *strMsg;
        switch (index) {
            case kCGBlendModeNormal: {
                strMsg = @"kCGBlendModeNormal: 正常；也是默认的模式。前景图会覆盖背景图";
                lineView.blendMode = kCGBlendModeNormal;
                
                break;
            }
            case kCGBlendModeMultiply: {
                strMsg = @"kCGBlendModeMultiply: 正片叠底；混合了前景和背景的颜色，最终颜色比原先的都暗";
                lineView.blendMode = kCGBlendModeMultiply;
                break;
            }
            case kCGBlendModeScreen: {
                strMsg = @"kCGBlendModeScreen: 滤色；把前景和背景图的颜色先反过来，然后混合";
                lineView.blendMode = kCGBlendModeScreen;
                break;
            }
            case kCGBlendModeOverlay: {
                strMsg = @"kCGBlendModeOverlay: 覆盖；能保留灰度信息，结合kCGBlendModeSaturation能保留透明度信息，在imageWithBlendMode方法中两次执行drawInRect方法实现我们基本需求";
                lineView.blendMode = kCGBlendModeOverlay;
                break;
            }
            case kCGBlendModeDarken: {
                strMsg = @"kCGBlendModeDarken: 变暗";
                lineView.blendMode = kCGBlendModeDarken;
                break;
            }
            case kCGBlendModeLighten: {
                strMsg = @"kCGBlendModeLighten: 变亮";
                lineView.blendMode = kCGBlendModeLighten;
                break;
            }
            case kCGBlendModeColorDodge: {
                strMsg = @"kCGBlendModeColorDodge: 颜色变淡";
                lineView.blendMode = kCGBlendModeColorDodge;
                break;
            }
            case kCGBlendModeColorBurn: {
                strMsg = @"kCGBlendModeColorBurn: 颜色加深";
                lineView.blendMode = kCGBlendModeColorBurn;
                break;
            }
            case kCGBlendModeSoftLight: {
                strMsg = @"kCGBlendModeSoftLight: 柔光";
                lineView.blendMode = kCGBlendModeSoftLight;
                break;
            }
            case kCGBlendModeHardLight: {
                strMsg = @"kCGBlendModeHardLight: 强光";
                lineView.blendMode = kCGBlendModeHardLight;
                break;
            }
            case kCGBlendModeDifference: {
                strMsg = @"kCGBlendModeDifference: 插值";
                lineView.blendMode = kCGBlendModeDifference;
                break;
            }
            case kCGBlendModeExclusion: {
                strMsg = @"kCGBlendModeExclusion: 排除";
                lineView.blendMode = kCGBlendModeExclusion;
                break;
            }
            case kCGBlendModeHue: {
                strMsg = @"kCGBlendModeHue: 色调";
                lineView.blendMode = kCGBlendModeHue;
                break;
            }
            case kCGBlendModeSaturation: {
                strMsg = @"kCGBlendModeSaturation: 饱和度";
                lineView.blendMode = kCGBlendModeSaturation;
                break;
            }
            case kCGBlendModeColor: {
                strMsg = @"kCGBlendModeColor: 颜色";
                lineView.blendMode = kCGBlendModeColor;
                break;
            }
            case kCGBlendModeLuminosity: {
                strMsg = @"kCGBlendModeLuminosity: 亮度";
                lineView.blendMode = kCGBlendModeLuminosity;
                break;
            }
                //Apple额外定义的枚举
                //R: premultiplied result, 表示混合结果
                //S: Source, 表示源颜色(Sa对应透明度值: 0.0-1.0)
                //D: destination colors with alpha, 表示带透明度的目标颜色(Da对应透明度值: 0.0-1.0)
            case kCGBlendModeClear: {
                strMsg = @"kCGBlendModeClear: R = 0";
                lineView.blendMode = kCGBlendModeClear;
                break;
            }
            case kCGBlendModeCopy: {
                strMsg = @"kCGBlendModeCopy: R = S";
                lineView.blendMode = kCGBlendModeCopy;
                break;
            }
            case kCGBlendModeSourceIn: {
                strMsg = @"kCGBlendModeSourceIn: R = S*Da";
                lineView.blendMode = kCGBlendModeSourceIn;
                break;
            }
            case kCGBlendModeSourceOut: {
                strMsg = @"kCGBlendModeSourceOut: R = S*(1 - Da)";
                lineView.blendMode = kCGBlendModeSourceOut;
                break;
            }
            case kCGBlendModeSourceAtop: {
                strMsg = @"kCGBlendModeSourceAtop: R = S*Da + D*(1 - Sa)";
                lineView.blendMode = kCGBlendModeSourceAtop;
                break;
            }
            case kCGBlendModeDestinationOver: {
                strMsg = @"kCGBlendModeDestinationOver: R = S*(1 - Da) + D";
                lineView.blendMode = kCGBlendModeDestinationOver;
                break;
            }
            case kCGBlendModeDestinationIn: {
                strMsg = @"kCGBlendModeDestinationIn: R = D*Sa；能保留透明度信息";
                lineView.blendMode = kCGBlendModeDestinationIn;
                break;
            }
            case kCGBlendModeDestinationOut: {
                strMsg = @"kCGBlendModeDestinationOut: R = D*(1 - Sa)";
                lineView.blendMode = kCGBlendModeDestinationOut;
                break;
            }
            case kCGBlendModeDestinationAtop: {
                strMsg = @"kCGBlendModeDestinationAtop: R = S*(1 - Da) + D*Sa";
                lineView.blendMode = kCGBlendModeDestinationAtop;
                break;
            }
            case kCGBlendModeXOR: {
                strMsg = @"kCGBlendModeXOR: R = S*(1 - Da) + D*(1 - Sa)";
                lineView.blendMode = kCGBlendModeXOR;
                break;
            }
            case kCGBlendModePlusDarker: {
                strMsg = @"kCGBlendModePlusDarker: R = MAX(0, (1 - D) + (1 - S))";
                lineView.blendMode = kCGBlendModePlusDarker;
                break;
            }
            case kCGBlendModePlusLighter: {
                strMsg = @"kCGBlendModePlusLighter: R = MIN(1, S + D)（最后一种混合模式）";
                lineView.blendMode = kCGBlendModePlusLighter;
                break;
            }
            default: {
                break;
            }
        }
        [lineView setNeedsDisplay];
        index++;
        

    }
    else if(lineView.viewType > 9)
    {
        lineView.viewType = 0;
    }
    else // 0-9
    {
        NSLog(@"====%ld",lineView.viewType);
    }
    [lineView setNeedsDisplay];
    lineView.viewType++;
    
}

//绘制图像 提示：绘制的图像，只能看不能交互，相对而言，性能比UIImageView要高
-(void)drawImageWithRect:(CGRect)rect andImage:(UIImage *)img blendMode:(CGBlendMode)blendMode
{
    //1.在指定坐标绘制
//    [image drawAtPoint:CGPointMake(rect.size.width/4, rect.size.height/4)];
    //2.在指定区域内拉伸绘制
//    [image drawInRect:rect];
    //3.平铺绘制
//    [image drawAsPatternInRect:rect];
    //4.改变图片的颜色，颜色混合
    [img drawInRect:rect blendMode:blendMode alpha:1];
    
    
    
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



@end
