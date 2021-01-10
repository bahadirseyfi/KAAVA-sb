//
//  MapViewController.swift
//  KAAVA-sb
//
//  Created by bahadir on 22.12.2020.
//

import UIKit
import WebKit
class MapViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var backBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //backBtn.applyDesign(color: UIColor.init(red: 2/255, green: 173/255, blue: 181/255, alpha: 1), cornerRadius: 25)
        loadSite()
        
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func loadSite(){
        guard let URL = URL(string: "https://kaava.vercel.app/map")
            else { return }
        webView.load( URLRequest(url: URL) )
        webView.navigationDelegate = self
    }

    
}
