//
//  NormalCollectionVC.swift
//  GSBaseMVC
//
//  Created by Gati on 29/01/20.
//  Copyright © 2020 Gati Shah. All rights reserved.
//

import UIKit

class NormalCollectionVC: UIViewController {
    //MARK:- IBOutlets
    @IBOutlet weak var collectionViewData : UICollectionView!
    
    //MARK:- Variables
    var pullToRefresh = UIRefreshControl()

    //MARK:- View Controller Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    //MARK:- Custom Methods
    func setUpView() {
        self.collectionViewData.register(UINib(nibName: CellIdentifier.CollectionCell, bundle: nil), forCellWithReuseIdentifier: CellIdentifier.CollectionCell)
        self.collectionViewData.register(UINib(nibName: ViewIdentifier.CollectionHeader, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ViewIdentifier.CollectionHeader)
        pullToRefresh.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        collectionViewData.addSubview(pullToRefresh)
        
    }
    
    //MARK:- Selector Methods
    @objc func refresh(sender : AnyObject) {
        pullToRefresh.endRefreshing()
    }
    
    //MARK:- IBActions
}

extension NormalCollectionVC : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 200
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionViewData.dequeueReusableCell(withReuseIdentifier: CellIdentifier.CollectionCell, for: indexPath) as! CollectionCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = self.collectionViewData.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ViewIdentifier.CollectionHeader, for: indexPath) as! CollectionHeaderView
            return headerView
        default:
            return  UIView() as! UICollectionReusableView
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize{
        return CGSize(width: self.view.frame.size.width, height: CollectionHeaderView.instanceFromNib().frame.size.height)
    }
}

