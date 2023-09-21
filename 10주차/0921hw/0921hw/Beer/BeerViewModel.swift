//
//  BeerViewModel.swift
//  0921hw
//
//  Created by 임승섭 on 2023/09/21.
//

import Foundation

class BeerViewModel {
    
    var beers: Observable<[BeerElement]> = Observable([BeerElement(id: 1, name: "S", firstBrewed: "S", imageURL: "S")])
    
    func request(api: Router) {
        Network.shared.requestConvertible(type: [BeerElement].self, api: api) { response in
            switch response {
            case .success(let success):
                dump(success)
                self.beers.value = success
            case .failure(let failure):
                print(failure.errorDescription!)
            }
        }
    }
}
