//
//  Ex3ViewController.swift
//  0822hw
//
//  Created by 임승섭 on 2023/08/22.
//

import UIKit
import SnapKit

// 바탕 뷰와 동일한 크기의 이미지뷰
// 날짜&시간 레이블
// 4개
    // 왼쪽 : 위치 이미지 + 위치 레이블
    // 오른쪽 : 버튼 두개
    // 서로 centerY 맞춰주기
// 말풍선 -> 함수 구현
// 사진풍선 -> 함수 구현

// 체크할 부분 : 말풍선/사진풍선 할 때 안쪽에 여백주는거..?
// 1. 풍선 내부 여백
// 2. 버튼 이미지 크기 (이미지, 텍스트 vertical로 잡는거 6주차 챌린지)

class Ex3ViewController: UIViewController {
    
    
    /* ============== 객체 생성 ============== */
    // 배경 이미지 (클로저 사용)
    let backImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "basicBackImage")
        view.contentMode = .scaleAspectFill
        
        return view
    }()
    
    // 날짜&시간 레이블 (클로저 사용)
    let dateLabel = {
        let view = UILabel()
        
        let format = DateFormatter()
        format.dateFormat = "MM월 dd일 hh시 mm분"
        view.text = format.string(from: Date())
        view.textColor = .white
        view.font = .systemFont(ofSize: 14)
        
        return view
    }()
    
    // 위치 레이블 (클로저 사용)
    let locationLabel = {
        let view = UILabel()
        
        view.text = "서울, 신림동"
        view.textColor = .white
        view.font = .systemFont(ofSize: 20)
        
        return view
    }()
    
    // 버튼 3개 (static func 이용)
    let locationButton = makeButton("location.fill")
    let shareButton = makeButton("square.and.arrow.up")
    let reloadButton = makeButton("refrigerator")
    
    static func makeButton(_ imageName: String) -> UIButton {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: imageName), for: .normal)
        button.tintColor = .white
        
        
        
        return button
    }
    
    // 말풍선 (static func 이용)
    let tempLabel = makeBubbelLabel("지금은 9'C에요")
    let humLabel = makeBubbelLabel("78%만큼 습해요")
    let windLabel = makeBubbelLabel("1m/s의 바람이 불어요")
    let goodDayLabel = makeBubbelLabel("오늘도 행복한 하루 보내세요")
    
    static func makeBubbelLabel(_ sentence: String) -> UILabel {
        let label = BasePaddingLabel()
        
        label.backgroundColor = .white
        label.text = sentence
        label.textColor = .black
        
        label.layer.cornerRadius = 10
        label.clipsToBounds = true;
        
        return label
    }


    // 이미지풍선 (static func 이용)
    let weatherImageView = makeBubbleImage("cloud")
    
    static func makeBubbleImage(_ imageName: String) -> UIImageView {
        let imageView = UIImageView()
        var image = UIImage(systemName: imageName)
        
        imageView.image = image
        imageView.backgroundColor = .white
        imageView.tintColor = .black
        
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        
        return imageView
    }
    
    
//    let safeArea = view.safeAreaLayoutGuide
//    lazy var safeArea = view.safeAreaLayoutGuide

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        
        /* ============== 루트 뷰에 추가 ============== */
        [backImageView, dateLabel, locationButton, locationLabel, shareButton, reloadButton, tempLabel, humLabel, windLabel, weatherImageView, goodDayLabel].forEach { item in
            view.addSubview(item)
        }
        
        setLayout()
    }
    
    
    /* ============== 레이아웃 설정 ============== */
    func setLayout() {
        
        backImageView.snp.makeConstraints { make in
            make.size.equalTo(view)
        }
        
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        
        // 버튼 3개 + 레이블 -> centerY 맨 왼쪽 locationButton에 맞춘다. locationButton y축 위치는 top으로 설정
        locationButton.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
            make.leading.equalTo(dateLabel)
        }
        locationLabel.snp.makeConstraints { make in
            make.centerY.equalTo(locationButton.snp.centerY)
            make.leading.equalTo(locationButton.snp.trailing).offset(10)
        }
        reloadButton.snp.makeConstraints { make in
            make.centerY.equalTo(locationButton.snp.centerY)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        shareButton.snp.makeConstraints { make in
            make.centerY.equalTo(locationButton.snp.centerY)
            make.trailing.equalTo(reloadButton.snp.leading).offset(-20)
        }
        
        
        // 말풍선/이미지풍선
        tempLabel.snp.makeConstraints { make in
            make.top.equalTo(locationButton.snp.bottom).offset(20)
            make.leading.equalTo(dateLabel)
        }
        humLabel.snp.makeConstraints { make in
            make.top.equalTo(tempLabel.snp.bottom).offset(20)
            make.leading.equalTo(dateLabel)
        }
        windLabel.snp.makeConstraints { make in
            make.top.equalTo(humLabel.snp.bottom).offset(20)
            make.leading.equalTo(dateLabel)
        }
        weatherImageView.snp.makeConstraints { make in
            make.top.equalTo(windLabel.snp.bottom).offset(20)
            make.width.equalTo(240)
            make.height.equalTo(200)
            make.leading.equalTo(dateLabel)
        }
        goodDayLabel.snp.makeConstraints { make in
            make.top.equalTo(weatherImageView.snp.bottom).offset(20)
            make.leading.equalTo(dateLabel)
        }
        
        
        
    }
    

    

}
