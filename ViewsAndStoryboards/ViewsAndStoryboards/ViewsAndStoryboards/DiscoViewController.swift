//
//  DiscoViewController.swift
//  ViewsAndStoryboards
//
//  Created by James Pacheco on 5/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class DiscoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func discoButonTapped(sender: AnyObject) {
        self.view.backgroundColor = .redColor()
    }
    
    @IBAction func discoButtonTappedOutside(sender: AnyObject) {
        self.view.backgroundColor = .blueColor()
    }
    
    @IBAction func discoButtonTappedEnter(sender: AnyObject) {
        self.view.backgroundColor = .purpleColor()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
