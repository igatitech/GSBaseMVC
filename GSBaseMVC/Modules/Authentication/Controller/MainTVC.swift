//
//  MainTVC.swift
//  GSBaseMVC
//
//  Created by Gati on 29/01/20.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import UIKit

class MainTVC: UITableViewController {
    //MARK:- IBOutlets
    
    //MARK:- Variables
    let arrTitles : [Titles] = [.normalTableView, .normalCollectionView, .segmentController, .segmentControllerHeader, .languageLocalization]
    
    //MARK:- View Controller Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: StringConstant.Common.kBack, style: .plain, target: nil, action: nil)
    }
    
    //MARK:- Custom Methods
    func setUpView() {
        self.title = StringConstant.MainTVC.list
        self.tableView.registerTablViewCell(cellIdentifier: CellIdentifier.MainTableCell)
    }
    
    //MARK:- Navigations
    func pushToNormalTableViewScreen() {
        guard let vcNormalTableView = GetViewController(StoryBoard: .TableCollection, Identifier: .NormalTable) else {
            return
        }
        self.navigationController?.pushViewController(vcNormalTableView, animated: true)
    }
    
    func pushToNormalCollectionViewSceen() {
        guard let vcNormalCollectionView = GetViewController(StoryBoard: .TableCollection, Identifier: .NormalCollection) else {
            return
        }
        self.navigationController?.pushViewController(vcNormalCollectionView, animated: true)
    }
    
    func pushToSJSegmentControllerScreen() {
        guard let vcMyOrders = GetViewController(StoryBoard: .Segment, Identifier: .MyOrderSegmentMain) else {
            return
        }
        self.navigationController?.pushViewController(vcMyOrders, animated: true)
    }
    
    func pushToSJSegmentControllerWithHeaderScreen() {
        guard let vcProfile = GetViewController(StoryBoard: .Segment, Identifier: .ProfileSegmentMain) else {
            return
        }
        self.navigationController?.pushViewController(vcProfile, animated: true)
    }
    
    func pushToLanguageLocaliseScreen() {
        guard let vcInfo = GetViewController(StoryBoard: .Localize, Identifier: .Info) else {
            return
        }
        self.navigationController?.pushViewController(vcInfo, animated: true)
    }

    // MARK: - Table view data source & delegate methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrTitles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: CellIdentifier.MainTableCell) as! MainTableCell
        cell.labelTitle.text = arrTitles[indexPath.row].rawValue
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            pushToNormalTableViewScreen()
        case 1:
            pushToNormalCollectionViewSceen()
        case 2:
            pushToSJSegmentControllerScreen()
        case 3:
            pushToSJSegmentControllerWithHeaderScreen()
        case 4:
            pushToLanguageLocaliseScreen()
        default:
            print("Defualt Case")
        }
    }

}
