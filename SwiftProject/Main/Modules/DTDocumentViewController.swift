//
//  DTDocumentController.swfit
//  SwiftProject
//
//  Created by renxun on 2018/9/30.
//  Copyright © 2018 renxun. All rights reserved.
//

import UIKit

class DTDocumentController: DTBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.title = "收集的资料"
          configDemoTableView()

    }
    
    
    override func _demoCode() {
        
        let section1 = adapter!.addNewSection()!
        let pushClosure = {(urlString: String) -> Void in
            let coverUrl = urlString.urlEncoded()
            let webVC = DTReadWebController();
            if let url = URL.init(string: coverUrl) {
                webVC.url = url;
                self.rt_navigationController?.pushViewController(webVC, animated: true, complete: nil)
            }
        }
        
        AdapterCellUtil.creatCell(section: section1, text: "Self 与 self 的区别", needSeparator: true) { (cell,indexPath) in
            let urlS = "https://www.jianshu.com/p/5059d2993509"
            pushClosure(urlS)
        }
        
        AdapterCellUtil.creatCell(section: section1, text: "让Swift代码更美观 闭包的简写参数 $0 (需要翻墙)", needSeparator: true) { (cell,indexPath) in
            let urlS = "https://medium.com/@yesleon/如何讓-ios-程式碼更美觀-物件的設定-f6e41c64c6d6"
            pushClosure(urlS)
        }
        
        AdapterCellUtil.creatCell(section: section1, text: "Swift 中defer的使用", needSeparator: true) { (cell,indexPath) in
            pushClosure("https://www.jianshu.com/p/a71d87d92459")
        }
        
        AdapterCellUtil.creatCell(section: section1, text: "Swift 4.0: Codable", needSeparator: true) { (cell,indexPath) in
            //pushClosure(DTFunctionController())
            pushClosure("https://www.jianshu.com/p/febdd25ae525")
        }
        
    }

}
