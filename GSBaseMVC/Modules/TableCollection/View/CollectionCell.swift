//
//  CollectionCell.swift
//  BaseProject_MVC
//
//  Created by iGatiTech on 07/09/19.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    //MARK:- IBOutlets
    //MARK:- Variables
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpView()
    }

    class func instanceFromNib() -> CollectionCell {
        return UINib(nibName: CellIdentifier.CollectionCell, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! CollectionCell
    }
    
    func setUpView(){
    }
}
