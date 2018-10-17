//
//  DTBaseViewController.swift
//  SwiftProject
//
//  Created by renxun on 2018/9/30.
//  Copyright © 2018 renxun. All rights reserved.
//

import UIKit

class DTBaseViewController: UIViewController {
    var adapter: LLTableViewAdapter?
    let tableView = UITableView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white        
    }
    
    func configDemoTableView() -> Void {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.right.equalToSuperview()
            ConstraintMaker.bottom.equalTo(self.view).offset(-safeBottomMargin())
            ConstraintMaker.top.equalTo(self.view).offset(kSafeTopMargin)
        }
        adapter = LLTableViewAdapter(tableView: tableView)
        _demoCode()
    }
    
    func _demoCode()-> Void {
            
    }
}
