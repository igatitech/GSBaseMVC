//
//  UITableViewExtension.swift
//  Unbox
//
//  Created by Gati on 24/08/20.
//  Copyright © 2019 Gati Shah. All rights reserved.
//

import UIKit

extension UITableView {
    func registerTablViewCell(cellIdentifier : String)  {
        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: cellIdentifier)
        self.tableFooterView = UIView()
//        self.setSepratoreToZero()
    }
    
    func setSepratoreToZero() {
        self.preservesSuperviewLayoutMargins = false
        self.separatorInset = UIEdgeInsets.zero
        self.layoutMargins = UIEdgeInsets.zero
    }
    
    func nextResponder(index: Int){
        var currIndex = -1
        for i in index+1..<index+100{
            if let view = self.superview?.superview?.viewWithTag(i){
                view.becomeFirstResponder()
                currIndex = i
                break
            }
        }
        
        let ind = IndexPath(row: currIndex - 100, section: 0)
        if let nextCell = self.cellForRow(at: ind){
            self.scrollRectToVisible(nextCell.frame, animated: true)
        }
    }
    
//    func noDataAvailableView(imageName : EmptyScreenImages, title : EmptyScreenTitle, description : EmptyScreenDesc) -> UIView {
//        let noDataView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
//        let imageView : UIImageView = UIImageView(frame: CGRect(x: (self.bounds.size.width - 128)/2, y: ((self.bounds.size.height - 128)/2) - 60, width: 128, height: 128))
//        imageView.image = UIImage(named: imageName.rawValue)
//        
//        let labelTitle : UILabel = UILabel(frame: CGRect(x: 0, y: imageView.frame.origin.y + imageView.frame.size.height + 8, width: self.bounds.size.width, height: 22))
//        labelTitle.font = GetAppFont(FontType: .Gilmer_Regular, FontSize: .Large)
//        labelTitle.textColor = .AppTextBlack
//        labelTitle.textAlignment = .center
//        labelTitle.text = title.rawValue
//        
//        let labelDesc : UILabel = UILabel(frame: CGRect(x: 40, y: labelTitle.frame.origin.y + labelTitle.frame.size.height + 8, width: self.bounds.size.width - 80, height: 30))
//        labelDesc.font = GetAppFont(FontType: .Gilmer_Regular, FontSize: .Small)
//        labelDesc.textColor = .AppGray161
//        labelDesc.textAlignment = .center
//        labelDesc.numberOfLines = 0
//        labelDesc.text = description.rawValue
//        
//        noDataView.addSubview(imageView)
//        noDataView.addSubview(labelTitle)
//        noDataView.addSubview(labelDesc)
//        
//        return noDataView
//    }
    
    func noDataAvailableLabel(labelString : String) -> UILabel {

        let noDataLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        noDataLabel.text = labelString
        noDataLabel.font = GetAppFont(FontType: .Gilmer_Bold, FontSize: .Large)
        noDataLabel.textColor = .black
        noDataLabel.backgroundColor = .white
        noDataLabel.textAlignment = .center
        return noDataLabel
    }
}
