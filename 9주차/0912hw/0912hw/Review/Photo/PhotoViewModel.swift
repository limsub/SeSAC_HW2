//
//  PhotoViewModel.swift
//  0912hw
//
//  Created by 임승섭 on 2023/09/12.
//

import Foundation

class PhotoViewModel {
    var list = Observable(Photo(total: 0, total_pages: 0, results: []))
    
    func fetchPhoto() {
        APIService.shared.searchPhoto(query: "sky") { photo in
            guard let photo = photo else { return }
            
            self.list.value = photo // Observable로 씌워둔 걸 벗겨줘야 함. 실질적인 값은 value
            
            sleep(5)
            
            self.list.value.results?.append(PhotoResult(id: "추가여", created_at: "", description: "", urls: PhotoURL(full: "", thumb: ""), links: PhotoLink(html: ""), likes: 1, user: PhotoUser(username: "")))
        }
    }
    
    var numberOfRowsInSection: Int {
        return list.value.results?.count ?? 0
    }
    
    func cellForRowsAt(at indexPath: IndexPath) -> PhotoResult {
        return list.value.results![indexPath.row]
    }
}
