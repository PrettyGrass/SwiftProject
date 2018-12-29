//
//  DTReadWebController.swift
//  SwiftProject
//
//  Created by renxun on 2018/12/29.
//  Copyright © 2018 renxun. All rights reserved.
//

import UIKit

class DTReadWebController: UIViewController {
    
    var url: URL?
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.configWebView()
    }
    
    private func configWebView() -> Void {
        
        guard let url = url else {
            return
        }
        let request = URLRequest.init(url: url)
        self.webView.loadRequest(request)
    }



}
