//
//  InfoVC.swift
//  GSBaseMVC
//
//  Created by Gati Shah on 29/02/20.
//  Copyright © 2020 Gati Shah. All rights reserved.
//

import UIKit

class InfoVC: UIViewController {
    //MARK:- IBOutlets
    @IBOutlet weak var labelQuote1 : UILabel!
    @IBOutlet weak var labelQuote2 : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK:- Custom Methods
    func changeLanguage(strLang : Language) {
        labelQuote1.text = LangConstant.quote1.localizableString(langCode: strLang.rawValue)
        labelQuote2.text = LangConstant.quote2.localizableString(langCode: strLang.rawValue)
    }
    
    //MARK:- IBActions
    @IBAction func languageChangeSegmentChange(_ sender : UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            changeLanguage(strLang: .English)
        default:
            changeLanguage(strLang: .Spanish)
        }
    }

}
