//
//  WebViewController.swift
//  SwiftProject
//
//  Created by ylin on 2019/1/3.
//  Copyright © 2019 renxun. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var fps: UILabel!
    @IBOutlet weak var mem: UILabel!
    @IBOutlet weak var cpu: UILabel!
    @IBOutlet weak var continaer: UIView!
    
    var rect = CGRect(x: 0, y: 0, w: 200, h: 200)
    var addCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "UIWebView"
        
    }
    
    @IBAction func addWebViewAction(_ sender: Any) {
        
        rect.origin.x += 20
        rect.origin.y += 20
        let webView = UIWebView(frame: rect)
        
        if let url = Bundle.main.url(forResource: "webview", withExtension: "html") {
        //if let url = URL(string: "https://m.baidu.com") {
            webView.loadRequest(NSMutableURLRequest(url: url) as URLRequest)
            webView.backgroundColor = UIColor.clear
            webView.isOpaque = false
            self.continaer.addSubview(webView)
            self.addCount += 1
            updateView()
        }
    }
    
    func updateView() {
        self.fps.text = "数量: \(self.addCount) fps: \(0)"
    }
}
