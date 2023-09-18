//
//  PhotoViewModel.swift
//  0918hw
//
//  Created by 임승섭 on 2023/09/18.
//

import Foundation

class PhotoViewModel {
    
    var list = Observable(Photo(total: 0, total_pages: 0, results: []))
    
    func fetchPhoto(text: String) {
        APIService.shared.searchPhoto(query: text) { photo in
            
            DispatchQueue.main.async {
                guard let photo = photo else { return }
                self.list.value = photo
            }
        }
    }
}
