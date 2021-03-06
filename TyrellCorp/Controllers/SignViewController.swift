//
//  ViewController.swift
//  TyrellCorp
//
//  Created by Francesco Maria Moneta (BFS EUROPE) on 23/04/2019.
//  Copyright © 2019 wipro.com. All rights reserved.
//

import UIKit
import WebKit

class SignViewController: UIViewController, WKNavigationDelegate {
    
    var currentUser : UserData?
    
    var webView : WKWebView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let config = WKWebViewConfiguration()               // object that holds configuration for the webview
        let userContentController = WKUserContentController() // object that enables js to swift communication
        
        userContentController.add(self, name: "signin")
        userContentController.add(self, name: "signup")
        
        //add the js handler to config and config to webview
        config.userContentController = userContentController
        webView = WKWebView(frame: .zero, configuration: config)
        
        webView.navigationDelegate = self
        webView.uiDelegate = self
        
        if let url = Bundle.main.url(forResource: "sign", withExtension: "html"){
            webView.load(URLRequest(url: url)) //navigates to the specified page
            webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
            view = webView
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMainMenu"{
            let nextVC = segue.destination as! MainMenuViewController
            nextVC.userData = currentUser!
        }
    }
}



extension SignViewController: WKUIDelegate{
    
    // TO DISPLAY ALERTS
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let title = NSLocalizedString("OK", comment: "OK Button")
        let ok = UIAlertAction(title: title, style: .default) { (action: UIAlertAction) -> Void in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(ok)
        present(alert, animated: true)
        completionHandler()
    }
}


extension SignViewController: WKScriptMessageHandler {
    //handles the messages coming from Javascript

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "signin" {
            print("in signin")
            //message body will contain email and password
            let dict = message.body as! [String: AnyObject]
            let email = dict["email"] as! String
            let password = dict["password"] as! String
            print(email)
            print(password)
            guard let savedData = loadUserData(key: email) else{
                webView.evaluateJavaScript("alert('Wrong email or password')", completionHandler: nil)
                return
            }
            if savedData.password == password{
                print("granting access")
                currentUser = UserData(email: email, password: password, statusCode: savedData.statusCode)
                //grant access
                
                performSegue(withIdentifier: "toMainMenu", sender: self)
            }
            else{
                webView.evaluateJavaScript("alert('Wrong email or password')", completionHandler: nil)
            }
        }
        
        else if message.name == "signup" {
            //do signup
            let dict = message.body as! [String: AnyObject]
            let email = dict["email"] as! String
            let password = dict["password"] as! String
            
            currentUser = UserData(email: email, password: password, statusCode: NEW_HIRE)
            
            saveUserData(userData: currentUser!)
            self.performSegue(withIdentifier: "toMainMenu", sender: self)
        }
    }
}
