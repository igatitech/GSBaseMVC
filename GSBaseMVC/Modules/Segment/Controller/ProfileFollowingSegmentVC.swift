//
//  ProfileFollowingSegmentVC.swift
//  GSBaseMVC
//
//  Created by Gati on 30/01/20.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import UIKit
import SJSegmentedScrollView

class ProfileFollowingSegmentVC: UIViewController {
    //MARK:- IBOutlets
    @IBOutlet weak var tableViewFollowing : UITableView!
    
    //MARK:- Variables
    let dataCount = 20
    var pageNum = 1
    var arrImages : [DummyImages]?
    var pullToRefresh = UIRefreshControl()
    
    //MARK:- View Controller Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        arrImages?.removeAll()
        getDummyFollowingData(pageNum: 1)
    }
    
    //MARK:- Custom Methods
    func setUpView() {
        self.tableViewFollowing.registerTablViewCell(cellIdentifier: CellIdentifier.ProfileTableCell)
        pullToRefresh.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
    }
    
    //MARK:- Selector Methods
    @objc func refresh(sender : AnyObject) {
        arrImages?.removeAll()
        getDummyFollowingData(pageNum: 1)
    }
    
    //MARK:- API Call
    func getDummyFollowingData(pageNum : Int) {
        NetworkManager.request(showloader: true, url: .GetDummyPhotos(page: pageNum, limit: dataCount), method: .get, parameters: [:], responseString: StringConstant.APIResponse.dummyImages, success: { (response) in
            print(response)
            self.pullToRefresh.endRefreshing()
            if let arrResponse = response.arrayObject as NSArray? {
                if self.arrImages?.count ?? 0 <= 0 {
                    self.arrImages = DummyImages.modelsFromDictionaryArray(array: arrResponse)
                } else {
                    self.arrImages?.append(contentsOf: DummyImages.modelsFromDictionaryArray(array: arrResponse))
                }
                self.tableViewFollowing.reloadData()
            }
        }, failure: { (error) in
            self.pullToRefresh.endRefreshing()
            print("Get Dummy Images Error : \(error ?? "")")
        })
    }
}

//MARK:- UITableView Datasource & Delegate
extension ProfileFollowingSegmentVC : UITableViewDelegate, UITableViewDataSource {
    
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
        let cell = self.tableViewFollowing.dequeueReusableCell(withIdentifier: CellIdentifier.ProfileTableCell) as! ProfileTableCell
        cell.dummyImage = arrImages?[indexPath.row]
        
        //Pagination
        let lastItem = arrImages?.count ?? 0 - 1
        if indexPath.row == lastItem {
            pageNum += 1
            getDummyFollowingData(pageNum: pageNum)
        }
        return cell
    }
}


//MARK:- SJSegmentedViewController ViewSource
extension ProfileFollowingSegmentVC: SJSegmentedViewControllerViewSource {
    func viewForSegmentControllerToObserveContentOffsetChange() -> UIView {
        return tableViewFollowing
    }
}
