//
//  SwiftFormat.swift
//  SwiftProject
//
//  Created by ylin.yang on 2019/3/31.
//  Copyright © 2019 renxun. All rights reserved.
//

import Foundation

class SwiftFormat: Any {
    var name: String
    init() {
        name = ""
    }

    
    
    
    
    
    /// 多余的换行
    func emptyBraces() {
        if false {
            // foo
            
        }
         else {
            // bar
        }
        
        if false {
            // foo
            
        } else {
            // bar
        }
    }
    /// 连续的方法
    func emptyBraces1() {
        let dd = SwiftFormat()
        dd . bar()
        dd .        bar()
        let _ = 1+2
    }
    
    /// 方法体内未使用的参数
    func func1(name: String,
               name1: String,name2: String) {
        
        let f = [1, 1,3]
        func2(name: name)
        
    }
    
    /// 方法体内未使用的参数
    func func2(name: String) {
        
    }
    
    func foo() {
        // foo
    }
    // MARK: bar
    func bar() {
        // bar
    }
}

