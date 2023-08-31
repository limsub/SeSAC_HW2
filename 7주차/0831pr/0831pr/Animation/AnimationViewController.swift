//
//  AnimationViewController.swift
//  0831pr
//
//  Created by 임승섭 on 2023/08/31.
//

import UIKit
import SnapKit

class AnimationViewController: UIViewController {
    
    let sample = {
        let view = UIView()
        
        view.backgroundColor = .blue
        
        return view
    }()
    
    let sample2 = {
        let view = UIView()
        
        view.backgroundColor = .red
        
        return view
    }()
    
    let sample3 = {
        let view = UIView()
        
        view.backgroundColor = .green
        
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(sample)
        view.addSubview(sample2)
        view.addSubview(sample3)
        
        sample.snp.makeConstraints { make in
            make.size.equalTo(150)
            make.centerX.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
        }
        sample2.snp.makeConstraints { make in
            make.size.equalTo(150)
            make.centerX.equalTo(view)
            make.top.equalTo(sample.snp.bottom).offset(40)
        }
        sample3.snp.makeConstraints { make in
            make.size.equalTo(150)
            make.centerX.equalTo(view)
            make.top.equalTo(sample2.snp.bottom).offset(40)
        }
        
        setAnimation()
    }
    
    
    func setAnimation() {
        sample.alpha = 0
        sample2.alpha = 0
        sample3.alpha = 0
        
        
        UIView.animate(withDuration: 6) {
            self.sample.alpha = 1
        }
        
        UIView.animate(withDuration: 1, delay: 5, options: [.curveLinear]) {
            self.sample2.alpha = 1
        } completion: { bool in
            UIView.animate(withDuration: 1) {
                self.sample3.alpha = 1
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.async {
            self.sample3.alpha = 1.0
            
            UIView.animate(withDuration: 0.3) {
                self.sample3.alpha = 0.2
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.async {
            self.sample3.alpha = 0.2
            
            UIView.animate(withDuration: 0.3) {
                self.sample3.alpha = 1.0
            }
        }
    }
}
