//
//  DTStringViewController.swift
//  SwiftProject
//
//  Created by renxun on 2018/10/9.
//  Copyright © 2018 renxun. All rights reserved.
//

import UIKit
import PGSwiftExtensions

class DTStringViewController: DTBaseViewController {
    
    var adapter: LLTableViewAdapter?
    let tableView = UITableView.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "String"
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
        
        let section1 = adapter!.addNewSection()
        let cell1 = _creatCell(section: section1! , text: "初始化一个String")
        cell1.cellClick = {(cell,index) -> Void in
            let someString = "Some string literal value 💰"
            print(someString)
        }
        
        let cell2 = _creatCell(section: section1! , text: "初始化一个多行String")
        cell2.cellClick = {(cell,index) -> Void in
            let moreLineString = """
                多行文本
                自定义换行显示
                ......
                """
            print(moreLineString)
        }
        
        let cell3 = _creatCell(section: section1! , text: "多行文本带转义")
        cell3.cellClick = {(cell,index) -> Void in
            let _ = """
                多行文本 \"""
                自定义换行显示
                ......
                """
            let _ = """
                多行文本\"\"\"
                自定义换行显示
                ......
                """
        }
        
        let cell4 = _creatCell(section: section1! , text: "初始化一个空字符串")
        cell4.cellClick = {(cell,index) -> Void in
            let emptyString = ""
            let anotherEmptyString = String()
            print(emptyString,anotherEmptyString)
        }

        let cell5 = _creatCell(section: section1! , text: "确认一个 String值是否为空")
        cell5.cellClick = {(cell,index) -> Void in
            let emptyString = ""
            if emptyString.isEmpty {
                print("emptyString字符串为空")
            }
            
            let originStr = String()
            if originStr.isEmpty {
                print("originStr字符串为空")
            }
        }
        }
    
    func _creatCell(section: LLTableSection<LLBaseCell<AnyObject>, LLBaseCell<AnyObject>, LLBaseCell<AnyObject>>,text: String ) -> LLTableCell<AnyObject> {
        let cell = section.buildAddCell() as! LLTableCell
        cell.text = text
        cell.cellHeight = 50
        cell.cellClazz = UITableViewCell.self
        return cell
    }
    
}
