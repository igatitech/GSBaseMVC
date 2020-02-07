//
//  MainTableCell.swift
//  GSBaseMVC
//
//  Created by Gati on 29/01/20.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import UIKit

class MainTableCell: UITableViewCell {
    //MARK:- IBOutlets
    @IBOutlet weak var labelTitle : UILabel!
    
    //MARK:- Variables

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:- Custom Methods
    func setUpView() {
        self.accessoryType = .disclosureIndicator
    }
    
}
