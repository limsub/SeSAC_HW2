//
//  DetailViewController.swift
//  0904hw
//
//  Created by 임승섭 on 2023/09/05.
//

import UIKit
import SnapKit
import RealmSwift

// 상세 화면
// 이미지, 타이틀, 컨텐츠 -> 수정 불가능
// 메모 텍스트필드 -> 수정 가능
// toolBar BarButtonItem -> 삭제 / 수정
    // 삭제 -> 데이터 제거 및 사진 삭제 후 popView
    // 수정 -> 데이터 수정 후 popView

class DetailViewController: BaseViewController {
    
    var data: BookTable?
    
    let realm = try! Realm()
    
    let imageView = {
        let view = UIImageView()
        
        return view
    }()
    
    let titleLabel = {
        let label = UILabel()
        
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 1
        
        return label
    }()
    
    let contentLabel = {
        let label = UILabel()
        
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 1
        
        label.numberOfLines = 2
        
        return label
    }()
    
    let memoTextFields = {
        let textField = UITextField()
        
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        
        return textField
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // toolBar
        navigationController?.isToolbarHidden = false
        
        let modifyButton = UIBarButtonItem(title: "수정", style: .plain, target: self, action: #selector(modifyButtonClicked))
        let deleteButton = UIBarButtonItem(title: "삭제", style: .plain, target: self, action: #selector(deleteButtonClicked))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        toolbarItems = [modifyButton, flexibleSpace, deleteButton]
    }
    
    @objc
    func modifyButtonClicked() {
        // 데이터 수정
        guard let data = data else { return }
        print(data)
        let item = BookTable(value: ["_id": data._id, "title": data.title, "contents": data.contents, "memo": memoTextFields.text!])
        
        // 결과적으로, 다 넣어야 수정된다?
        
        
        do {
            try realm.write {
                realm.add(item, update: .modified)
            }
        } catch {
            print("")
        }
        navigationController?.popViewController(animated: true)
        print(data)
    }
    
    @objc
    func deleteButtonClicked() {
        // 사진 삭제 + 데이터 삭제
        if let data {
            removeImageFromDocument(fileName: "sub_\(data._id).jpg")

            try! realm.write {
                realm.delete(data)
            }
        }
        navigationController?.popViewController(animated: true)
    }
    
    override func setConfigure() {
        super.setConfigure()
        
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(contentLabel)
        view.addSubview(memoTextFields)
        
        if let data {
            imageView.image = loadImageFromDocument(fileName: "sub_\(data._id).jpg")
            titleLabel.text = data.title
            contentLabel.text = data.contents
            memoTextFields.text = data.memo
        }
        
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.centerX.equalTo(view)
            make.size.equalTo(100)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view).inset(20)
            make.height.equalTo(50)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view).inset(20)
            make.height.equalTo(100)
        }
        
        memoTextFields.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view).inset(20)
            make.height.equalTo(50)
        }
        
    }
}
