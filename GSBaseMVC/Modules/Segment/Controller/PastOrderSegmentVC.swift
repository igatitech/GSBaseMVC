//
//  PastOrderSegmentVC.swift
//  GSBaseMVC
//
//  Created by Gati on 30/01/20.
//  Copyright © 2020 Gati Shah. All rights reserved.
//

import UIKit
import SwiftyJSON

class PastOrderSegmentVC: UIViewController {
    //MARK:- IBOutlets
    @IBOutlet weak var tableViewPastOrder : UITableView!
    
    //MARK:- Variables
    let rowCount = 15
    var arrImages : [DummyImages]?
    var pastOrder : PastOrder?
    var pullToRefresh = UIRefreshControl()

    //MARK:- View Controller Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTmpPastOrderDataFromJSONFile()
        getDummyImages()
    }
    
    //MARK:- Custom Methods
    func setUpView() {
        self.tableViewPastOrder.registerTablViewCell(cellIdentifier: CellIdentifier.PastOrderTableCell)
        pullToRefresh.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        tableViewPastOrder.addSubview(pullToRefresh)
    }
    
    //MARK:- Selector Methods
    @objc func refresh(sender:AnyObject) {
       // Code to refresh table view
        getDummyImages()
    }
    
    //MARK:- API Call
    func getTmpPastOrderDataFromJSONFile() {
        guard let path = Bundle.main.path(forResource: "PastOrder", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let responseJson = try JSON(data: data)
            if let dictResponse = responseJson.dictionaryObject as NSDictionary? {
                self.pastOrder = PastOrder(dictionary: dictResponse)
                self.tableViewPastOrder.reloadData()
            }
        } catch {
            print(error)
        }
    }
    
    func getDummyImages() {
        NetworkManager.request(showloader: true, url: .GetDummyPhotos(page: 1, limit: rowCount), method: .get, parameters: [:], responseString: StringConstant.APIResponse.dummyImages, success: { (response) in
            print(response)
            self.pullToRefresh.endRefreshing()
            if let arrResponse = response.arrayObject as NSArray? {
                self.arrImages = DummyImages.modelsFromDictionaryArray(array: arrResponse)
                self.tableViewPastOrder.reloadData()
            }
        }, failure: { (error) in
            self.pullToRefresh.endRefreshing()
            print("Get Dummy Images Error : \(error ?? "")")
        })
    }
}

//MARK:- UITableView Datasource & Delegate
extension PastOrderSegmentVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pastOrder?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return PastOrderTableCell.instanceFromNib().frame.size.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableViewPastOrder.dequeueReusableCell(withIdentifier: CellIdentifier.PastOrderTableCell) as! PastOrderTableCell
        cell.dummyImage = arrImages?[indexPath.row]
        cell.pastData = pastOrder?.data?[indexPath.row]
        return cell
    }
}
