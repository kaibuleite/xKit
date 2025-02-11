//
//  xLabel.swift
//  Alamofire
//
//  Created by Mac on 2024/6/1.
//

import UIKit

open class xLabel: UILabel {
    
    // MARK: - IBInspectable Property
    /// 圆角
    @IBInspectable public var cornerRadius : CGFloat = 0
    /// 边框线
    @IBInspectable public var borderWidth : CGFloat = 0
    /// 边框颜色
    @IBInspectable public var borderColor : UIColor = .clear  
    
    // MARK: - Public Override Func
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
    }
    
}
