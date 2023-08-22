//
//  Ex1ViewController.swift
//  0822hw
//
//  Created by 임승섭 on 2023/08/22.
//

import UIKit
import SnapKit

class Ex1ViewController: UIViewController {
    
    /* ============== 객체 생성 ============== */
    // (1) 클로저 이용
    let topView = {
        let view = UIView()
        
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    // (2) static 메서드 이용
    let titleTextField = makeTextField("제목을 입력해주셍요")
    let dateTextField = makeTextField("날짜를 입력해주세요")
    
    static func makeTextField(_ placeholder: String) -> UITextField {
        let view = UITextField()
        
        view.placeholder = placeholder
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.textAlignment = .center
        view.font = .boldSystemFont(ofSize: 15)
        
        return view
    }
    
    // (3) lazy var 이용
    lazy var bottomView = makeButtomView()
    
    func makeButtomView() -> UIView {
        let view = UIView()
        
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        
        return view
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        
        /* ============== 루트 뷰에 추가 ============== */
        [topView, titleTextField, dateTextField, bottomView].forEach { item in
            view.addSubview(item)
        }

        setUpLayout()
    }
    
    
    /* ============== 레이아웃 설정 ============== */
    func setUpLayout() {
        
        topView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view).inset(20)
            make.top.equalTo(view)
            make.height.equalTo(200)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(20)
            make.leading.trailing.equalTo(view).inset(20)
            make.height.equalTo(50)
        }
        
        dateTextField.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(20)
            
            make.leading.equalToSuperview().offset(20)
            
            // 주의 : 얘네 둘이 좀 다르다. Margin 붙은 애들은 좀 떨어져있음
//            make.trailingMargin.equalTo(-20)
            make.trailing.equalTo(view).inset(20)
            
            
            make.height.equalTo(50)
        }
        
        bottomView.snp.makeConstraints { make in
            make.top.equalTo(dateTextField.snp.bottom).offset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view).inset(20)
        }
    }
    

}
