//
//  LottoViewController.swift
//  0913hw
//
//  Created by 임승섭 on 2023/09/13.
//

import UIKit
import SnapKit

class LottoViewController: UIViewController {
    
    let roundTextField = {
        let view = UITextField()
        view.backgroundColor = .lightGray
        view.tintColor = .clear
        return view
    }()
    let resultLabel = {
        let view = UILabel()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    let pickerView = UIPickerView()
    func setting() {
        pickerView.delegate = self
        pickerView.dataSource = self
        
        roundTextField.inputView = pickerView
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(roundTextField)
        view.addSubview(resultLabel)
        
        roundTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(60)
            make.horizontalEdges.equalTo(view).inset(30)
            make.height.equalTo(50)
        }
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(roundTextField.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(view).inset(30)
            make.height.equalTo(50)
        }
    }
    
    
    let viewModel = LottoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setting()
        
        
        viewModel.results.bind { txt in
            self.resultLabel.text = txt
        }
        
    }
}


extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.numberOfRowsInComponents()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.titleForRow(row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        roundTextField.text = "\(viewModel.titleForRow(row))" + "당첨번호"
        viewModel.callRequest(viewModel.rounds[row])
    }
}
