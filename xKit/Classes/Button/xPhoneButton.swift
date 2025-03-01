//
//  xPhoneButton.swift
//  xKit
//
//  Created by Mac on 2025/2/11.
//

import UIKit

public class xPhoneButton: xButton {

    // MARK: - Public Property
    /// 电话
    public var phone = ""
    
    // MARK: - Open Override Func
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.xAddClick {
            [weak self] (sender) in
            guard let self = self else { return }
            var phone = self.phone
            if phone.count == 0 {
                phone = sender.currentTitle ?? ""
            }
            self.call(phone: phone)
        }
    }
    
    // MARK: - Public Func
    /// 设置电话
    /// - Parameters:
    ///   - totalTime: 倒计时时间(默认60s)
    public func reloadData(_ phone : String)
    {
        self.phone = phone
        self.setTitle(phone, for: .normal)
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
