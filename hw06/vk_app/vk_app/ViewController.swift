//
//  ViewController.swift
//  not_storyboard
//
//  Created by Dmitry An on 16/11/2023.
//

import UIKit
import WebKit

final class ViewController: UIViewController {
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: view.bounds)
        webView.navigationDelegate = self
        return webView
    }()

    private func loadObjects() {
        view.addSubview(webView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        loadObjects()
        
        //  !!!  AppCode.swift file is hidden from the git
        guard let url = URL(string: "https://oauth.vk.com/authorize?client_id=" + AppCode.appCode + "&redirect_url=https://oauth.vk.com/blank.html&scope=262150&display=mobile&response_type=token") else {
            return
        }
        webView.load(URLRequest(url: url))
    }
}


extension ViewController {
    func goToTabView() {
        let tabBarController = TabBarConstructor.run()
        tabBarController.modalPresentationStyle = .fullScreen
        self.addChild(tabBarController)
        view.addSubview(tabBarController.view)
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url,
              url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        let token = params[ "access_token" ]
        let userID = params[ "user_id" ]
        NetworkService.token = params[ "access_token" ]!
        NetworkService.userID = params[ "user_id" ]!
        print(token!)
        print(userID!)
        decisionHandler(.cancel)
        webView.removeFromSuperview()
        goToTabView()
    }
}

#Preview {
    ViewController()
}

