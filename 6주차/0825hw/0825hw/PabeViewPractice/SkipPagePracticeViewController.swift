//
//  SkipPagePracticeViewController.swift
//  0825hw
//
//  Created by 임승섭 on 2023/08/25.
//

import UIKit
import SnapKit


// 맨 마지막 page로 바로 넘어가는 skipButton 구현
// 페이지가 넘어갈 때 같이 넘어가진 않아서 별로 예쁘진 않다

class SkipPagePracticeViewController: UIViewController {
    
    let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    
    
    let skipButton = {
        let button = UIButton()
        
        button.setTitle("skip", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.backgroundColor = .white
        button.setTitleColor(UIColor.black, for: .normal)
        
        return button
    }()
    
    let viewList = {
       let list = [ViewController1(), ViewController2(), ViewController3(), ViewController4(), ViewController5(), ViewController6()]
        
        return list
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        guard let first = viewList.first else { return }
        pageViewController.setViewControllers([first], direction: .forward, animated: true)
        
        
        view.addSubview(pageViewController.view)
        pageViewController.view.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
        view.addSubview(skipButton)
        skipButton.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.width.equalTo(200)
            make.bottom.equalTo(view).inset(80)
        }
        
        skipButton.addTarget(self, action: #selector(skipButtonClicked), for: .touchUpInside)
    }
    
    
    @objc
    func skipButtonClicked() {
        
        guard let last = viewList.last else { return }
        pageViewController.setViewControllers([last], direction: .forward, animated: true)
        
    }
    

}


extension SkipPagePracticeViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = viewList.firstIndex(of: viewController) else { return nil }
        
        return currentIndex <= 0 ? nil : viewList[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = viewList.firstIndex(of: viewController) else { return nil }
        
        return currentIndex >= viewList.count - 1 ? nil : viewList[currentIndex + 1]
    }
    
    
}
