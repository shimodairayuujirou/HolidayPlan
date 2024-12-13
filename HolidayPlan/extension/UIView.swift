//
//  UIView.swift
//  HolidayPlan
//
//  Created by 下平裕次郎 on R 6/10/24.
//

import UIKit

extension UIView {
    typealias ArroundConstraintConstants = (top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat)
    
    func apply(constraints: [NSLayoutConstraint]) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
        
    func apply(constraint: NSLayoutConstraint) {
        apply(constraints: [constraint])
    }

    func applyArroundConstraint(equalTo layoutGuide: UILayoutGuide, constants: ArroundConstraintConstants = (0, 0, 0, 0)) {
        self.apply(constraints: [
            self.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: constants.top),
            self.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: constants.leading),
            layoutGuide.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: constants.bottom),
            layoutGuide.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: constants.trailing)
        ])
    }


    
    func applyArroundConstraint(equalTo view: UIView, constants: ArroundConstraintConstants = (0, 0, 0, 0)) {
        self.apply(constraints: [
            self.topAnchor.constraint(equalTo: view.topAnchor, constant: constants.top),
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constants.leading),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: constants.bottom),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: constants.trailing)
        ])
    }
}

extension UIImage {
    /// 指定したサイズにリサイズした画像を返します
    func resized(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, self.scale)
        defer { UIGraphicsEndImageContext() }
        self.draw(in: CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    func withAlpha(_ alpha: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer { UIGraphicsEndImageContext() }
        
        let context = UIGraphicsGetCurrentContext()
        let rect = CGRect(origin: .zero, size: size)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.translateBy(x: 0.0, y: -size.height)
        context?.setBlendMode(.normal)
        context?.setAlpha(alpha)
        context?.draw(cgImage!, in: rect)
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    func darkened(by amount: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer { UIGraphicsEndImageContext() }
        
        let context = UIGraphicsGetCurrentContext()
        let rect = CGRect(origin: .zero, size: size)
        context?.draw(cgImage!, in: rect)
        
        context?.setFillColor(UIColor.black.withAlphaComponent(amount).cgColor)
        context?.fill(rect)
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
