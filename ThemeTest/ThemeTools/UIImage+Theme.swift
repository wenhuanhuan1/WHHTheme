//
//  UIImage+Theme.swift
//  ThemeTest
//
//  Created by whh on 2022/1/11.
// 颜色生成图片

import UIKit

public extension UIImage {
    
    /// Create UIImage from color and size.
    ///
    /// - Parameters:
    ///   - color: image fill color.
    ///   - size: image size.
     convenience init(color: UIColor, size: CGSize) {
        UIGraphicsBeginImageContextWithOptions(size, false, 1)
        
        defer {
            UIGraphicsEndImageContext()
        }
        
        color.setFill()
        UIRectFill(CGRect(origin: .zero, size: size))
        
        guard let aCgImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else {
            self.init()
            return
        }
        
        self.init(cgImage: aCgImage)
    }
    
}
