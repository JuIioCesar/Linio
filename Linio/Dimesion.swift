//
//  Dimesion.swift
//  Linio
//
//  Created by Jonathan Velazquez on 31/08/17.
//  Copyright © 2017 Jonathan Velazquez. All rights reserved.
//

import Foundation
import UIKit

public enum Dimesion: CGFloat {
    case iPhone4 = 320
    case iPhone47 = 375
    case iPhone55 = 414
    case none
    
    public var categoryCellSize:CGSize {
        switch self {
        case .iPhone4:
            return CGSize(width: 148, height: 151)
        case .iPhone47:
            return CGSize(width: 174, height: 178)
        case .iPhone55:
            return CGSize(width: 192, height: 196)
        case .none:
            return CGSize(width: 0, height: 0)
        }
    }
    
    public var productCellSize:CGSize {
        switch self {
        case .iPhone4:
            return CGSize(width: 148, height: 148)
        case .iPhone47:
            return CGSize(width: 174, height: 174)
        case .iPhone55:
            return CGSize(width: 192, height: 192)
        case .none:
            return CGSize(width: 0, height: 0)
        }
    }
    
    public
    var insets:UIEdgeInsets {
        switch self {
        case .iPhone4:
            return UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        case .iPhone47:
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        case .iPhone55:
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        case .none:
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }
    }
}
