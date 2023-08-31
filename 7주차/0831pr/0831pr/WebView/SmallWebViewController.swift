//
//  SmallWebViewController.swift
//  0831pr
//
//  Created by 임승섭 on 2023/08/31.
//

import UIKit
import WebKit
import SnapKit

class SmallWebViewController: UIViewController {
    
    var webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webView)
        
        webView.snp.makeConstraints { make in
            make.edges.equalTo(view).inset(100)
        }
        
        let myURL = URL(string: "https://www.apple.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}
