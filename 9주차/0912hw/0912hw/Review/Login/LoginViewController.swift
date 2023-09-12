//
//  LoginViewController.swift
//  0912hw
//
//  Created by 임승섭 on 2023/09/12.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    /* ========== 인스턴스 ========== */
    static func makeTextField() -> UITextField {
        let view = UITextField()
        
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        
        return view
    }
    
    let idTextField = makeTextField()
    let pwTextField = makeTextField()
    
    let loginButton =  {
        let button = UIButton()
        
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = .lightGray
        
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        
        return button
    }()
    
    func setting() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(idTextField)
        view.addSubview(pwTextField)
        view.addSubview(loginButton)
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.horizontalEdges.equalTo(view).inset(20)
            make.height.equalTo(50)
        }
        pwTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(40)
            make.horizontalEdges.equalTo(view).inset(20)
            make.height.equalTo(50)
        }
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(pwTextField.snp.bottom).offset(40)
            make.horizontalEdges.equalTo(view).inset(20)
            make.height.equalTo(50)
        }
    }
    /* ========== ==========*/
    
    
    let viewModel = LoginViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setting()
        
        
        // addTarget
        idTextField.addTarget(self, action: #selector(idTextFieldChanged), for: .editingChanged)
        pwTextField.addTarget(self, action: #selector(pwTextFieldChanged), for: .editingChanged)
        loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        
        
        viewModel.isValid.bind { bool in
            self.loginButton.isEnabled = bool
            self.loginButton.backgroundColor = (bool) ? .green : .lightGray
        }
        
        // 이런 식으로도 할 수 있겠다
        
    }
    
    @objc
    func idTextFieldChanged() {
        viewModel.id = idTextField.text!
        viewModel.checkValidation()
    }
    
    @objc
    func pwTextFieldChanged() {
        viewModel.pw = pwTextField.text!
        viewModel.checkValidation()
    }
    
    @objc
    func loginButtonClicked() {
        print("로그인 성공")
        
        viewModel.signIn {
            let alert = UIAlertController(title: "로그인 성공!!", message: "성공!!", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default)
            alert.addAction(ok)
            self.present(alert, animated: true)
        }
    }
}





// 이렇게도 할 수 있겠다
class LoginViewController2: UIViewController {
    
    /* ========== 인스턴스 ========== */
    static func makeTextField() -> UITextField {
        let view = UITextField()
        
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        
        return view
    }
    
    let idTextField = makeTextField()
    let pwTextField = makeTextField()
    
    let loginButton =  {
        let button = UIButton()
        
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = .lightGray
        
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        
        return button
    }()
    
    func setting() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(idTextField)
        view.addSubview(pwTextField)
        view.addSubview(loginButton)
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.horizontalEdges.equalTo(view).inset(20)
            make.height.equalTo(50)
        }
        pwTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(40)
            make.horizontalEdges.equalTo(view).inset(20)
            make.height.equalTo(50)
        }
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(pwTextField.snp.bottom).offset(40)
            make.horizontalEdges.equalTo(view).inset(20)
            make.height.equalTo(50)
        }
    }
    /* ========== ==========*/
    
    
    let viewModel = LoginViewModel2()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setting()
        
        
        // addTarget
        idTextField.addTarget(self, action: #selector(idTextFieldChanged), for: .editingChanged)
        pwTextField.addTarget(self, action: #selector(pwTextFieldChanged), for: .editingChanged)
        loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        
        
        viewModel.isValid.bind { bool in
            self.loginButton.isEnabled = bool
            self.loginButton.backgroundColor = (bool) ? .green : .lightGray
        }
        
        viewModel.id.bind { _ in
            self.viewModel.checkValidation()
        }
        viewModel.pw.bind { _ in
            self.viewModel.checkValidation()
        }

    }
    
    @objc
    func idTextFieldChanged() {
        viewModel.id.value = idTextField.text!
//        viewModel.checkValidation()
    }
    
    @objc
    func pwTextFieldChanged() {
        viewModel.pw.value = pwTextField.text!
//        viewModel.checkValidation()
    }
    
    @objc
    func loginButtonClicked() {
        print("로그인 성공")
        
        viewModel.signIn {
            let alert = UIAlertController(title: "로그인 성공!!", message: "성공!!", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default)
            alert.addAction(ok)
            self.present(alert, animated: true)
        }
    }
}
