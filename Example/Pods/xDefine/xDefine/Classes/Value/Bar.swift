//
//  Bar.swift
//  xDefine
//
//  Created by Mac on 2021/6/10.
//

import UIKit

/// 状态栏高度
/// 'statusBarFrame' was deprecated in iOS 13.0: Use the statusBarManager property of the window scene instead
//public let xStatusBarHeight = UIApplication.shared.statusBarFrame.height 
public let xStatusBarHeight = xKeyWindow?.windowScene?.statusBarManager?.statusBarFrame.height ?? 20
/// 导航栏高度
public let xNavigationBarHeight = UINavigationController().navigationBar.frame.height
/// 菜单栏高度
public let xTabBarHeight = UITabBarController().tabBar.frame.height
