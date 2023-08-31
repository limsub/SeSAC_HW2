//
//  ThirdViewController.swift
//  0831pr
//
//  Created by 임승섭 on 2023/08/31.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var delegate: SendDataProtocol?
    
    let button = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Next Page", for: .normal)
        return button
    }()
    
    let textfield  = {
        let label = UITextField()
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 1
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "third viewcontroller"
        
        view.backgroundColor = .white
        
        view.addSubview(button)
        view.addSubview(textfield)
        
        button.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(80)
            make.horizontalEdges.equalTo(view).inset(30)
            make.height.equalTo(100)
        }
        textfield.snp.makeConstraints { make in
            make.top.equalTo(button.snp.bottom).offset(80)
            make.horizontalEdges.equalTo(view).inset(30)
            make.height.equalTo(100)
        }
        
//        button.addTarget(self, action: #selector(nextPageButtonClicked), for: .touchUpInside)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        delegate?.receiveText(textfield.text!)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        print("third viewcontroller init")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("third viewcontroller deinit")
    }
    
    
//    @objc
//    func nextPageButtonClicked() {
//        let vc = ThirdViewController()
//        navigationController?.pushViewController(vc, animated: true)
//    }
}

