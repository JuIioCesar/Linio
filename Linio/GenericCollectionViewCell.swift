//
//  GenericCollectionViewCell.swift
//  Linio
//
//  Created by Jonathan Velazquez on 31/08/17.
//  Copyright © 2017 Jonathan Velazquez. All rights reserved.
//

import UIKit

class GenericCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var principalImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var thirdImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var imagesContentView: UIView!
    
    override func awakeFromNib() {
        imagesContentView.layer.cornerRadius = 5
        imagesContentView.clipsToBounds = true
        principalImage.layer.cornerRadius = 5
        principalImage.clipsToBounds = true
        secondImage.layer.cornerRadius = 5
        secondImage.clipsToBounds = true
        thirdImage.layer.cornerRadius = 5
        thirdImage.clipsToBounds = true
        
    }
    
    func configurateCell(withCollection collection:CollectionProtocol) {
        NetworkHelper.downloadImage(url: collection.products.first?.imageURL, imageView: principalImage)
        NetworkHelper.downloadImage(url: collection.products[1].imageURL, imageView: secondImage)
        NetworkHelper.downloadImage(url: collection.products[2].imageURL, imageView: thirdImage)
        titleLabel.text = collection.name
        subtitleLabel.text = "\(collection.products.count)"
    }
    
    
}
