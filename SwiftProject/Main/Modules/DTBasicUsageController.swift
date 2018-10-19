//
//  BasicUsageViewController.swift
//  SwiftProject
//
//  Created by renxun on 2018/9/30.
//  Copyright © 2018 renxun. All rights reserved.
//

import UIKit
import SnapKit
import PGSwiftExtensions

class DTBasicUsageController: DTBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "基础"
        super.configDemoTableView()
    }

    override func _demoCode() {
        let section1 = adapter!.addNewSection()!

        let pushClosure = {(targetVC:UIViewController) -> Void in
            self.rt_navigationController?.pushViewController(targetVC, animated: true, complete: nil)
        }
        
        AdapterCellUtil.creatCell(section: section1, text: "字符串和字符", needSeparator: true) { (cell,indexPath) in
            pushClosure(DTStringDemoController())
        }
        AdapterCellUtil.creatCell(section: section1, text: "集合类型", needSeparator: true) { (cell,indexPath) in
            pushClosure(DTGatherDemoController())
        }
        AdapterCellUtil.creatCell(section: section1, text: "控制流", needSeparator: true) { (cell,indexPath) in
            pushClosure(DTControlFlowController())
        }
        AdapterCellUtil.creatCell(section: section1, text: "函数", needSeparator: true) { (cell,indexPath) in
            pushClosure(DTFunctionController())
        }
        AdapterCellUtil.creatCell(section: section1, text: "闭包", needSeparator: true) { (cell,indexPath) in
            pushClosure(DTClosuresController())
        }
        AdapterCellUtil.creatCell(section: section1, text: "枚举", needSeparator: true) { (cell,indexPath) in
            
        }
        AdapterCellUtil.creatCell(section: section1, text: "类和结构体", needSeparator: true) { (cell,indexPath) in
            
        }
        AdapterCellUtil.creatCell(section: section1, text: "属性", needSeparator: true) { (cell,indexPath) in
            
        }
        AdapterCellUtil.creatCell(section: section1, text: "方法", needSeparator: true) { (cell,indexPath) in
            
        }
        AdapterCellUtil.creatCell(section: section1, text: "下标", needSeparator: true) { (cell,indexPath) in
            
        }
        AdapterCellUtil.creatCell(section: section1, text: "继承", needSeparator: true) { (cell,indexPath) in
            
        }
        AdapterCellUtil.creatCell(section: section1, text: "初始化", needSeparator: true) { (cell,indexPath) in
            
        }
        AdapterCellUtil.creatCell(section: section1, text: "反初始化", needSeparator: true) { (cell,indexPath) in
            
        }
        AdapterCellUtil.creatCell(section: section1, text: "自动引用计数", needSeparator: true) { (cell,indexPath) in
            
        }
        AdapterCellUtil.creatCell(section: section1, text: "可选链", needSeparator: true) { (cell,indexPath) in
            
        }
        AdapterCellUtil.creatCell(section: section1, text: "错误处理", needSeparator: true) { (cell,indexPath) in
            
        }
        AdapterCellUtil.creatCell(section: section1, text: "类型转换", needSeparator: true) { (cell,indexPath) in
            
        }
        AdapterCellUtil.creatCell(section: section1, text: "内嵌类型", needSeparator: true) { (cell,indexPath) in
            
        }
        AdapterCellUtil.creatCell(section: section1, text: "扩展", needSeparator: true) { (cell,indexPath) in
            
        }
        AdapterCellUtil.creatCell(section: section1, text: "协议", needSeparator: true) { (cell,indexPath) in
            
        }
        AdapterCellUtil.creatCell(section: section1, text: "泛型", needSeparator: true) { (cell,indexPath) in
            
        }
        AdapterCellUtil.creatCell(section: section1, text: "内存安全性", needSeparator: true) { (cell,indexPath) in
            
        }
        AdapterCellUtil.creatCell(section: section1, text: "访问控制", needSeparator: true) { (cell,indexPath) in
            
        }
        AdapterCellUtil.creatCell(section: section1, text: "高级运算符", needSeparator: true) { (cell,indexPath) in
            
        }
        adapter?.reloadData()
    }
}
