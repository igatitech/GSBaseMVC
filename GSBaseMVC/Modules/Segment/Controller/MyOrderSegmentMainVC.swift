//
//  MyOrderSegmentMainVC.swift
//  GSBaseMVC
//
//  Created by Gati on 30/01/20.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import UIKit
import SJSegmentedScrollView

class MyOrderSegmentMainVC: UIViewController {
    //MARK:- IBOutlets
    @IBOutlet weak var viewContainer : UIView!
    
    //MARK:- Variables
    var selectedSegment: SJSegmentTab?
    var segmentedViewController = SJSegmentedViewController()
    
    //MARK:- View Controller Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    //MARK:- Custom Methods
    func setUpView() {
        guard let firstViewController = GetViewController(StoryBoard: .Segment, Identifier: .PendingOrderSegment) as? PendingOrderSegmentVC else {
            return
        }
        firstViewController.title = StringConstant.MyOrder.pending
        
        guard let secondViewController = GetViewController(StoryBoard: .Segment, Identifier: .PastOrderSegment) as? PastOrderSegmentVC else {
            return
        }
        secondViewController.title = StringConstant.MyOrder.past
        
        segmentedViewController = SJSegmentedViewController(headerViewController: nil,
                                                            segmentControllers: [firstViewController,secondViewController])
        segmentedViewController.segmentViewHeight = 50.0
        segmentedViewController.selectedSegmentViewHeight = 3.0
        segmentedViewController.segmentTitleColor = .appGray
        segmentedViewController.selectedSegmentViewColor = .black
        segmentedViewController.segmentShadow = SJShadow.light()
        segmentedViewController.showsHorizontalScrollIndicator = false
        segmentedViewController.showsVerticalScrollIndicator = false
        segmentedViewController.segmentBounces = false
        segmentedViewController.delegate = self
        addChild(segmentedViewController)
        viewContainer.addSubview(segmentedViewController.view)
        segmentedViewController.view.frame = viewContainer.bounds
        segmentedViewController.didMove(toParent: self)
    }
}

//MARK:- SJSegmented Delegate
extension MyOrderSegmentMainVC: SJSegmentedViewControllerDelegate {
    
    func didMoveToPage(_ controller: UIViewController, segment: SJSegmentTab?, index: Int) {
        if selectedSegment != nil {
            selectedSegment?.titleColor(.lightGray)
        }
        
        if segmentedViewController.segments.count > 0 {
            selectedSegment = segmentedViewController.segments[index]
            selectedSegment?.titleColor(.black)
        }
    }
}
