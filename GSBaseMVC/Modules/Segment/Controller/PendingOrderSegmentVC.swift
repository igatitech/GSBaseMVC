//
//  PendingOrderSegmentVC.swift
//  GSBaseMVC
//
//  Created by Gati on 30/01/20.
//  Copyright © 2020 Gati Shah. All rights reserved.
//

import UIKit
import SwiftyJSON

class PendingOrderSegmentVC: UIViewController {
    //MARK:- IBOutlets
    @IBOutlet weak var tableViewPendingOrder : UITableView!
    
    //MARK:- Variables
    var pendingOrder : PendingOrder?
    var pullToRefresh = UIRefreshControl()

    //MARK:- View Controller Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTmpPendingOrderDataFromJSONFile()
    }
    
    //MARK:- Custom Methods
    func setUpView() {
        self.tableViewPendingOrder.registerTablViewCell(cellIdentifier: CellIdentifier.PendingOrderTableCell)
        pullToRefresh.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        tableViewPendingOrder.addSubview(pullToRefresh)
    }
    
    //MARK:- Selector Methods
    @objc func refresh(sender:AnyObject) {
       // Code to refresh table view
        getTmpPendingOrderDataFromJSONFile()
    }
    
    //MARK:- API Call
    func getTmpPendingOrderDataFromJSONFile() {
        guard let path = Bundle.main.path(forResource: "PendingOrder", ofType: "json") else {
            pullToRefresh.endRefreshing()
            return }
        let url = URL(fileURLWithPath: path)
        pullToRefresh.endRefreshing()
        do {
            let data = try Data(contentsOf: url)
            let responseJson = try JSON(data: data)
            if let dictResponse = responseJson.dictionaryObject as NSDictionary? {
                self.pendingOrder = PendingOrder(dictionary: dictResponse)
                self.tableViewPendingOrder.reloadData()
            }
        } catch {
            print(error)
        }
    }
}

//MARK:- UITableView Datasource & Delegate
extension PendingOrderSegmentVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pendingOrder?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return PendingOrderTableCell.instanceFromNib().frame.size.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableViewPendingOrder.dequeueReusableCell(withIdentifier: CellIdentifier.PendingOrderTableCell) as! PendingOrderTableCell
        cell.pendingData = self.pendingOrder?.data?[indexPath.row]
        return cell
    }
}
