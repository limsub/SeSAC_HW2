//
//  CalculateViewController.swift
//  0913hw
//
//  Created by 임승섭 on 2023/09/13.
//

import UIKit
import SnapKit

class CalculateViewController: UIViewController {
    

    let firstTextField = {
        let view = UITextField()
        view.backgroundColor = .lightGray
        return view
    }()
    let secondTextField = {
        let view = UITextField()
        view.backgroundColor = .lightGray
        return view
    }()
    let resultLabel = {
        let view = UILabel()
        view.backgroundColor = .brown
        return view
    }()
    func setting() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(firstTextField)
        view.addSubview(secondTextField)
        view.addSubview(resultLabel)
        
        firstTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.leading.equalTo(view).inset(30)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        secondTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.trailing.equalTo(view).inset(30)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(firstTextField.snp.bottom).offset(40)
            make.horizontalEdges.equalTo(view).inset(30)
            make.height.equalTo(40)
        }
        
        firstTextField.addTarget(self, action: #selector(firstTextFieldChanged), for: .editingChanged)
        secondTextField.addTarget(self, action: #selector(secondTextFieldChanged), for: .editingChanged)
    }
    
    
    let viewModel = CalculateViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setting()
        
        viewModel.firstNum.bind { txt in
            self.firstTextField.text = txt
        }
        viewModel.secondNum.bind { txt in
            self.secondTextField.text = txt
        }
        viewModel.result.bind { txt in
            self.resultLabel.text = txt
        }
    }
    
    
    
    
    @objc
    func firstTextFieldChanged() {
        viewModel.firstNum.value = firstTextField.text
        viewModel.calculate()
    }
    
    @objc
    func secondTextFieldChanged() {
        viewModel.secondNum.value = secondTextField.text
        viewModel.calculate()
    }
    
    
    
    
}
