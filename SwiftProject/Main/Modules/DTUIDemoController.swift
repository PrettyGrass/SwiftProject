//
//  DTUIDemoController.swift
//  SwiftProject
//
//  Created by renxun on 2018/10/24.
//  Copyright © 2018 renxun. All rights reserved.
//

import UIKit

class DTUIDemoController: DTBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configDemoTableView()

    }
    
    override func _demoCode() {
        
        let pushClosure = {(targetVC:UIViewController) -> Void in
            self.rt_navigationController?.pushViewController(targetVC, animated: true, complete: nil)
        }
        //分类切换滚动视图
        let section1 = adapter!.addNewSection()!
        AdapterCellUtil.creatCell(section: section1, text: "分类切换滚动视图例子", needSeparator: true) { (cell,indexPath) in
            pushClosure(DTJXCategoryViewController())
            
            
        }
        
    }
}
