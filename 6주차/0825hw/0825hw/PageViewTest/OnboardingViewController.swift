//
//  OnboardingViewController.swift
//  0825hw
//
//  Created by 임승섭 on 2023/08/25.
//

import UIKit

class OnboardingViewController: UIPageViewController {
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var list: [UIViewController] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray2
        
        list = [ViewController1(), ViewController2(), ViewController3(), ViewController4(), ViewController5(), ViewController6()]
        
        connectProtocol()
        
        guard let first = list.first else { return }
        setViewControllers([first], direction: .forward, animated: true)
        
    }
    

}

extension OnboardingViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func connectProtocol() {
        delegate = self
        dataSource = self
    }
    
    // 비포
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = list.firstIndex(of: viewController) else { return nil }
        
        return currentIndex <= 0 ? nil : list[currentIndex - 1]
    }
    
    // 애프터
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = list.firstIndex(of: viewController) else { return nil }
        
        return currentIndex >= list.count - 1 ? nil : list[currentIndex + 1]
    }
    
    
    // 아래 똥글뱅이
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return list.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let first = viewControllers?.first, let index = list.firstIndex(of: first) else { return 0}
        
        return index
    }
}
