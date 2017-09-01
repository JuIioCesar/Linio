//
//  NetworkHelper.swift
//  Linio
//
//  Created by Jonathan Velazquez on 31/08/17.
//  Copyright © 2017 Jonathan Velazquez. All rights reserved.
//

import Foundation
import UIKit

class NetworkHelper{
    
    static var storagedImages:[URL:Data] = [URL:Data]()
    
    class func downloadImage(url:URL?,imageView:UIImageView){
        guard let url = url else {
            return
        }
        
        if let data = storagedImages[url] {
            imageView.image = UIImage(data: data)
            return
        }
        
        DispatchQueue.global().async {
            do{
                let data = try Data(contentsOf: url)
                storagedImages[url] = data
                DispatchQueue.main.sync {
                    imageView.image = UIImage(data: data)
                }
            }catch {
                print("Error downloading image with url:\(url)")
            }
        }
    }
}
