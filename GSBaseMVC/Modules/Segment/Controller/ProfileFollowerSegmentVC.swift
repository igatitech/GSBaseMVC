//
//  ProfileFollowerSegmentVC.swift
//  GSBaseMVC
//
//  Created by Gati on 30/01/20.
//  Copyright © 2020 Gati Shah. All rights reserved.
//

import UIKit
import SJSegmentedScrollView

class ProfileFollowerSegmentVC: UIViewController {
    //MARK:- IBOutlets
    @IBOutlet weak var tableViewFollowers : UITableView!
    
    //MARK:- Variables
    let dataCount = 20
    var arrImages : [DummyImages]?
    var pullToRefresh = UIRefreshControl()
    
    //MARK:- View Controller Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getDummyFollowingData()
    }
    
    //MARK:- Custom Methods
    func setUpView() {
        self.tableViewFollowers.registerTablViewCell(cellIdentifier: CellIdentifier.ProfileTableCell)
        pullToRefresh.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
    }
    
    //MARK:- Selector Methods
    @objc func refresh(sender : AnyObject) {
        getDummyFollowingData()
    }
    
    //MARK:- API Call
    func getDummyFollowingData() {
        NetworkManager.request(showloader: true, url: .GetDummyPhotos(page: 2, limit: dataCount), method: .get, parameters: [:], responseString: StringConstant.APIResponse.dummyImages, success: { (response) in
            print(response)
            self.pullToRefresh.endRefreshing()
            if let arrResponse = response.arrayObject as NSArray? {
                self.arrImages = DummyImages.modelsFromDictionaryArray(array: arrResponse)
                self.tableViewFollowers.reloadData()
            }
        }, failure: { (error) in
            self.pullToRefresh.endRefreshing()
            print("Get Dummy Images Error : \(error ?? "")")
        })
    }
}

//MARK:- UITableView Datasource & Delegate
extension ProfileFollowerSegmentVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrImages?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ProfileTableCell.instanceFromNib().frame.size.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableViewFollowers.dequeueReusableCell(withIdentifier: CellIdentifier.ProfileTableCell) as! ProfileTableCell
        cell.dummyImage = arrImages?[indexPath.row]
        return cell
    }
}

//MARK:- SJSegmentedViewController ViewSource
extension ProfileFollowerSegmentVC: SJSegmentedViewControllerViewSource {
    func viewForSegmentControllerToObserveContentOffsetChange() -> UIView {
        return tableViewFollowers
    }
}
