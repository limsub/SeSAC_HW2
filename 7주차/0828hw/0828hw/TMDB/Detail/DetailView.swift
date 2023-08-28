//
//  DetailView.swift
//  0828hw
//
//  Created by 임승섭 on 2023/08/28.
//

import UIKit
import SnapKit

class DetailView: BaseView {
    
    let titleLabel = {
        let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        
        
        
        return label
    }()
    
    let backImageView = UIImageView()
    let posterImageView = UIImageView()
    
    let overViewLabel = makeLabel()
    let castLabel = makeLabel()
    let crewLabel = makeLabel()
    
    static func makeLabel() -> UILabel{
        let label = UILabel()
        
        label.textColor = .black
        
        return label
    }
    
    let overViewTextView = makeTextView()
    let castTextView = makeTextView()
    let crewTextView = makeTextView()
    
    static func makeTextView() -> UITextView {
        let textView = UITextView()
        
        textView.isEditable = false
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.black.cgColor
        
        textView.text = "sdajflk;jasd;lfkjas;lfkjsdajflk;jasd;lfkjas;lfkjsdajflk;jasd;lfkjas;lfkjsdajflk;jasd;lfkjas;lfkjsdajflk;jasd;lfkjas;lfkjsdajflk;jasd;lfkjas;lfkjsdajflk;jasd;lfkjas;lfkjsdajflk;jasd;lfkjas;lfkjsdajflk;jasd;lfkjas;lfkjsdajflk;jasd;lfkjas;lfkjsdajflk;jasd;lfkjas;lfkjsdajflk;jasd;lfkjas;lfkjsdajflk;jasd;lfkjas;lfkj"
        
        
        
        return textView
    }
    
    
    
        
    override func setConfigure() {
        super.setConfigure()
        
        [backImageView, titleLabel, posterImageView, overViewLabel, castLabel, crewLabel, overViewTextView, castTextView, crewTextView].forEach { item in
            addSubview(item)
        }
        
        titleLabel.text = "타이틀입니다"
        backImageView.backgroundColor = .blue
        posterImageView.backgroundColor = .systemPink
        overViewLabel.text = "Overview"
        castLabel.text = "Cast"
        crewLabel.text = "Crew"
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        backImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self.safeAreaLayoutGuide)
            make.height.equalTo(self).multipliedBy(0.3)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(backImageView).inset(8)
            make.leading.equalTo(backImageView).inset(8)
        }
        
        posterImageView.snp.makeConstraints { make in
            make.bottom.equalTo(backImageView).inset(8)
            make.leading.equalTo(backImageView).inset(8)
            make.height.equalTo(backImageView).multipliedBy(0.6)
            make.width.equalTo(backImageView).multipliedBy(0.3)
        }
        
        overViewLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImageView.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(self).inset(8)
        }
        
        overViewTextView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(overViewLabel)
            make.top.equalTo(overViewLabel.snp.bottom).offset(10)
            make.height.equalTo(110)
        }
        
        castLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(overViewLabel)
            make.top.equalTo(overViewTextView.snp.bottom).offset(20)
        }
        
        castTextView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(overViewLabel)
            make.top.equalTo(castLabel.snp.bottom).offset(10)
            make.height.equalTo(110)
        }
        
        crewLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(overViewLabel)
            make.top.equalTo(castTextView.snp.bottom).offset(10)
        }
        
        crewTextView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(overViewLabel)
            make.top.equalTo(crewLabel.snp.bottom).offset(10)
            make.height.equalTo(110)
        }
        
        
    }
    
}
