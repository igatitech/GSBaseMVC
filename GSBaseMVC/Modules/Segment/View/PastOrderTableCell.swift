//
//  PastOrderTableCell.swift
//  GSBaseMVC
//
//  Created by Gati on 30/01/20.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import UIKit
import SDWebImage

class PastOrderTableCell: UITableViewCell {
    //MARK:- IBOutlets
    @IBOutlet weak var labelOrderIdView : UIView!
    @IBOutlet weak var labelOrderIdTitle : UILabel!
    @IBOutlet weak var labelOrderId : UILabel!
    @IBOutlet weak var imageViewItem : UIImageView!
    @IBOutlet weak var labelName : UILabel!
    @IBOutlet weak var labelPaymentMethod : UILabel!
    @IBOutlet weak var labelOrderDate : UILabel!
    
    //MARK:- Variables
    var dummyImage : DummyImages?
    var pastData : PastData? {
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
    
    class func instanceFromNib() -> PastOrderTableCell {
        return UINib(nibName: CellIdentifier.PastOrderTableCell, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! PastOrderTableCell
    }
    
    //MARK:- Custom Methods
    func setUpView() {
        self.labelOrderIdTitle.setUpLabel(title: StringConstant.MyOrder.orderId, titleColor: .white, titleFont: GetAppFont(FontType: .Gilmer_Regular, FontSize: .Regular))
        self.labelOrderId.setUpLabel(title: "", titleColor: .white, titleFont: GetAppFont(FontType: .Gilmer_Bold, FontSize: .Regular))
        
        self.labelName.setUpLabel(title: "", titleColor: .black, titleFont: GetAppFont(FontType: .Gilmer_Medium, FontSize: .Medium))
        self.labelPaymentMethod.setUpLabel(title: StringConstant.MyOrder.paymentMethod, titleColor: .black, titleFont: GetAppFont(FontType: .Gilmer_Regular, FontSize: .Small))
        self.labelOrderDate.setUpLabel(title: StringConstant.MyOrder.orderOn, titleColor: .black, titleFont: GetAppFont(FontType: .Gilmer_Regular, FontSize: .Small))
    }
    
    func setUpData() {
        self.labelOrderId.text = pastData?.order_id
        self.labelName.text = dummyImage?.author
        self.labelPaymentMethod.text = "\(StringConstant.MyOrder.paymentMethod) \(pastData?.payment_method ?? "")"
        self.labelOrderDate.text = "\(StringConstant.MyOrder.orderOn) \(pastData?.order_date ?? "")"
//        self.imageViewItem?.sd_setImage(with: URL(string: dummyImage?.download_url ?? "") , placeholderImage: UIImage(named: AppImages.placeholder), options: .fromCacheOnly)
        imageViewItem.sd_setImage(with: URL(string: ""), placeholderImage: UIImage(named: AppImages.placeholder), options: .refreshCached)
    }
}
