//
//  ProfileSegmentMainVC.swift
//  GSBaseMVC
//
//  Created by Gati on 30/01/20.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import UIKit
import SJSegmentedScrollView

class ProfileSegmentMainVC: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet weak var viewContainer : UIView!
    
    //MARK:- Variables
    var selectedSegment: SJSegmentTab?
    var segmentedViewController = SJSegmentedViewController()
    
    //MARK:- View Controller Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    //MARK:- Custom Methods
    func setUpView() {
        
        guard let headerViewController = GetViewController(StoryBoard: .Segment, Identifier: .ProfileSegmentHeader) else {
            return
        }
        
        guard let firstViewController = GetViewController(StoryBoard: .Segment, Identifier: .ProfileFollowingSegment) as? ProfileFollowingSegmentVC else {
            return
        }
        firstViewController.title = StringConstant.Profile.following
        
        guard let secondViewController = GetViewController(StoryBoard: .Segment, Identifier: .ProfileFollowerSegment) as? ProfileFollowerSegmentVC else {
            return
        }
        secondViewController.title = StringConstant.Profile.followers
        
        segmentedViewController = SJSegmentedViewController(headerViewController: headerViewController,
                                                            segmentControllers: [firstViewController,secondViewController])
        
        segmentedViewController.segmentViewHeight = 50.0
        segmentedViewController.segmentBackgroundColor = .appTextBlack
        segmentedViewController.segmentSelectedTitleColor = .white
        segmentedViewController.headerViewHeight = 200
        segmentedViewController.headerViewOffsetHeight = 0
        /*//Keep the headerViewOffsetHeight equal to headerViewHeight, if you want header stick at the top and does not scroll view tableview/scrollview
        segmentedViewController.headerViewOffsetHeight = 200*/
        segmentedViewController.selectedSegmentViewHeight = 3.0
        segmentedViewController.segmentTitleColor = .appTextDarkGray
        segmentedViewController.selectedSegmentViewColor = .white
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
extension ProfileSegmentMainVC: SJSegmentedViewControllerDelegate {
    
    func didMoveToPage(_ controller: UIViewController, segment: SJSegmentTab?, index: Int) {
        if selectedSegment != nil {
            selectedSegment?.titleColor(.appTextLightGray)
        }
        
        if segmentedViewController.segments.count > 0 {
            selectedSegment = segmentedViewController.segments[index]
            selectedSegment?.titleColor(.white)
        }
    }
}
