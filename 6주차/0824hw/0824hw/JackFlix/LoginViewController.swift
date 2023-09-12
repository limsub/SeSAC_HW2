//
//  LoginViewController.swift
//  0824hw
//
//  Created by 임승섭 on 2023/08/24.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    let mainLabel = {
        let label = UILabel()
        label.text = "JACKFLIX"
        label.font = .boldSystemFont(ofSize: 40)
        label.textColor = .red
        
        return label
    }()
    let signUpButton = {
       let button = UIButton()
        
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.setTitle("회원가입", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.setTitleColor( UIColor.black, for: .normal)
        
        return button
    }()
    let emailTextField = LoginTextField(placeholer: "이메일을 입력하세요")
    let pwTextField = LoginTextField(placeholer: "비밀번호를 입력하세요")
    let nicknameTextField = LoginTextField(placeholer: "닉네임을 입력하세요")
    let locationTextField = LoginTextField(placeholer: "위치를 입력하세요")
    let recommentTextField = LoginTextField(placeholer: "추천 코드를 입력하세요")
    
    let viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        view.backgroundColor = .black

        [mainLabel, signUpButton, emailTextField, pwTextField, nicknameTextField, locationTextField, recommentTextField].forEach { item in
            view.addSubview(item)
        }
        
        setLayout()
        
        
        // 9/12
        viewModel.isValid.bind { bool in
            self.signUpButton.isEnabled = bool
            self.changeButtonColor(bool)
        }
        emailTextField.addTarget(self, action: #selector(emailChanged), for: .editingChanged)
        pwTextField.addTarget(self, action: #selector(pwChanged), for: .editingChanged)
        nicknameTextField.addTarget(self, action: #selector(nicknameChanged), for: .editingChanged)
        locationTextField.addTarget(self, action: #selector(locationChanged), for: .editingChanged)
        recommentTextField.addTarget(self, action: #selector(recommentChanged), for: .editingChanged)
        
        signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
    }
    
    func setLayout() {
        mainLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view).offset(100)
        }
        
        
        
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(mainLabel.snp.bottom).offset(150)
            
            make.horizontalEdges.equalTo(view).inset(20)
            make.height.equalTo(40)
        }
        
        pwTextField.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            
            make.horizontalEdges.equalTo(view).inset(20)
            make.height.equalTo(40)
        }
        
        nicknameTextField.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(pwTextField.snp.bottom).offset(20)
            
            make.horizontalEdges.equalTo(view).inset(20)
            make.height.equalTo(40)
        
        }
        
        locationTextField.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(nicknameTextField.snp.bottom).offset(20)
            
            make.horizontalEdges.equalTo(view).inset(20)
            make.height.equalTo(40)
        }
        
        recommentTextField.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(locationTextField.snp.bottom).offset(20)
            
            make.horizontalEdges.equalTo(view).inset(20)
            make.height.equalTo(40)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(recommentTextField.snp.bottom).offset(20)
            
            make.horizontalEdges.equalTo(view).inset(20)
            make.height.equalTo(40)
        }
        
        
        
        
        
    }

    // 9/12
    func changeButtonColor(_ sender: Bool) {
        if (sender) {
            signUpButton.backgroundColor = .green
            signUpButton.setTitleColor(.blue, for: .normal)
        } else {
            signUpButton.backgroundColor = .lightGray
            signUpButton.setTitleColor(.white, for: .normal)
        }
    }
    
    @objc func emailChanged() {
        viewModel.email = emailTextField.text!
        viewModel.checkValidation()
    }
    @objc func pwChanged() {
        viewModel.password = pwTextField.text!
        viewModel.checkValidation()
    }
    @objc func nicknameChanged() {
        viewModel.nickname = nicknameTextField.text!
        viewModel.checkValidation()
    }
    @objc func locationChanged() {
        viewModel.location = locationTextField.text!
        viewModel.checkValidation()
    }
    @objc func recommentChanged() {
        viewModel.code = recommentTextField.text!
        viewModel.checkValidation()
    }
    
    @objc func signUpButtonClicked() {
        viewModel.signIn {
            let alert = UIAlertController(title: "로그인 성공", message: "성공", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default)
            alert.addAction(ok)
            self.present(alert, animated: true)
        }
    }
    
}
