//
//  UIImageView.swift
//  UIExtensions
//
//  Created by abuzeid on 4/28/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
extension UIImageView {
    private struct AssociatedKey {
        static var rounded = "UIImageView.rounded"
    }

    @IBInspectable var rounded: Bool {
        get {
            if let rounded = objc_getAssociatedObject(self, &AssociatedKey.rounded) as? Bool {
                return rounded
            } else {
                return false
            }
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKey.rounded, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            layer.cornerRadius = CGFloat(newValue ? 1.0 : 0.0) * min(bounds.width, bounds.height) / 2
        }
    }
}
