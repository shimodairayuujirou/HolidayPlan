//
//  Untitled.swift
//  HolidayPlan
//
//  Created by 下平裕次郎 on R 6/11/07.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let Label: UILabel = {
        let label = UILabel()
        label.text = "ホーム"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.mainColor
        setupLayout()
    }
    
    private func setupLayout() {
    }
}
