//
//  UIImageView + Extension.swift
//  chidori
//
//  Created by Yookka1 on 26.11.22.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setupImage(from url: URL?, placeholder: UIImage? = nil) {
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: url,
            placeholder: placeholder,
            options: [
                .processor(DownsamplingImageProcessor(size: self.bounds.size)),
                .scaleFactor(UIScreen.main.scale),
                .cacheOriginalImage
            ]
        )
    }
}
