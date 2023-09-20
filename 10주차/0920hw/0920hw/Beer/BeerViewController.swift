//
//  BeerViewController.swift
//  0920hw
//
//  Created by 임승섭 on 2023/09/20.
//

import UIKit
import Alamofire

class BeerViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        request { beer in
            print(beer)
        }
        
    }
    
    
    
    func request(completionHandler: @escaping ([BeerElement]) -> Void) {
        
        let url = URL(string: "https://api.punkapi.com/v2/beers")!
        
        AF.request(url, method: .get)
            .responseDecodable(of: [BeerElement].self) { response in
                switch response.result {
                case .success(let data):
                    completionHandler(data)
                case .failure(let error):
                    print(error)
                    
                }
            }
    }
}
