//
//  ViewController.swift
//  PictureInPictureDemo
//
//  Created by Prajakta Kulkarni on 11/9/16.
//  Copyright © 2016 Prajakta Kulkarni. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import WebKit

class ViewController: UIViewController,AVPlayerViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let webview:WKWebView = WKWebView(frame: self.view.frame)
//        webview.load(URLRequest(url: URL(string: "https://www.youtube.com/watch?v=VC89P9GRFwQ")!))
//        self.view.addSubview(webview)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as?
        AVPlayerViewController
        let url = Bundle.main.url(forResource: "videoplayback", withExtension: "mp4")
            //NSURL(string:"https://youtu.be/raSbqN0mWZk")
        
        destination!.delegate = self
        
        if let movieURL = url {
            destination!.player = AVPlayer(url: movieURL as URL)
        }

    }
    func playerViewController(_ playerViewController: AVPlayerViewController,
                              restoreUserInterfaceForPictureInPictureStopWithCompletionHandler
        completionHandler: @escaping (Bool) -> Void) {
        
        let currentViewController = navigationController?.visibleViewController
        
        if currentViewController != playerViewController {
            if let topViewController =
                navigationController?.topViewController {
                
                topViewController.present(playerViewController,
                                                        animated: true, completion: {()
                                                            completionHandler(true)
                })
            }
        }
    }


}

