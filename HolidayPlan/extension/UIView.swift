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
            self.safeAreaLayoutGuide.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: constants.top),
            self.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: constants.leading),
            layoutGuide.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: constants.bottom),
            layoutGuide.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: constants.trailing)
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
