//
//  AdvancedViewController.swift
//  SwiftProject
//
//  Created by renxun on 2018/9/30.
//  Copyright © 2018 renxun. All rights reserved.
//

import UIKit

class DTAdvancedController: DTBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "进阶"
        configDemoTableView()

    }
    
    override func _demoCode() {
        let section1 = adapter!.addNewSection()!
        
        let pushClosure = {(targetVC:UIViewController) -> Void in
            self.rt_navigationController?.pushViewController(targetVC, animated: true, complete: nil)
        }
        
        AdapterCellUtil.creatCell(section: section1, text: "UIStackView的使用", needSeparator: true) { (cell,indexPath) in
            pushClosure(DTStackViewController())
        }
        AdapterCellUtil.creatCell(section: section1, text: "xx", needSeparator: true) { (cell,indexPath) in
            //pushClosure(DTGatherDemoController())
        }
        AdapterCellUtil.creatCell(section: section1, text: "xx", needSeparator: true) { (cell,indexPath) in
            //pushClosure(DTControlFlowController())
        }
        AdapterCellUtil.creatCell(section: section1, text: "xx", needSeparator: true) { (cell,indexPath) in
            //pushClosure(DTFunctionController())
        }

    }
    
}
