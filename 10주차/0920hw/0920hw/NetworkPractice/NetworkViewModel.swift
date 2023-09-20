//
//  NetworkViewModel.swift
//  0920hw
//
//  Created by 임승섭 on 2023/09/20.
//

import Foundation

class NetworkViewModel {
    
    var url = Observable(URL(string: ""))
    
//    var data = Observable(Data())
    
    func requestRandom() {
        
        Network.shared.requestConvertible(type: PhotoResult.self, api: .random) { response in
            switch response {
            case .success(let success):
                dump(success)
                self.url.value = URL(string: success.urls.thumb)!
                
//                self.data.value = try! Data(contentsOf: URL(string: success.urls.thumb)!)
                
            case .failure(let failure):
                print(failure.errorDescription)
            }
        }
        
    }
    
}

extension NetworkViewModel {
    enum Action {
        case requestRandom
    }
    
    func doAction(_ type: Action) {
        switch type {
        case .requestRandom:
            requestRandom();
        }
    }
}
