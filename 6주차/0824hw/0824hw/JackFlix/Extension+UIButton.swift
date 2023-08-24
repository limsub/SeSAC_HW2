//
//  Extension+UIButton.swift
//  0824hw
//
//  Created by 임승섭 on 2023/08/24.
//

import UIKit

extension UIButton {
    
    func alignTextBelow(spacing: CGFloat = 4.0) {
        // 버튼 이미지
        guard let image = self.imageView?.image else { return }
        
        // 버튼 타이틀
        guard let titleLabel = self.titleLabel else { return }
        
        // 버튼 타이틀 텍스트
        guard let titleText = titleLabel.text else { return }
        
        // 타이틀 크기
        let titleSize = titleText.size(withAttributes: [
            NSAttributedString.Key.font: titleLabel.font as Any
        ])
        
        titleEdgeInsets = UIEdgeInsets(
            top: spacing, left: -image.size.width, bottom: -image.size.height, right: 0)
        
        imageEdgeInsets = UIEdgeInsets(
            top: -(titleSize.height + spacing), left: 0, bottom: 0, right: -titleSize.width)
    }
}
