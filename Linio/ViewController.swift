//
//  ViewController.swift
//  Linio
//
//  Created by Jonathan Velazquez on 29/08/17.
//  Copyright © 2017 Jonathan Velazquez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let model = ViewModel()
    
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var collectionView: UICollectionView!
    var refreshControl = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setupTabbar()
        
        refreshControl.tintColor = .orange
        refreshControl.addTarget(self, action: #selector(self.refreshItems), for: .valueChanged)
        
        if #available(iOS 10.0, *) {
            collectionView.refreshControl = refreshControl
        }
        
        model.fetchData(completion: {
            self.collectionView.reloadData()
        })

    }

    func setupTabbar() {
        if #available(iOS 10.0, *) {
            tabBar.unselectedItemTintColor = .white
            tabBar.items?[4].badgeColor = .white
            tabBar.items?[4].setBadgeTextAttributes([NSForegroundColorAttributeName:UIColor.orange], for: .normal)
        }
        tabBar.selectedItem = tabBar.items?[2]
    }
    
    func refreshItems() {
        model.fetchData(completion: {
            self.collectionView.reloadData()
            self.refreshControl.endRefreshing()
            return ()
        })
    }
    
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return model.collections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.numberOfItems(inSection: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenericCollectionViewCell", for: indexPath) as! GenericCollectionViewCell
            cell.configurateCell(withCollection: model.collections[indexPath.row])
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductViewCell", for: indexPath) as! ProductViewCell
            cell.configCell(withProduct: model.getProductFromAllProducts(withIndex: indexPath.row))
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TitleHeader", for: indexPath)
            if indexPath.section == 1, let titleLabel = headerView.viewWithTag(3) as? UILabel {
                titleLabel.text = "Todos mis favoritos (\(model.numberOfProducts))"
            }else{
                headerView.bounds.size.height = 0
            }
            return headerView
        default:
            return UICollectionReusableView(frame: CGRect(x: 0, y: 0, width: 0, height:0))
        }
    }

    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return Dimesion(rawValue: self.view.bounds.width)?.categoryCellSize ?? Dimesion.none.categoryCellSize
        }
        return Dimesion(rawValue: self.view.bounds.width)?.productCellSize ?? Dimesion.none.productCellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return Dimesion(rawValue: self.view.frame.width)?.insets ?? Dimesion.none.insets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return CGSize(width: self.view.bounds.width, height: 50)
        }else{
            return CGSize.zero
        }
    }
}







