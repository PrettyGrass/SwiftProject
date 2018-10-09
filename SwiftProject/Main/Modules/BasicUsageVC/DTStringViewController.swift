//
//  DTStringViewController.swift
//  SwiftProject
//
//  Created by renxun on 2018/10/9.
//  Copyright © 2018 renxun. All rights reserved.
//

import UIKit

class DTStringViewController: DTBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Swift 的字符串用 String类型来表示
        
        //1.初始化一个String
        let someString = "Some string literal value 💰"
        print("初始化一个String",someString)
        //2.多行String
        let _ = """
                多行文本
                自定义换行显示
                ......
                """
        
    }
    
}
