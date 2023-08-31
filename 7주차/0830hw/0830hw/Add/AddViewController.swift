//
//  AddViewController.swift
//  0830hw
//
//  Created by 임승섭 on 2023/08/30.
//

import UIKit

// viewCon
// mainview / loadView / addTarget / @objc func

class AddViewController: BaseViewController {
    
    let mainView = AddView()
    let picker = UIImagePickerController()
    
    
    override func loadView() {
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(newImage),
            name: NSNotification.Name("poster"),
            object: nil
        )
    }
    
    @objc
    func newImage(notification: NSNotification) {
        if let newImage = notification.userInfo?["new image"] as? String {
            mainView.posterImageView.kf.setImage(with: URL(string: newImage))
        }
    }
    
    override func setConfigure() {
        super.setConfigure()
        
        mainView.searchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        
    }
    
    
    
    @objc
    func searchButtonClicked() {
        
        showActionSheet()
        
        
    }
    
    
    // 다음 화면 전환 (형식상 매개변수 - 타입 UIAlertAction)
    func nextPage(_ sender: UIAlertAction) {
//        sender.title = 웹에서 검색하기
        let vc = SearchViewController()

        present(vc, animated: true)
    }
    
    // 갤러리 접근
    func accessGallery(_ sender: UIAlertAction) {
        
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
            showAlert()
            return
        }
        
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        
        present(picker, animated: true)
    }
    
    
    // action sheet 함수 -> 다른 파일에서 선언해보자 (escaping closure 사용해야 할듯?)
    func showActionSheet() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let gallery = UIAlertAction(title: "갤러리에서 가져오기", style: .default, handler: accessGallery)
        let web = UIAlertAction(title: "웹에서 검색하기", style: .default, handler: nextPage)
//        let web = UIAlertAction(title: "", style: .default) { UIAlertAction in
//            nextPage
//        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        actionSheet.addAction(gallery)
        actionSheet.addAction(web)
        actionSheet.addAction(cancel)
        
        present(actionSheet, animated: true)
    }
    
    // alert 함수
    func showAlert() {
        let alert = UIAlertController(title: "사진 접근 허용", message: "사진 접근이 거부되어 있기 때문에 접근할 수 없습니다", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "확인", style: .default)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
}



extension AddViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            mainView.posterImageView.image = image
            dismiss(animated: true)
        }
    }
}
