//
//  PendingOrderTableCell.swift
//  GSBaseMVC
//
//  Created by Gati on 30/01/20.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import UIKit

class PendingOrderTableCell: UITableViewCell {
    //MARK:- IBOutlets
    @IBOutlet weak var labelOrderIdView : UIView!
    @IBOutlet weak var labelOrderIdTitle : UILabel!
    @IBOutlet weak var labelOrderId : UILabel!
    @IBOutlet weak var labelDateTitle : UILabel!
    @IBOutlet weak var labelOrderDate : UILabel!
    @IBOutlet weak var labelPaymentTitle : UILabel!
    @IBOutlet weak var labelPaymentStatus : UILabel!
    @IBOutlet weak var labelTotalTitle : UILabel!
    @IBOutlet weak var labelTotal : UILabel!

    //MARK:- Variables
    var pendingData : PendingData? {
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
    
    class func instanceFromNib() -> PendingOrderTableCell {
        return UINib(nibName: CellIdentifier.PendingOrderTableCell, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! PendingOrderTableCell
    }
    
    //MARK:- Custom Methods
    func setUpView() {
        self.labelDateTitle.setUpLabel(title: StringConstant.MyOrder.orderOn, titleColor: .black, titleFont: GetAppFont(FontType: .Gilmer_Regular, FontSize: .Regular))
        self.labelOrderIdTitle.setUpLabel(title: StringConstant.MyOrder.orderId, titleColor: .white, titleFont: GetAppFont(FontType: .Gilmer_Regular, FontSize: .Regular))
        self.labelPaymentTitle.setUpLabel(title: StringConstant.MyOrder.paymentStatus, titleColor: .black, titleFont: GetAppFont(FontType: .Gilmer_Regular, FontSize: .Regular))
        self.labelTotalTitle.setUpLabel(title: StringConstant.MyOrder.total, titleColor: .black, titleFont: GetAppFont(FontType: .Gilmer_Regular, FontSize: .Regular))
        self.labelOrderId.setUpLabel(title: "", titleColor: .white, titleFont: GetAppFont(FontType: .Gilmer_Bold, FontSize: .Regular))
        self.labelOrderDate.setUpLabel(title: "", titleColor: .black, titleFont: GetAppFont(FontType: .Montserrat_Bold, FontSize: .Regular))
        self.labelPaymentStatus.setUpLabel(title: "", titleColor: .black, titleFont: GetAppFont(FontType: .Montserrat_Bold, FontSize: .Regular))
        self.labelTotal.setUpLabel(title: "", titleColor: .black, titleFont: GetAppFont(FontType: .Montserrat_Bold, FontSize: .Regular))
        
    }
    
    func setUpData() {
        self.labelOrderDate.text = pendingData?.order_date
        self.labelOrderId.text = pendingData?.order_id
        if let paymentStatus = pendingData?.payment_status {
            if paymentStatus == StringConstant.MyOrder.pending {
                self.labelPaymentStatus.textColor = .orange
            } else {
                self.labelPaymentStatus.textColor = .green
            }
        }
        self.labelPaymentStatus.text = pendingData?.payment_status
        self.labelTotal.text = pendingData?.total
    }
}
