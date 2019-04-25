//
//  testViewController.swift
//  TyrellCorp
//
//  Created by Francesco Maria Moneta (BFS EUROPE) on 24/04/2019.
//  Copyright © 2019 wipro.com. All rights reserved.
//

import UIKit
import WebKit


class TestViewController : UIViewController, WKNavigationDelegate {
    
    var webView : WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let config = WKWebViewConfiguration()               // object that holds configuration for the webview
        let userContentController = WKUserContentController()
        
        userContentController.add(self, name: "sendResult")
        
        config.userContentController = userContentController
        webView = WKWebView(frame: .zero, configuration: config)
        
        webView.navigationDelegate = self
        webView.uiDelegate = self
        
        if let url = Bundle.main.url(forResource: "test", withExtension: "html"){
            webView.load(URLRequest(url: url)) //navigates to the specified page
            webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
            view = webView
        }
        
    }
}


extension TestViewController: WKUIDelegate{

}
extension TestViewController : WKScriptMessageHandler{
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "sendResult"{
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
}
