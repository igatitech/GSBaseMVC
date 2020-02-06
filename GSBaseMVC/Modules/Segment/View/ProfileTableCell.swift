//
//  ProfileTableCell.swift
//  GSBaseMVC
//
//  Created by Gati on 30/01/20.
//  Copyright © 2020 Gati Shah. All rights reserved.
//

import UIKit

class ProfileTableCell: UITableViewCell {
    //MARK:- IBOutlets
    @IBOutlet weak var imageViewUser : UIImageView!
    @IBOutlet weak var labelName : UILabel!
    
    //MARK:- Variables
    var dummyImage : DummyImages? {
        didSet {
            setUpData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func instanceFromNib() -> ProfileTableCell {
        return UINib(nibName: CellIdentifier.ProfileTableCell, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ProfileTableCell
    }
    
    //MARK:- Custom Methods
    func setUpView() {
        labelName.setUpLabel(title: "", titleColor: .darkGray, titleFont: GetAppFont(FontType: .Montserrat_Medium, FontSize: .Regular))
    }
    
    func setUpData() {
        self.imageViewUser?.sd_setImage(with: URL(string: dummyImage?.download_url ?? "") , placeholderImage: UIImage(named: CommonImg.placeholder), options: .fromCacheOnly)
        self.labelName.text = dummyImage?.author
    }
}
