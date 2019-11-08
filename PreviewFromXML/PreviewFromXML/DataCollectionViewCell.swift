//
//  DataCollectionViewCell.swift
//  PreviewFromXML
//
//  Created by STV-M025 on 2019/11/07.
//  Copyright © 2019 STV-M025. All rights reserved.
//

import UIKit

class DataCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setCell(linkPreviewData: LinkPreviewResponse) {
        guard let imageURL = linkPreviewData.image else {
            return
        }
        mainImageView.image = UIImage.init(url: imageURL)
        titleLabel.text = linkPreviewData.title
        descriptionLabel.text = linkPreviewData.description
    }
}

extension UIImage {
    public convenience init(url: String) {
        let url = URL(string: url)
        do {
            let data = try Data(contentsOf: url!)
            self.init(data: data)!
            return
        } catch let err {
            print("Error : \(err.localizedDescription)")
        }
        self.init()
    }
}
