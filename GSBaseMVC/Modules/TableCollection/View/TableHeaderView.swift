//
//  TableHeaderView.swift
//  GSBaseMVC
//
//  Created by iGatiTech on 07/09/19.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import UIKit

class TableHeaderView: UIView {
    //MARK:- IBOutlets
    //MARK:- Variables
    
    class func instanceFromNib() -> TableHeaderView {
        return UINib(nibName: ViewIdentifier.TableHeader, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! TableHeaderView
    }

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        self.setUpView()
    }
    
    //MARK:- Custom Methods
    func setUpView() {
    }

}
