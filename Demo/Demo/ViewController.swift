//
//  ViewController.swift
//  Demo
//
//  Created by Dark Bear on 17/07/17.
//  Copyright © 2017 Dark Bear. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    var startLocation: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.view == lblName {
                startLocation = touch.location(in: lblName)
            }
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.view == lblName {
                
                let pt = touch.previousLocation(in: lblName)
                let dx = pt.x - startLocation.x
                let dy = pt.y - startLocation.y
                
                let newCenter = CGPoint(x: lblName.center.x + dx, y: lblName.center.y + dy)
                
                //now put if condition for dragging in specific area
                
                let min_X = lblName.center.x + dx - lblName.frame.size.width/2.0;
                let max_X = lblName.center.x + dx + lblName.frame.size.width/2.0;
                let min_Y = lblName.center.y + dy - lblName.frame.size.height/2.0;
                let max_Y = lblName.center.y + dy + lblName.frame.size.height/2.0;
                
                if((min_X >= imageView.frame.origin.x && max_X <=  imageView.frame.origin.x +  imageView.frame.size.width) && (min_Y >=  imageView.frame.origin.y && max_Y <=  imageView.frame.origin.y +  imageView.frame.size.height))
                {
                    lblName.center = newCenter;
                }
            }
        }
    }
}

