//
//  DetailViewController.swift
//  0828hw
//
//  Created by 임승섭 on 2023/08/28.
//

import UIKit
import Kingfisher


class DetailViewController: BaseViewController {
    
    let mainView = DetailView()
    
    var movieDetails: MovieDetail?
    
    // 값전달로 받아야 하는 요소
    var movieId: Int?
    var backImageURL: String?
    var posterImageURL: String?
    var titleName: String?
    var overView: String?
    
    
    override func loadView() {
        self.view = mainView
        
        if let movieId {
            callDetails(movieId)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func setConfigure() {
        super.setConfigure()
    }
    
    override func setConstraints() {
        super.setConstraints()
    }
    
    
    func callDetails(_ movieId: Int) {
        APIManager.shared.callDetails(movieId) { item in
            self.movieDetails = item;
            
            self.designCell()
        }
    }
    
    
    func designCell() {
        let backUrl = URL(string: Endpoint.imagePrefix.requestURL + backImageURL!)
        let posterUrl = URL(string: Endpoint.imagePrefix.requestURL + posterImageURL!)
        
        mainView.titleLabel.text = titleName
        mainView.backImageView.kf.setImage(with: backUrl)
        mainView.posterImageView.kf.setImage(with: posterUrl)
        
        mainView.overViewTextView.text = overView
        
        var castText = ""
        for items in movieDetails!.cast {
            castText += items.name
            castText += "\n"
        }
        mainView.castTextView.text = castText
        
        var crewText = ""
        for items in movieDetails!.crew {
            crewText += items.name
            crewText += "\n"
        }
        mainView.crewTextView.text = crewText
    }
    
}
