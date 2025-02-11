//
//  xTagLabel.swift
//  Alamofire
//
//  Created by Mac on 2024/6/1.
//

import UIKit

public class xTagLabel: xLabel {

    // 5个角的位置
    /*
                line1
        arc0 —————————— arc1
        |                   \ line2
  line0 |                    \
  line0 |                    /
        |                   / line2
        arc3 —————————— arc2
                line3
     */
    
    // MARK: - IBInspectable Property
    /// 填充色
    @IBInspectable public var fillColor : UIColor = .clear

    // MARK: - Private Property
    /// 不规则圆角图层
    private let tagLayer = CAShapeLayer()
    
    // MARK: - Public Override Func
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.backgroundColor = .clear
        
        self.tagLayer.masksToBounds = true
        self.tagLayer.backgroundColor = UIColor.clear.cgColor
        self.tagLayer.fillColor = self.fillColor.cgColor
        self.tagLayer.lineWidth = 1
        self.tagLayer.lineCap = .round
        self.tagLayer.lineJoin = .round
        self.layer.addSublayer(self.tagLayer)
    } 
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.tagLayer.frame = self.bounds
    }
    public override func draw(_ rect: CGRect)
    {
        let r = self.cornerRadius
        let a = CGFloat(10) // 角宽
        let w = self.bounds.width
        let h = self.bounds.width
        let path = UIBezierPath.init()
        path.move(to: .init(x: r, y: 0))
        path.addLine(to: .init(x: w - a, y: 0))
        path.addLine(to: .init(x: w, y: h / 2))
        path.addLine(to: .init(x: w - a, y: h))
        path.addLine(to: .init(x: r, y: h))
        path.addArc(withCenter: .init(x: r, y: h - r),
                    radius: r,
                    startAngle: .pi,
                    endAngle: .pi,
                    clockwise: true)
        path.addLine(to: .init(x: 0, y: r))
        path.addArc(withCenter: .init(x: r, y: r),
                    radius: r,
                    startAngle: .pi,
                    endAngle: .pi,
                    clockwise: true)
        
        self.tagLayer.path = path.cgPath
    }

}
