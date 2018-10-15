//
//  PGVerticalLabel.swift
//  SwiftProject
//
//  Created by renxun on 2018/10/15.
//  Copyright © 2018 renxun. All rights reserved.
//

import UIKit

enum VerticalAlignment {
    case Top    //上居中
    case Middle //中居中
    case Bottom //低居中
}

@IBDesignable
class PGVerticalLabel: UILabel {
    
   var verticalAlignment: VerticalAlignment {
        didSet {
            // 重新布局
            self.setNeedsDisplay()
        }
    }
    
//    @IBInspectable var cornerRadius: CGFloat = 0 {
//        didSet {
//            layer.cornerRadius = cornerRadius
//            layer.masksToBounds = cornerRadius > 0
//        }
//    }
    
    //所有类的存储属性——包括从它的父类继承的所有属性——都必须在初始化期间分配初始值。
    override init(frame: CGRect) {
        self.verticalAlignment = VerticalAlignment.Middle;
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.verticalAlignment = VerticalAlignment.Middle;
        super.init(coder: aDecoder)
    }
    
    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        var textRect = super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
        
        switch self.verticalAlignment {
        case .Top:
            textRect.origin.y = bounds.origin.y
        case .Bottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
        default:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
        }
        return textRect;
    }
    
    override func drawText(in rect: CGRect) {
        let actualRect = self.textRect(forBounds: rect, limitedToNumberOfLines: self.numberOfLines)
        super.drawText(in: actualRect)
    }

}
