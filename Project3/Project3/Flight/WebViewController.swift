//
//  WebViewController.swift
//  Project3
//
//  Created by Anna Han on 12/5/20.
//

import UIKit
import WebKit
class WebViewController: UIViewController, UITextFieldDelegate, WKNavigationDelegate {

    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var forwardButton: UIButton!
    
    @IBOutlet weak var bookmarkButton: UIButton!
    
    @IBOutlet weak var urlTextField: UITextField!
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.navigationDelegate = self

        NotificationCenter.default.addObserver(self, selector: #selector(bookmarkSelected(notification:)), name: NSNotification.Name?(NSNotification.Name(rawValue: "bookmark")), object: nil)
    }
    
    @objc
    func bookmarkSelected(notification:Notification) {
        let bookmarkURL = notification.object as! String
        webView.load(URLRequest(url: URL(string: bookmarkURL)!))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let urlString = "https://www.google.com/travel/flights"
        
//        let urlString = "https://www.google.com/travel/flights?tfs=CBwQARoaagwIAhIIL20vMDk5dHkSCjIwMjAtMTItMjMaGhIKMjAyMC0xMi0yN3IMCAISCC9tLzA5OXR5cAGCAQsI____________AUABSAGYAQE&hl=en"
        
        if let url = URL(string: urlString){
            let urlRequest = URLRequest(url: url)
            webView.load(urlRequest)
        }
    }
    

    @IBAction func goBackTapped(_ sender: Any) {
        if( webView.canGoBack){
            webView.goBack()
        }
    }
    
    
    @IBAction func goForwardTapped(_ sender: Any) {
        if( webView.canGoForward ){
            webView.goForward()
        }
    }
    
    @IBAction func bookMarkTapped(_ sender: Any) {
        let bookmarksViewController = storyboard?.instantiateViewController(identifier: "BookmarksViewController")
        present(bookmarksViewController!, animated: true, completion: nil)
    }
    
    @IBAction func addBookmarkTapped(_ sender: Any) {
        let currentURL = webView.url?.absoluteString

        BookmarksController.bookmarkArray.append(currentURL!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let urlString = urlTextField.text
        let url = URL(string: urlString!)
        let urlRequest = URLRequest(url: url!)

        webView.load(urlRequest)

        textField.resignFirstResponder()
        return true
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backButton.isEnabled = webView.canGoBack
        forwardButton.isEnabled = webView.canGoForward
        urlTextField.text = webView.url?.absoluteString
    }
}
