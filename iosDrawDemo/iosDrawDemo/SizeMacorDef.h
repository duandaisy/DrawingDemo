//
//  SizeMacorDef.h
//  iosDrawDemo
//
//  Created by daisy on 2020/1/4.
//  Copyright © 2020 daisyduan.com. All rights reserved.
//

#ifndef SizeMacorDef_h
#define SizeMacorDef_h

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height


//frame 宏定义
#define ViewWidth(v)                        v.frame.size.width
#define ViewHeight(v)                       v.frame.size.height
#define ViewX(v)                            v.frame.origin.x
#define ViewY(v)                            v.frame.origin.y


#define RectX(f)                            f.origin.x
#define RectY(f)                            f.origin.y

#define RectWidth(f)                        f.size.width
#define RectHeight(f)                       f.size.height

#define MinX(v)                 CGRectGetMinX((v).frame)
#define MinY(v)                 CGRectGetMinY((v).frame)

#define MidX(v)                 CGRectGetMidX((v).frame)
#define MidY(v)                 CGRectGetMidY((v).frame)

#define MaxX(v)                 CGRectGetMaxX((v).frame)
#define MaxY(v)                 CGRectGetMaxY((v).frame)

#define RectWidth(f)                        f.size.width
#define RectHeight(f)                       f.size.height
#define RectSetWidth(f, w)                  CGRectMake(RectX(f), RectY(f), w, RectHeight(f))
#define RectSetHeight(f, h)                 CGRectMake((RectX(f)), (RectY(f)), (RectWidth(f)), h)


// iphone 设备
#define isPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define isPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define isPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define isPhonePLUS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

// iPhone X
#define  iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// 判断是否是iPhone XR
#define iPhoneXR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
// 判断是否是iPhone XS
#define iPhoneXS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// 判断是否是iPhone X Max
#define iPhoneXMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)

// Status bar height.
#define  X_StatusBarHeight      ((iPhoneX  || iPhoneXR || iPhoneXS || iPhoneXMax) ? 44.f : 20.f)

// Navigation bar height.
#define  X_NavigationBarHeight  44.f

// Tabbar height.
#define  X_TabbarHeight         ((iPhoneX || iPhoneXR || iPhoneXS || iPhoneXMax)? (49.f+34.f) : 49.f)

// Tabbar safe bottom margin.
#define  X_TabbarSafeBottomMargin         ((iPhoneX || iPhoneXR || iPhoneXS || iPhoneXMax) ? 34.f : 0.f)

// Status bar & navigation bar height.
#define  X_StatusBarAndNavigationBarHeight  ((iPhoneX || iPhoneXR || iPhoneXS || iPhoneXMax) ? 88.f : 64.f)

#define X_ViewSafeAreInsets(view) ({UIEdgeInsets insets; if(@available(iOS 11.0, *)) {insets = view.safeAreaInsets;} else {insets = UIEdgeInsetsZero;} insets;})



#endif /* SizeMacorDef_h */
