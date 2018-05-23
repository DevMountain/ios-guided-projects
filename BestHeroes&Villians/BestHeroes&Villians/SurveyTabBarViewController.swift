//
//  SurveyTabBarViewController.swift
//  BestHeroes&Villians
//
//  Created by Christian Riboldi on 5/23/18.
//  Copyright © 2018 Christian Riboldi. All rights reserved.
//

import UIKit

class SurveyTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.unselectedItemTintColor = SurveyViewController.Constants.villianColor
    }

}
