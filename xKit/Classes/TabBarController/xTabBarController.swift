//
//  xTabBarController.swift
//  Alamofire
//
//  Created by Mac on 2020/9/15.
//

import UIKit
import xExtension

open class xTabBarController: UITabBarController {
    
    // MARK: - Public Property
    /// 用于内存释放提示(可快速定位被释放的对象)
    open var typeEmoji : String { return "🚄" }
    
    // MARK: - 内存释放
    deinit {
        let info = self.xClassInfoStruct
        let space = info.space
        let name = info.name
        print("\(self.typeEmoji)【\(space).\(name)】")
    }
    
    // MARK: - Open Override Func
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.tabBar.backgroundColor = .white
        // 模态全屏
        self.modalPresentationStyle = .fullScreen
        // 强制白天模式
        if #available(iOS 13.0, *) {
            self.overrideUserInterfaceStyle = .light
        } else {
            // Fallback on earlier versions
        }
        // 主线程初始化UI
        DispatchQueue.main.async {
            self.addKit()
            self.addChildren()
            self.requestData()
        }
    }
    
    // MARK: - 加载数据
    /// 加载数据
    open func reloadData(titleArray : [String],
                         normalColor : UIColor = .darkGray,
                         selectColor : UIColor = .systemBlue,
                         normalImageArray : [UIImage],
                         selectImageArray : [UIImage],
                         childArray : [UIViewController])
    {
        var childList = [UINavigationController]()
        for vc in childArray {
            // 创建附带导航的子控件
            if let nvc = vc as? UINavigationController {
                childList.append(nvc)
            } else {
                let nvc = xNavigationController.init(rootViewController: vc)
                nvc.navigationBar.isHidden = true
                childList.append(nvc)
            }
        }
        // 默认起始界面
        self.setViewControllers(childList, animated: false)
        // 设置样式
        for i in 0 ..< childList.count {
            let title = titleArray.xObject(at: i)
            self.setTabbarItem(i, title: title)
            self.setTabbarItem(i, titleColor: normalColor)
            self.setTabbarItem(i, selectedTitleColor: selectColor)
            let img1 = normalImageArray.xObject(at: i)
            let img2 = selectImageArray.xObject(at: i)
            self.setTabbarItem(i, image: img1)
            self.setTabbarItem(i, selectedImage: img2)
        }
    }

    // MARK: - 设置TabbarItem标题
    /// 设置TabbarItem标题
    public func setTabbarItem(_ idx : Int,
                              title : String?)
    {
        guard let item = self.tabBar.items?.xObject(at: idx) else { return }
        item.title = title
    }
    /// 设置TabbarItem标题颜色
    public func setTabbarItem(_ idx : Int,
                              titleColor : UIColor)
    {
        guard let item = self.tabBar.items?.xObject(at: idx) else { return }
        let attr = [NSAttributedString.Key.foregroundColor : titleColor]
        let appearance = UITabBarAppearance()
        let state = appearance.stackedLayoutAppearance.normal
        state.titleTextAttributes = attr
        item.standardAppearance = appearance
        item.setTitleTextAttributes(attr, for: .normal)
    }
    /// 设置TabbarItem标题颜色
    public func setTabbarItem(_ idx : Int,
                              selectedTitleColor : UIColor)
    {
        guard let item = self.tabBar.items?.xObject(at: idx) else { return }
        let attr = [NSAttributedString.Key.foregroundColor : selectedTitleColor]
        let appearance = UITabBarAppearance()
        let state = appearance.stackedLayoutAppearance.selected
        state.titleTextAttributes = attr
        item.standardAppearance = appearance
        item.setTitleTextAttributes(attr, for: .normal)
    }
    
    // MARK: - 设置TabbarItem图片
    /// 设置TabbarItem图片
    public func setTabbarItem(_ idx : Int,
                              image : UIImage?,
                              renderingMode : UIImage.RenderingMode = .alwaysOriginal)
    {
        guard let item = self.tabBar.items?.xObject(at: idx) else { return }
        item.image = image?.withRenderingMode(renderingMode)
        
    }
    /// 设置TabbarItem选中图片
    public func setTabbarItem(_ idx : Int,
                              selectedImage : UIImage?,
                              renderingMode : UIImage.RenderingMode = .alwaysOriginal)
    {
        guard let item = self.tabBar.items?.xObject(at: idx) else { return }
        item.selectedImage = selectedImage?.withRenderingMode(renderingMode)
    }
    /// 设置TabbarItem图片间距
    public func setTabbarItem(_ idx : Int,
                              imageInsets : UIEdgeInsets)
    {
        guard let item = self.tabBar.items?.xObject(at: idx) else { return }
        item.imageInsets = imageInsets
    }
    
}
