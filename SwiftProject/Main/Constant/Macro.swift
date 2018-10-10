//
//  Macro.swift
//  qutui-development
//
//  Created by renxun on 2018/7/4.
//  Copyright © 2018年 QuTui Science and Technology Co., Ltd. All rights reserved.
//

import UIKit

/**
 * iOS-swift常用常量以及通用函数小总结
 *****************************************************************
 ***| 1. APP屏幕(UIScreen)大小相关
 ***| 2. App Version / Info Plist  系统版本比较等
 ***| 3. catch缓存文件夹和Documents文件夹
 ***| 4. 字体 UIFont  只列举一种，其他的换名称自己可定义
 ******************************************************************
 */

///////////////////////////////////////////////////////////////////////////////////////////////////
//
//  1. App 屏幕相关   Frame   Bounds
//
///////////////////////////////////////////////////////////////////////////////////////////////////
let kScreenBounds                         = UIScreen.main.bounds                    /* 屏幕Bounds */
let kScreenSize                           = kScreenBounds.size                      /* 屏幕大小 */
let kScreenWidth:CGFloat                  = kScreenSize.width                       /* 屏幕宽度 */
let kScreenHeight:CGFloat                 = kScreenSize.height                      /* 屏幕高度 */
let kNavigationHeight :CGFloat            = 44                                      /* 导航条高度*/
let kStatuBarHeight   :CGFloat            = UIApplication.shared.statusBarFrame.size.height  /* 状态栏高度 20*/
let kTabbarHeight                         = 49
let kNavigationHeightAndStatuBarHeight    = kNavigationHeight + kStatuBarHeight

//屏幕分辨率比例
let screenScale:CGFloat = UIScreen.main.responds(to: #selector(getter: UIScreen.main.scale)) ? UIScreen.main.scale : 1.0
//相对于iPhone6的宽度比例(设计图尺寸)
let screenWidthRatio:CGFloat =  kScreenWidth / 375;
let screenHeightRatio:CGFloat = kScreenHeight / 667;

//根据传入的值算出乘以比例之后的值
func adaptedWidth(width:CGFloat) ->CGFloat {
    return CGFloat(ceil(Float(width))) * screenWidthRatio
}

func adaptedHeight(height:CGFloat) ->CGFloat {
    return CGFloat(ceil(Float(height))) * screenHeightRatio
}

func iPhone5() ->Bool {
    return UIScreen.main.bounds.size.height == 568.0
}

func overIphone5() ->Bool {
    return UIScreen.main.bounds.size.height > 568.0
}

func iPhone6() ->Bool {
    return UIScreen.main.bounds.size.height == 667.0
}

func iPhonePlus() ->Bool {
    return UIScreen.main.bounds.size.height == 736.0
}

func isIPhoneX() ->Bool {
    return __CGSizeEqualToSize(CGSize.init(width: 375, height: 812), kScreenBounds.size)
}

func isIPhoneXsMax() ->Bool {
    return __CGSizeEqualToSize(CGSize.init(width: 414, height: 896), kScreenBounds.size)
}

func tabBarBottomMargin()->Int {
    var safeBottom = 0
    if (isIPhoneX() || isIPhoneXsMax()) {
        safeBottom = 34
    }
    return safeBottom;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
//
//  2.App Version / Info Plist  设备系统版本
//
///////////////////////////////////////////////////////////////////////////////////////////////////

/* 设备系统相关  */
let kDeviceVersionStr:String  = UIDevice.current.systemVersion         /* iOS系统版本 */
let osType:String             = UIDevice.current.systemName + UIDevice.current.systemVersion

/* app版本  以及设备系统版本 */
let infoDictionary            = Bundle.main.infoDictionary
let kAppName: String?         = infoDictionary!["CFBundleDisplayName"] as? String        /* App名称 */
let kAppVersion: String?      = infoDictionary!["CFBundleShortVersionString"] as? String /* App版本号 */
let kAppBuildVersion: String? = infoDictionary!["CFBundleVersion"] as? String            /* Appbuild版本号 */
let kAppBundleId: String?     = infoDictionary!["CFBundleIdentifier"] as? String                 /* app bundleId */
let platformName: String?     = infoDictionary!["DTPlatformName"] as? String  //平台名称（iphonesimulator 、 iphone）

//版本号相同
func systemVersionEqual(version:String) ->Bool {
    return UIDevice.current.systemVersion == version
}

//系统版本高于等于该version  测试发现只能传入带一位小数点的版本号  不然会报错 具体原因待探究
func systemVersionGreaterThan(version:String) ->Bool {
    return UIDevice.current.systemVersion.compare(version, options: .numeric, range: version.startIndex..<version.endIndex, locale: Locale(identifier:version)) != ComparisonResult.orderedAscending
}

//系统版本低于等于该version  测试发现只能传入带一位小数点的版本号  不然会报错 具体原因待探究
func systemVersionLessThan(version:String) ->Bool {
    return UIDevice.current.systemVersion.compare(version, options: .numeric, range: version.startIndex..<version.endIndex, locale: Locale(identifier:version)) != ComparisonResult.orderedDescending
}

///////////////////////////////////////////////////////////////////////////////////////////////////
//
//  3. catch缓存文件夹和Documents文件夹
//
///////////////////////////////////////////////////////////////////////////////////////////////////

let QTUserDefault = UserDefaults.standard
/// Cache缓存文件夹
let cacheDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last
/// Documents文件夹
let documentsDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//  4. 字体 UIFont  只列举一种，其他的换名称自己可定义
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

/// 平方常规体
func QTFont(size __SIZE__:CGFloat) ->UIFont {
    return UIFont.init(name: "PingFangSC-Regular", size: __SIZE__)!
}
/// 平方中体
func QTMediumFont(size __SIZE__:CGFloat) ->UIFont {
    return UIFont.init(name: "PingFangSC-Medium", size: __SIZE__)!
}


