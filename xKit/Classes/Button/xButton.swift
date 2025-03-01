//
//  xButton.swift
//  Pods-xSDK_Example
//
//  Created by Mac on 2020/9/14.
//

import UIKit

open class xButton: UIButton {
    
    // MARK: - IBInspectable Property
    /// 圆角
    @IBInspectable public var cornerRadius : CGFloat = 0
    /// 边框线
    @IBInspectable public var borderWidth : CGFloat = 0
    /// 边框颜色
    @IBInspectable public var borderColor : UIColor = .clear
    
    /// 图标名称
    @IBInspectable public var imageName : String = ""
    /// 是否显示渲染色
    @IBInspectable public var isRenderingTintColor : Bool = false
    
    // MARK: - Open Override Func
    required public init?(coder aDecoder: NSCoder) {
        // 参考xView说明
        super.init(coder: aDecoder)
    }
    public override func awakeFromNib() {
        super.awakeFromNib()
        self.initCompleted()
    }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.initCompleted()
    }
    /// 初始化完成
    func initCompleted()
    {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.cornerRadius
        self.layer.borderWidth = self.borderWidth
        self.layer.borderColor = self.borderColor.cgColor
        
        self.viewDidLoad()
    }
    
    // MARK: - Open Func
    /// 视图已加载
    open func viewDidLoad() {
        // 默认图片
        guard self.imageName.count > 0 else { return }
        let bundle = Bundle.init(for: self.classForCoder)
        guard let img = self.imageName.xToImage(in: bundle) else { return }
        if self.isRenderingTintColor {
            self.setImage(img.withRenderingMode(.alwaysTemplate), for: .normal)
        } else {
            self.setImage(img, for: .normal)
        }
    }
}

