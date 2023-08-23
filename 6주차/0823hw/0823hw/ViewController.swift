//
//  ViewController.swift
//  0823hw
//
//  Created by 임승섭 on 2023/08/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        
        let vc = TheaterViewController()
        
        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true)
    }
    
    

}

