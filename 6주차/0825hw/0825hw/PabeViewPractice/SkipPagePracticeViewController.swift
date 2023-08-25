//
//  SkipPagePracticeViewController.swift
//  0825hw
//
//  Created by 임승섭 on 2023/08/25.
//

import UIKit
import SnapKit

class SkipPagePracticeViewController: UIViewController {
    
    let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    
    var currentPage = 0
    
    let viewList = {
       let list = [ViewController1(), ViewController2(), ViewController3(), ViewController4(), ViewController5(), ViewController6()]
        
        return list
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        guard let first = viewList.first else { return }
        pageViewController.setViewControllers([first], direction: .forward, animated: true)
        
        
        view.addSubview(pageViewController.view)
        pageViewController.view.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.size.equalTo(view).multipliedBy(0.8)
        }

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
