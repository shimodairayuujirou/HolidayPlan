//
//  HomeView.swift
//  HolidayPlan
//
//  Created by 下平裕次郎 on R 6/11/07.


import UIKit

class HomeViewController: UIViewController {
    override var shouldAutorotate: Bool {
        return false
   }
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 40
        return stack
    }()
    
    private let Label: UILabel = {
        let label = UILabel()
        label.text = "ホーム"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .brown
        label.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return label
    }()
    
    private let hobbymemobutton: UIButton = {
        let hobbybutton = UIButton()
        
        let resizedImage = UIImage(named: "hobbyImage")!.resized(to: CGSize(width: 200, height: 200))
        
        // UIButton Configuration
        var config = UIButton.Configuration.filled()
        config.title = "遊びメモ"
        config.baseForegroundColor = .brown
        //apple側のfontによってsizeが異なる可能性があるためこの直接サイズを指定するのは古いやり方
//        hobbybutton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        // 通常時の画像設定
//        config.image = resizedImage
        config.cornerStyle = .small
        config.baseBackgroundColor = .white
        config.imagePlacement = .trailing // 画像を右側に配置
        config.titleAlignment = .leading // タイトルの配置を調整
        hobbybutton.configuration = config
        
        hobbybutton.configurationUpdateHandler = { _ in
            var config = hobbybutton.configuration
            switch hobbybutton.state {
            case .highlighted:
                config?.image = resizedImage?.withAlpha(0.5)
            default:
                config?.image = resizedImage
            }
            hobbybutton.configuration = config
        }
        
        // ボタンのスタイル設定
//        hobbybutton.backgroundColor = .red
//        hobbybutton.layer.cornerRadius = 15.0
//
        hobbybutton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hobbybutton.heightAnchor.constraint(equalToConstant: 200),
            hobbybutton.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        return hobbybutton
    }()
    
    private let taskmemobutton: UIButton = {
        let taskbutton = UIButton()
        
        let resizedImage = UIImage(named: "taskImage")!.resized(to: CGSize(width: 200, height: 200))
        
        // UIButton Configuration
        var config = UIButton.Configuration.filled()
        config.title = "タスクメモ"
        config.baseForegroundColor = .brown
        //apple側のfontによってsizeが異なる可能性があるためこの直接サイズを指定するのは古いやり方
//        hobbybutton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        // 通常時の画像設定
//        config.image = resizedImage
        config.cornerStyle = .small
        config.baseBackgroundColor = .white
        config.imagePlacement = .trailing // 画像を右側に配置
        config.titleAlignment = .leading // タイトルの配置を調整
        taskbutton.configuration = config
        
        taskbutton.configurationUpdateHandler = { _ in
            var config = taskbutton.configuration
            switch taskbutton.state {
            case .highlighted:
                config?.image = resizedImage?.withAlpha(0.5)
            default:
                config?.image = resizedImage
            }
            taskbutton.configuration = config
        }
        
        // ボタンのスタイル設定
//        hobbybutton.backgroundColor = .red
//        hobbybutton.layer.cornerRadius = 15.0
//
        taskbutton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            taskbutton.heightAnchor.constraint(equalToConstant: 200),
            taskbutton.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        return taskbutton
    }()
    
    private let spacer: UIView = {
        let spacer = UIView()
        spacer.translatesAutoresizingMaskIntoConstraints = false
        let spacerHeightConstraint = spacer.heightAnchor.constraint(equalToConstant: 20)
        spacerHeightConstraint.priority = .defaultLow
        spacerHeightConstraint.isActive = true
        return spacer
    }()
    
    private let planButton: UIButton = {
        let plan = UIButton()
        plan.setTitle("プラン提案", for: .normal)
        plan.setTitleColor(.white, for: .normal)
        plan.backgroundColor = .brown
        plan.layer.cornerRadius = 10.0
        plan.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        plan.heightAnchor.constraint(equalToConstant: 60).isActive = true
        plan.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return plan
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.mainColor
        
        // カスタム戻るボタン
        let backButton = UIBarButtonItem()
        backButton.image = UIImage(named: "back");
        backButton.tintColor = .brown
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        setupLayout()
        hobbymemobutton.addAction(UIAction(handler: { _ in
            print("遊びメモ")
            let nextVC = HobbyViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }), for: .touchUpInside)
        taskmemobutton.addAction(UIAction(handler: { _ in
            print("タスクメモ")
            let nextVC = TaskViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }), for: .touchUpInside)
        planButton.addAction(UIAction(handler: { _ in
            print("プラン提案")
            let nextVC = PlanViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }), for: .touchUpInside)
    }
    
    private func setupLayout() {
        // StackViewにサブビューを追加
        stack.addArrangedSubview(Label)
        stack.addArrangedSubview(hobbymemobutton)
        stack.addArrangedSubview(taskmemobutton)
        stack.addArrangedSubview(spacer)
        stack.addArrangedSubview(planButton)
        
        // StackViewをメインビューに追加し、セーフエリアに制約を設定
        self.view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.applyArroundConstraint(equalTo: view.safeAreaLayoutGuide)
    }
}
