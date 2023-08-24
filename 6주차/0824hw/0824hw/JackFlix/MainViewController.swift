//
//  MainViewController.swift
//  0824hw
//
//  Created by 임승섭 on 2023/08/24.
//


// 넷플릭스 메인화면

// 1 : 뒤에 배경 이미지 사진
// 2 : 그림자 사진
// 3 : 나머지
    // 상단 버튼 4개
    // 중간 버튼 3개
    // 미리보기 레이블
    // 미리보기 이미지 3개

import UIKit

class MainViewController: UIViewController {
    
    // 배경 이미지 + 그림자
    let backImage = makeBack("어벤져스엔드게임")
    let shadowImage = makeBack("background")
    
    static func makeBack(_ sender: String) -> UIImageView {
        let view = UIImageView()
        view.image = UIImage(named: sender)
        view.contentMode = .scaleAspectFill
        
        return view;
    }
    
    
    // 상단 버튼 4개
    let top1Button = makeTopButton("N")
    let top2Button = makeTopButton("TV 프로그램")
    let top3Button = makeTopButton("영화")
    let top4Button = makeTopButton("내가 찜한 콘텐츠")
    
    static func makeTopButton(_ sender: String) -> UIButton {
        let button = UIButton()
        
        button.setTitle(sender, for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        button.titleLabel?.font = .systemFont(ofSize: 15)
        
        return button
    }
    
    
    // 중간 가운데 버튼
    let middle2Button = {
       let button = UIButton()
        
        button.setImage(UIImage(named: "play_normal"), for: .normal)
        
        return button
    }()
    
    
    // 중간 양옆 버튼
    let middle1Button = makeMiddleButton(label: "내가 찜한 컨텐츠", imageName: "check")
    let middle3Button = makeMiddleButton(label: "정보", imageName: "info")
    
    static func makeMiddleButton(label: String, imageName: String) -> UIButton {
        let button = UIButton()
        
        button.setTitle(label, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13)
        button.setImage(UIImage(named: imageName), for: .normal)
        
        button.alignTextBelow(spacing: 8)
        
        return button
    }
    
    
    // 미리보기 레이블
    let earlyShowLabel = {
        let label = UILabel()
        
        label.text = "미리보기"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    
    // 미리보기 이미지 3개
    let bottom1Image = makeBottomImage("1")
    let bottom2Image = makeBottomImage("2")
    let bottom3Image = makeBottomImage("3")
    
    static func makeBottomImage(_ imageName: String) -> UIImageView {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 60
        imageView.layer.borderColor = UIColor.systemGray5.cgColor
        imageView.layer.borderWidth = 3
        
        return imageView
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        top1Button.titleLabel?.font = .boldSystemFont(ofSize: 50)
        
        [backImage, shadowImage, top1Button, top2Button, top3Button, top4Button, middle1Button, middle2Button, middle3Button, earlyShowLabel,
         bottom1Image, bottom2Image, bottom3Image].forEach { item in
            view.addSubview(item)
        }
        
        setLayout()
    }
    
    
    func setLayout() {
        
        // 배경 두개
        backImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalTo(view)
            make.height.equalTo(view).multipliedBy(0.8)
        }
        shadowImage.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
        // 상단 버튼 4개
        top1Button.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(5)
            make.leading.equalTo(view).offset(10)
        }
        top4Button.snp.makeConstraints { make in
            make.centerY.equalTo(top1Button.snp.centerY)
            make.trailing.equalTo(view).offset(-30)
        }
        top3Button.snp.makeConstraints { make in
            make.centerY.equalTo(top1Button.snp.centerY)
            make.trailing.equalTo(top4Button.snp.leading).offset(-30)
        }
        top2Button.snp.makeConstraints { make in
            make.centerY.equalTo(top1Button.snp.centerY)
            make.trailing.equalTo(top3Button.snp.leading).offset(-30)
        }
        
        // 하단 이미지 3개
        bottom2Image.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.bottom.equalTo(view).offset(-30)
            make.size.equalTo(120)
        }
        bottom1Image.snp.makeConstraints { make in
            make.centerY.equalTo(bottom2Image.snp.centerY)
            make.trailing.equalTo(bottom2Image.snp.leading).offset(-15)
            make.size.equalTo(120)
        }
        bottom3Image.snp.makeConstraints { make in
            make.centerY.equalTo(bottom2Image.snp.centerY)
            make.leading.equalTo(bottom2Image.snp.trailing).offset(15)
            make.size.equalTo(120)
        }
        
        
        // 미리보기 레이블
        earlyShowLabel.snp.makeConstraints { make in
            make.bottom.equalTo(bottom1Image.snp.top).offset(-15)
            make.leading.equalTo(view).offset(10)
        }
        
        
        // 가운데 버튼 3개
        middle2Button.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.bottom.equalTo(earlyShowLabel.snp.top).offset(-40)
        }
        middle1Button.snp.makeConstraints { make in
            make.centerY.equalTo(middle2Button.snp.centerY)
            make.width.equalTo(120)
            make.trailing.equalTo(middle2Button.snp.leading).offset(-20)
        }
        middle3Button.snp.makeConstraints { make in
            make.centerY.equalTo(middle2Button.snp.centerY)
            make.width.equalTo(120)
            make.leading.equalTo(middle2Button.snp.trailing).offset(20)
        }
        
    }
    


}
