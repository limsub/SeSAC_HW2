//
//  WebViewController.swift
//  0831pr
//
//  Created by 임승섭 on 2023/08/31.
//

import UIKit
import SnapKit
import WebKit


class WebViewController: UIViewController, WKUIDelegate {

    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        self.view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: "https://www.apple.com")
        let myRequest = URLRequest(url: myURL!)
        
        webView.load(myRequest)
        
        
        
        // 네비게이션 컨트롤러 설정 - 있긴 있는데, 초기에는 투명하고 스크롤하면 배경이 생긴다
        title = "이건 웹뷰입니다"
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .red
        navigationController?.navigationBar.standardAppearance = appearance     // 스크롤했을 때
        navigationController?.navigationBar.scrollEdgeAppearance = appearance   // 스크롤 지점이 맨 꼭대기에 있을 때. 맨 처음 화면
        navigationController?.navigationBar.isTranslucent = true                // 뷰의 꼭대기 시작 지점 조절 - 네비게이션 바 뒤에도 화면을 채울지
    }
    
    // 새로고침
    func reloadButtonClicked() {
        webView.reload()
    }
    
    // 이전 화면
    func goBackButtonClicked() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    // 다음 화면
    func goForwardButtonClicked() {
        if webView.canGoForward {
            webView.goForward()
        }
    }
}
