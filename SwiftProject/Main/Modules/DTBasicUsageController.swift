//
//  BasicUsageViewController.swift
//  SwiftProject
//
//  Created by renxun on 2018/9/30.
//  Copyright © 2018 renxun. All rights reserved.
//

import UIKit
import SnapKit

class DTBasicUsageController: DTBaseViewController {

    var adapter: LLTableViewAdapter?
    let tableView = UITableView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "基础"
        _initUI()
    }
    
    func _initUI() -> Void {
        
        view.addSubview(tableView)        
        tableView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.right.equalToSuperview()
            ConstraintMaker.bottom.equalTo(self.view).offset(-tabBarBottomMargin()-kTabbarHeight)
            ConstraintMaker.top.equalTo(self.view).offset(kNavigationHeightAndStatuBarHeight)        }
        adapter = LLTableViewAdapter(tableView: tableView)
        
        let section1 = adapter!.addNewSection()
        section1?.sectionTitle = "Swift4.2基础语法"
        
        let cell1 = _creatCell(section: section1! , text: "字符串和字符")
        let cell2 = _creatCell(section: section1! , text: "集合类型")
        let cell3 = _creatCell(section: section1! , text: "控制流")
        let cell4 = _creatCell(section: section1! , text: "函数")
        let cell5 = _creatCell(section: section1! , text: "闭包")
        let cell6 = _creatCell(section: section1! , text: "枚举")
        let cell7 = _creatCell(section: section1! , text: "类和结构体")
        let cell9 = _creatCell(section: section1! , text: "属性")
        let cell10 = _creatCell(section: section1! , text: "方法")
        let cell11 = _creatCell(section: section1! , text: "下标")
        let cell12 = _creatCell(section: section1! , text: "继承")
        let cell13 = _creatCell(section: section1! , text: "初始化")
        let cell14 = _creatCell(section: section1! , text: "反初始化")
        let cell15 = _creatCell(section: section1! , text: "自动引用计数")
        let cell16 = _creatCell(section: section1! , text: "可选链")
        let cell17 = _creatCell(section: section1! , text: "错误处理")
        let cell18 = _creatCell(section: section1! , text: "类型转换")
        let cell19 = _creatCell(section: section1! , text: "内嵌类型")
        let cell20 = _creatCell(section: section1! , text: "扩展")
        let cell21 = _creatCell(section: section1! , text: "协议")
        let cell22 = _creatCell(section: section1! , text: "泛型")
        let cell23 = _creatCell(section: section1! , text: "内存安全性")
        let cell24 = _creatCell(section: section1! , text: "访问控制")
        let cell25 = _creatCell(section: section1! , text: "高级运算符")

        cell1.cellClick = {(cell,index) -> Void in
            let targetVC = DTStringViewController()
            targetVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(targetVC, animated: true)
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
        cell.cellHeight = 50
        cell.cellClazz = UITableViewCell.self
        return cell
    }
}
