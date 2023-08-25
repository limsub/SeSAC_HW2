//
//  CircleImageViewController.swift
//  0825hw
//
//  Created by 임승섭 on 2023/08/25.
//

import UIKit
import SnapKit

class CircleImageViewController: UIViewController {
    
    let movieImage = CustomImageView(frame: .zero)
//    let emptyImage = CustomImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        movieImage.image = UIImage(named: "부산행")

        
        view.addSubview(movieImage)
//        view.addSubview(emptyImage)
        
        movieImage.snp.makeConstraints { make in
            make.top.equalTo(view).offset(80)
            make.centerX.equalTo(view)
            
            make.size.equalTo(200)
            
            print("현재 함수 makeConstraints, frame.width : ", movieImage.frame.width)
        }
        
        
    }
    
    
    



}
