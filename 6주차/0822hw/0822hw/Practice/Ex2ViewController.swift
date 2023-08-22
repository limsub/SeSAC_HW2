//
//  Ex2ViewController.swift
//  0822hw
//
//  Created by 임승섭 on 2023/08/22.
//

import UIKit
import SnapKit

// view와 같은 사이즈의 imageView
// 상단에 4개 버튼 함수로 구현
// 하단에 3개 버튼 함수로 구현
// 프로필 이미지 imageView - cornerRadius
// 프로필 이름 레이블

enum ButtomButtonType: Int {
    case chat
    case modify
    case story
    
    var buttonName: String {
        switch self {
        case .chat: return "나와의 채팅"
        case .modify: return "프로필 편집"
        case .story: return "카카오스토리"
        }
    }
    
    var buttonImage: UIImage {
        switch self {
            
        
        case .chat: return UIImage(systemName: "bubble.left.fill")!
        case .modify: return UIImage(systemName: "pencil")!
        case .story: return UIImage(systemName: "lightbulb.led.fill")!
        }
    }
    
}

class Ex2ViewController: UIViewController {
    
    /* ============== 객체 생성 ============== */
    // 클로저 사용
    let backImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "backImage")
        
        return view
    }()
    
    
    // static func 사용
    let closeButton = makeTopButton("xmark")
    let topButton1 = makeTopButton("gift")
    let topButton2 = makeTopButton("square.and.pencil")
    let topButton3 = makeTopButton("gear.circle")
    
    static func makeTopButton(_ imageName: String) -> UIButton {
        
        let view = UIButton()
        
        view.setImage(UIImage(systemName: imageName), for: .normal)
        view.tintColor = .white
        
        return view
    }
    
    // 클로저 사용
    let profileImage = {
        let view = UIImageView()
        
        view.image = UIImage(named: "basicProfile")
        
        view.layer.cornerRadius = 35
        
        view.clipsToBounds = true
        
        return view
    }()
    
    // 클로저 사용
    let profileLabel = {
        let view = UILabel()
            
        view.text = "임승섭"
        view.textColor = .white
        view.font = .boldSystemFont(ofSize: 15)
        
        return view
    }()
    
    // 클로저 사용
    let seperateLine = {
        let view = UIView()
        
        view.backgroundColor = .white
        view.layer.opacity = 0.5
        
        return view
    }()
    
    // lazy var 사용
    lazy var chatButton = makeButtomButton(.chat)
    lazy var modifyButton = makeButtomButton(.modify)
    lazy var storyButton = makeButtomButton(.story)
    
    func makeButtomButton(_ type: ButtomButtonType) -> UIButton {
        
        let view = UIButton()
        
        view.setTitle(type.buttonName, for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 13)
        view.setImage(type.buttonImage, for: .normal)
        
        view.tintColor = .white
        
        view.alignTextBelow(spacing: 10)
        
        return view
    }
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        /* ============== 루트 뷰에 추가 ============== */
        [backImageView, closeButton, topButton1, topButton2, topButton3, profileImage, profileLabel, seperateLine, chatButton, modifyButton, storyButton].forEach { item in
            view.addSubview(item)
        }

        setLayout()
    }
    
    /* ============== 레이아웃 설정 ============== */
    func setLayout() {
        
        // 1. 배경 이미지
        backImageView.snp.makeConstraints { make in
            make.size.equalTo(view)
        }
        
        // 2. 상단 버튼
            // 맨 왼쪽 버튼 leading
            // 맨 오른쪽 버튼 trailing
            // 나머지 오른쪽 기준으로 trailing
        closeButton.snp.makeConstraints { make in
            make.size.equalTo(20)
            make.leading.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        topButton3.snp.makeConstraints { make in
            make.size.equalTo(20)
            make.top.equalTo(closeButton.snp.top)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        topButton2.snp.makeConstraints { make in
            make.size.equalTo(20)
            make.top.equalTo(closeButton.snp.top)
            
            make.trailing.equalTo(topButton3.snp.leading).offset(-20)
        }
        topButton1.snp.makeConstraints { make in
            make.size.equalTo(20)
            make.top.equalTo(closeButton.snp.top)
            
            make.trailing.equalTo(topButton2.snp.leading).offset(-20)
        }
        
        
        // 3. 하단 버튼
            // 가운데 버튼 centerX
            // 나머지 가운데 버튼 기준으로 leading, trailing
        modifyButton.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.safeAreaInsets).offset(-50)
            make.size.equalTo(70)
        }
        chatButton.snp.makeConstraints { make in
            make.trailing.equalTo(modifyButton.snp.leading).offset(-30)
            make.bottom.equalTo(modifyButton.snp.bottom)
            make.size.equalTo(70)
        }
        storyButton.snp.makeConstraints { make in
            make.leading.equalTo(modifyButton.snp.trailing).offset(30)
            make.bottom.equalTo(modifyButton.snp.bottom)
            make.size.equalTo(70)
        }
        
        
        // 4. 구분선
        seperateLine.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.width.equalTo(view)
            
            make.bottom.equalTo(modifyButton.snp.top).offset(-40)
        }
        
        
        // 5. 프로필 이름
        profileLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.bottom.equalTo(seperateLine.snp.top).offset(-50)
        }
        
        
        // 6. 프로필 사진
        profileImage.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.bottom.equalTo(profileLabel.snp.top).offset(-10)
            
            make.size.equalTo(100)
        }
        
        
        
        
        
    }
    


}
