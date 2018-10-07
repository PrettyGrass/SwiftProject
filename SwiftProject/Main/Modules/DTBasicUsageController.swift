//
//  BasicUsageViewController.swift
//  SwiftProject
//
//  Created by renxun on 2018/9/30.
//  Copyright © 2018 renxun. All rights reserved.
//

import UIKit

class DTBasicUsageController: DTBaseViewController {

    var adapter: LLTableViewAdapter?
    let tableView = UITableView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _initUI()
    }
    
    func _initUI() -> Void {
        
        view.addSubview(tableView)
        tableView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight)
        adapter = LLTableViewAdapter(tableView: tableView)
        
        let section1 = adapter!.addNewSection()
        let cell1 = _creatCell(section: section1! , text: "基础操作符")
        let cell2 = _creatCell(section: section1! , text: "函数")
        let cell3 = _creatCell(section: section1! , text: "集合")
        
        
        cell1.cellClick = {(cell,index) -> Void in
            print(cell);
            print(index)
        }
        cell2.cellClick = {(cell,index) -> Void in
            print(cell);
            print(index)
        }
        cell3.cellClick = {(cell,index) -> Void in
            print(cell);
            print(index)
        }

        adapter?.reloadData()
    }
    
    func _creatCell(section: LLTableSection<LLBaseCell<AnyObject>, LLBaseCell<AnyObject>, LLBaseCell<AnyObject>>,text: String ) -> LLTableCell<AnyObject> {
        
        let cell = section.buildAddCell() as! LLTableCell
        cell.text = text
        cell.cellHeight = 45
        cell.cellClazz = UITableViewCell.self
        return cell
    }
}
