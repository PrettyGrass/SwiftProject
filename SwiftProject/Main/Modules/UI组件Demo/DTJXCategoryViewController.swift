//
//  DTJXCategoryViewController.swift
//  SwiftProject
//
//  Created by renxun on 2018/10/24.
//  Copyright © 2018 renxun. All rights reserved.
//

import UIKit
import PGSwiftExtensions
import SnapKit

class DTJXCategoryViewController: UIViewController {
    
    var categoryView :JXCategoryTitleView?
    var indicatorImageView :JXCategoryIndicatorImageView?
    
   lazy var scrollerView :UIScrollView = {
    
       let scroller = UIScrollView()
        scroller.isPagingEnabled = true
        scroller.bounces = false
        view.addSubview(scroller)
        return scroller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        title = "JXCategoryView的使用"
        
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Group 2"), for: UIControl.State.normal)
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.height.width.equalTo(56)
            make.top.equalTo(view).offset(kSafeTopMargin)
        }
        
        categoryView = JXCategoryTitleView(frame: CGRect(x: 0, y: kSafeTopMargin, width: kScreenWidth - 56, height: 56))
        categoryView?.delegate = self
        categoryView?.titleSelectedFont = UIFont.systemFont(ofSize: 16)
        categoryView?.titleFont = UIFont.systemFont(ofSize: 14)
        categoryView?.titleColor = UIColor.color(hexString: "#A9A9A9")
        categoryView?.titleSelectedColor = UIColor.color(hexString: "#414141")
        categoryView?.titles = ["Popular", "Thailand", "Tikitok", "Funny" , "Land" ,"HD","Pore"]
        categoryView?.defaultSelectedIndex = 0
        
        let indicatorImage = UIImage(named: "Triangle")
        indicatorImageView = JXCategoryIndicatorImageView()
        indicatorImageView?.indicatorImageView.image = indicatorImage
        indicatorImageView?.indicatorImageViewSize = indicatorImage?.size ?? CGSize.zero
        categoryView?.indicators = [indicatorImageView] as! [UIView & JXCategoryIndicatorProtocol]
        view.addSubview(categoryView!)
        scrollerView.backgroundColor = UIColor.red
        scrollerView.snp.makeConstraints { (make) in
            make.top.equalTo(button.snp.bottom)
            make.bottom.equalTo(view).offset(safeBottomMargin())
            make.left.right.equalTo(view)
        }
        scrollerView.contentSize =  CGSize(width: 7.0 * kScreenWidth, height: kScreenHeight - kSafeTopMargin - 56 - safeBottomMargin())
        categoryView?.contentScrollView = scrollerView
        
//        let tableView = UITableView(frame: CGRect(x: 0, y: 44, width: kScreenWidth, height: kScreenHeight - 44))
//        tableView.backgroundColor = .red
//        categoryView?.contentScrollView = tableView;
        self.configNav()

    }
    
    func configNav() {
        
       let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.setTitle("刷新数据源", for: UIControl.State.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn.addTarget(self, action: #selector(addData), for: UIControl.Event.touchUpInside)
        btn.frame = CGRect(x: 0, y: 140, width: 100, height: 50)
        btn.backgroundColor = UIColor.orange
        view.addSubview(btn)
        view.bringSubviewToFront(btn)
    }
    
    @objc func addData() -> Void {
        print("addData")
        let titleArr = ["Popular", "Thailand"]
        categoryView?.titles = titleArr
        scrollerView.contentSize = CGSize(width: kScreenWidth * CGFloat(titleArr.count), height:  kScreenHeight - kSafeTopMargin - 56 - safeBottomMargin())
        self.categoryView?.reloadData()
    }
}

extension DTJXCategoryViewController: JXCategoryViewDelegate {
    
    func categoryView(_ categoryView: JXCategoryBaseView!, didClickSelectedItemAt index: Int) {
        print("categoryView",index)
    }
    func categoryView(_ categoryView: JXCategoryBaseView!, didSelectedItemAt index: Int) {
        print("categoryView",index)

    }
    func categoryView(_ categoryView: JXCategoryBaseView!, didScrollSelectedItemAt index: Int) {
        print("categoryView",index)

    }
    
}
