//
//  DTStackViewController.swift
//  SwiftProject
//
//  Created by renxun on 2018/11/7.
//  Copyright © 2018 renxun. All rights reserved.
//

import UIKit

class DTStackViewController: DTBaseViewController {
    
    var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       title = "stackView"
        _layoutStackView()
    }
    
    
    func _layoutStackView() {
        
        view.addSubview(stackView)
        stackView.backgroundColor = UIColor.red
        stackView.axis = .horizontal //水平方向
        stackView.alignment = UIStackView.Alignment.fill
        stackView.spacing = 1
        stackView.distribution = UIStackView.Distribution.fillEqually

        stackView.snp.makeConstraints { (maker) in
            
            maker.left.right.equalToSuperview()
            maker.centerY.equalToSuperview()
            maker.height.equalTo(300)
        }
        
        for _ in 0..<3 {
           let button = UIButton(type: UIButton.ButtonType.custom)
            button.backgroundColor = UIColor.red
            stackView.addArrangedSubview(button)
        }
        

        
    }
    
    

}
