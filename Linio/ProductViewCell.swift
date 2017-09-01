//
//  ProductViewCell.swift
//  Linio
//
//  Created by Jonathan Velazquez on 31/08/17.
//  Copyright © 2017 Jonathan Velazquez. All rights reserved.
//

import UIKit

class ProductViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet var iconsImages: [UIImageView]!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var likeIcon: UIImageView!
    
    
    override func awakeFromNib() {
    }
    
    func configCell(withProduct product:ProductProtocol) {
        
        NetworkHelper.downloadImage(url: product.imageURL, imageView: productImage)
        
        var iconsAvailables = [UIImage]()
        if let plusLevel = product.linioPlusLevel {iconsAvailables.append(plusLevel)}
        if let condition = product.condition { iconsAvailables.append(condition)}
        if let imported = product.imported { iconsAvailables.append(imported)}
        if let freeShipping = product.freeShipping { iconsAvailables.append(freeShipping)}
        
        for i in 0...(iconsImages.count-1) {
            if i < iconsAvailables.count {
                iconsImages[i].image = iconsAvailables[i]
            }else{
                iconsImages[i].image = UIImage()
            }
        }
        
        self.contentView.bringSubview(toFront: stackView)
        self.contentView.bringSubview(toFront: likeIcon)

    }
    
}
