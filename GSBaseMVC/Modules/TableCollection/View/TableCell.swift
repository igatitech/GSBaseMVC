//
//  TableCell.swift
//  GSBaseMVC
//
//  Created by iGatiTech on 07/09/19.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {
    //MARK:- IBOutlets
    //MARK:- Variables

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpView()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func instanceFromNib() -> TableCell {
        return UINib(nibName: CellIdentifier.TableCell, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! TableCell
    }
    
    //MARK:- Custom Methods
    func setUpView(){
    }
    
}
