//
//  MainViewController.swift
//  0828hw
//
//  Created by 임승섭 on 2023/08/28.
//

import UIKit
import Kingfisher

class MainViewController: BaseViewController {
    
    let mainView = MainView()
    
    var trendingMovies: [Result] = []
    var movieGenres: GenreList?
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.movieTableView.rowHeight = 400
        callTrendingMovies {
            print("done")
        }
    }
    
    override func setConfigure() {
        super.setConfigure()
        
        mainView.movieTableView.delegate = self
        mainView.movieTableView.dataSource = self
    }
    
    override func setConstraints() {
        super.setConstraints()
    }
    
    
    
    func callTrendingMovies(_ completionHandler: @escaping () -> Void) {
        APIManager.shared.callMovies { item in
            self.trendingMovies = item.results;
            
            self.mainView.movieTableView.reloadData()
        }
    }
    
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trendingMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell")
                as? MainTableViewCell else { return UITableViewCell() }
        
        let item = trendingMovies[indexPath.row]
        
        cell.titleLabel.text = item.title
        cell.dateLabel.text = item.releaseDate
        //cell.subtitleLabel.text = item.originalTitle
        cell.voteLabel.text = String(item.voteAverage!)
        
        let url = URL(string: Endpoint.imagePrefix.requestURL + item.backdropPath!)
        cell.posterImageView.kf.setImage(with: url)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = trendingMovies[indexPath.row]
        
        let vc = DetailViewController();
        vc.movieId = item.id
        vc.backImageURL = item.backdropPath
        vc.posterImageURL = item.posterPath
        vc.titleName = item.title
        vc.overView = item.overview
        present(vc, animated: true)
    }
    
}
