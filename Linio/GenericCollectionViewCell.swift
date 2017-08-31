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
    
    override func awakeFromNib() {
    }
    
    
    
}
