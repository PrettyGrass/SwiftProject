//
//  DTRootTabBarController.swift
//  SwiftProject
//
//  Created by renxun on 2018/9/30.
//  Copyright © 2018 renxun. All rights reserved.
//

import UIKit

class DTRootTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = UIColor.color(hexString: DTColor.mainStyleColor)
        addChildVcs()
    }
    
    private func addChildVcs() -> Void {

        let basicUsageVC = DTBasicUsageController()
        let advancedVC = DTAdvancedController()
        let documentVC = DTDocumentController()
    
        self.viewControllers = [basicUsageVC,advancedVC,documentVC];

        let titles = ["基础","进阶","文档"]
        let norImages = ["icon_tab_1","icon_tab_2","icon_tab_3"]
        let selImage = ["icon_tab_1_s","icon_tab_2_s","icon_tab_3_s"]
        
        for (index,vc) in (self.viewControllers?.enumerated())! {
            
            vc.tabBarItem.title = titles[index]
            vc.tabBarItem.image = UIImage.init(named: norImages[index])
            vc.tabBarItem.selectedImage = UIImage.init(named: selImage[index])
        }
    }
}

// MARK:- statusBar
extension DTRootTabBarController {
    open override var prefersStatusBarHidden: Bool {
        return self.selectedViewController?.prefersStatusBarHidden ?? false
    }
    open  override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.selectedViewController?.preferredStatusBarStyle ?? UIStatusBarStyle.default
    }
    open  override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return self.selectedViewController?.preferredStatusBarUpdateAnimation ?? UIStatusBarAnimation.slide
    }
    open override var shouldAutorotate: Bool {
        return self.selectedViewController?.shouldAutorotate ?? false
    }
    // MARK: - about keyboard orientation
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return self.selectedViewController?.supportedInterfaceOrientations ?? UIInterfaceOrientationMask.allButUpsideDown;
    }
    //返回最优先显示的屏幕方向
    open override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return self.selectedViewController?.preferredInterfaceOrientationForPresentation ?? UIInterfaceOrientation.portrait
    }
}

