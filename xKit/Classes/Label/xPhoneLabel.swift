//
//  xPhoneLabel.swift
//  xFramework
//
//  Created by Mac on 2025/2/11.
//

import UIKit
import xExtension

public class xPhoneLabel: xLabel {

    // MARK: - Public Property
    /// 电话
    public var phone = ""
    
    // MARK: - Open Override Func
    public override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapPhone(getsure: )))
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
    }
    
    // MARK: - Public Func
    /// 设置电话
    /// - Parameters:
    ///   - totalTime: 倒计时时间(默认60s)
    public func reloadData(_ phone : String)
    {
        self.phone = phone
        self.text = phone
    }

    @objc func tapPhone(getsure: UITapGestureRecognizer)
    {
        var phone = self.phone
        if phone.count == 0 {
            phone = self.text ?? ""
        }
        self.call(phone: phone)
    }
    
    /// 拨打电话
    func call(phone : String)
    {
        guard phone.count > 0 else {
            "电话不能为空".xAlertTip()
            return
        }
        let str = "tel://" + phone
        guard let url = str.xToURL() else { return }
        guard UIApplication.shared.canOpenURL(url) else { return }
//        UIApplication.shared.openURL(url)
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
}
