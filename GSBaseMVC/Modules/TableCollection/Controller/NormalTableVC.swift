//
//  NormalTableVC.swift
//  GSBaseMVC
//
//  Created by Gati on 29/01/20.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import UIKit

class NormalTableVC: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet weak var tableViewData : UITableView!
    
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
        self.tableViewData.register(UINib(nibName: ViewIdentifier.TableHeader, bundle: nil), forHeaderFooterViewReuseIdentifier: ViewIdentifier.TableHeader)
        self.tableViewData.registerTablViewCell(cellIdentifier: CellIdentifier.TableCell)
        pullToRefresh.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        tableViewData.addSubview(pullToRefresh)
    }
    
    //MARK:- Selector Methods
    @objc func refresh(sender : AnyObject) {
        pullToRefresh.endRefreshing()
    }
    //MARK:- IBActions
}

//MARK:- UITableView Datasource & Delegate
extension NormalTableVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TableCell.instanceFromNib().frame.size.height
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return TableHeaderView.instanceFromNib().frame.size.height
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = TableHeaderView.instanceFromNib()
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableViewData.dequeueReusableCell(withIdentifier: CellIdentifier.TableCell) as! TableCell
        return cell
    }
    
}


