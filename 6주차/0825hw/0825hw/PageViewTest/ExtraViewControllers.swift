//
//  ExtraViewControllers.swift
//  0825hw
//
//  Created by 임승섭 on 2023/08/25.
//

import UIKit
import SnapKit

/* ======================== 1 ======================== */
class ViewController1: UIViewController {
    
    let label = {
        let l = UILabel()
        l.text = "1번"
        l.textColor = .black
        l.backgroundColor = .white
        
        return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
        
        print("1 viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("1 viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("1 viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("1 viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("1 viewDidDisappear")
    }
}

class ViewController2: UIViewController {
    
    let label = {
        let l = UILabel()
        l.text = "2번"
        l.textColor = .black
        l.backgroundColor = .white
        
        return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
        
        print("2 viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("2 viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("2 viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("2 viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("2 viewDidDisappear")
    }
}


class ViewController3: UIViewController {
    
    let label = {
        let l = UILabel()
        l.text = "3번"
        l.textColor = .black
        l.backgroundColor = .white
        
        return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
        
        print("3 viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("3 viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("3 viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("3 viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("3 viewDidDisappear")
    }
}

class ViewController4: UIViewController {
    
    let label = {
        let l = UILabel()
        l.text = "4번"
        l.textColor = .black
        l.backgroundColor = .white
        
        return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
        
        print("4 viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("4 viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("4 viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("4 viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("4 viewDidDisappear")
    }
}


class ViewController5: UIViewController {
    
    let label = {
        let l = UILabel()
        l.text = "5번"
        l.textColor = .black
        l.backgroundColor = .white
        
        return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
        
        print("5 viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("5 viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("5 viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("5 viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("5 viewDidDisappear")
    }
}


class ViewController6: UIViewController {
    
    let label = {
        let l = UILabel()
        l.text = "6번"
        l.textColor = .black
        l.backgroundColor = .white
        
        return l
    }()
    
    let button = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.addTarget(self, action: #selector(loginSuccess), for: .touchUpInside)
//        ViewController6.self 이걸 쓰면 안되지...
        
        view.backgroundColor = .yellow
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
        
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.centerX.equalTo(view)
        }
        
        print("6 viewDidLoad")
    }
    
    @objc
    func loginSuccess() {
        
        UserDefaults.standard.set(true, forKey: "isLogin")
        
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        
        let vc = MainViewController()
        
        sceneDelegate?.window?.rootViewController = vc
        sceneDelegate?.window?.makeKeyAndVisible()
        
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("6 viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("6 viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("6 viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("6 viewDidDisappear")
    }
}



