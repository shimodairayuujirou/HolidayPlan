//
//  ViewController.swift
//  HolidayPlan
//
//  Created by 下平裕次郎 on R 6/10/17.
//

import UIKit

class FirstViewController: UIViewController {

    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 20
        return stack
    }()
    
    private let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Holiday\nPlan"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 64)
        label.textColor = .white
        label.shadowColor = UIColor(red: 1, green: 0.84, blue: 0.36, alpha: 0.8)
        label.shadowOffset = CGSize(width: 5, height: 5)
        return label
    }()
    
    private let loginButton: UIButton = {
        let login = UIButton()
        login.setTitle("ログイン", for: .normal)
        login.setTitleColor(.white, for: .normal)
        login.backgroundColor = .brown
        login.layer.cornerRadius = 10.0
        login.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        login.heightAnchor.constraint(equalToConstant: 60).isActive = true
        login.widthAnchor.constraint(equalToConstant: 200).isActive = true
        login.addAction(UIAction(handler: { _ in
            print("ログインしたよ")
        }), for: .touchUpInside)
        return login
    }()
    
    private let RegistrationButton: UIButton = {
        let Registration = UIButton()
        Registration.setTitle("新規登録", for: .normal)
        Registration.setTitleColor(.white, for: .normal)
        Registration.backgroundColor = UIColor.secondColor
        Registration.layer.cornerRadius = 10.0
        Registration.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        Registration.heightAnchor.constraint(equalToConstant: 60).isActive = true
        Registration.widthAnchor.constraint(equalToConstant: 200).isActive = true
        Registration.addAction(UIAction(handler: { _ in
            print("新規登録したよ")
        }), for: .touchUpInside)
        return Registration
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.mainColor
        setupLayout()
    }
    
    private func setupLayout() {
        // StackViewにサブビューを追加
        stack.addArrangedSubview(appNameLabel)
        stack.addArrangedSubview(loginButton)
        stack.addArrangedSubview(RegistrationButton)
        
        // StackViewをメインビューに追加し、セーフエリアに制約を設定
        self.view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.applyArroundConstraint(equalTo: view.safeAreaLayoutGuide)
    }
}


