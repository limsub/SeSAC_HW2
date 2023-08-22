//
//  ViewController.swift
//  0822hw
//
//  Created by 임승섭 on 2023/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func firstButtonTapped(_ sender: UIButton) {
        
//        let vc = Ex1ViewController()
        
        let vc = ButtonTestViewController()
        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true)
    }
    
    
    
    @IBAction func secondButtonTapped(_ sender: UIButton) {
        
        let vc = Ex2ViewController()
        
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
    @IBAction func thirdButtonTapped(_ sender: UIButton) {
        
        let vc = Ex3ViewController()
        
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    

}

