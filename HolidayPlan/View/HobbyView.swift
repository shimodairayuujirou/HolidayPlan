//
//  HobbeyView.swift
//  HolidayPlan
//
//  Created by 下平裕次郎 on R 6/12/12.
//

import UIKit

class HobbyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.mainColor
        // カスタム戻るボタン
        let backButton = UIBarButtonItem()
        backButton.image = UIImage(named: "back");
        backButton.tintColor = .brown
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}
