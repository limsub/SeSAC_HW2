//
//  FileManager+Extension.swift
//  0904hw
//
//  Created by 임승섭 on 2023/09/05.
//

import UIKit

extension UIViewController {
    
    // 도큐먼트 폴더에 사진 파일 저장
    func saveImageToDocument(fileName: String, image: UIImage) {
        
        // 1. 도큐먼트 경로
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        
        // 2. 저장할 위치
        let fileURL = documentDirectory.appendingPathComponent(fileName)    // ~~~/aaa.jpg
        
        // 3. 이미지 파일 변환
        guard let data = image.jpegData(compressionQuality: 0.5) else { return }
        
        // 4. 이미지 저장
        do {
            try data.write(to: fileURL)
//            print("사진 파일 저장 SUCCESS")
        } catch let error {
            print("사진 파일 저장 ERROR : ", error)
        }
    }
    
    
    // 도큐먼트 폴더에서 사진 파일 가져옴
    func loadImageFromDocument(fileName: String) -> UIImage {
        
        // 1. 도큐먼트 경로
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return UIImage(systemName: "star.fill")! }
        
        // 2. 파일 경로
        let fileURL = documentDirectory.appendingPathComponent(fileName)
        
        // 3. 리턴
        if FileManager.default.fileExists(atPath: fileURL.path) {
//            print("이미지 로딩 SUCCESS")
            return UIImage(contentsOfFile: fileURL.path)!
        } else {
            print("이미지 로딩 FAIL")
            return UIImage(systemName: "star.fill")!
        }
    }
    
    
    // 도큐먼트 폴더에서 사진 파일 remove
    func removeImageFromDocument(fileName: String) {
        // 1. 도큐먼트 경로
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        
        // 2. 파일 경로
        let fileURL = documentDirectory.appendingPathComponent(fileName)
        
        // 3. 삭제
        do {
            print("이미지 삭제 SUCCESS")
            try FileManager.default.removeItem(at: fileURL)
        } catch {
            print("이미지 삭제 FAIL : ", error)
        }
    }
}
