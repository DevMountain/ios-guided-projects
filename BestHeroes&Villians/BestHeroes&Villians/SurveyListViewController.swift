//
//  SurveyListViewController.swift
//  BestHeroes&Villians
//
//  Created by Christian Riboldi on 5/23/18.
//  Copyright © 2018 Christian Riboldi. All rights reserved.
//

import UIKit

class SurveyListViewController: UIViewController {

    //
    // MARK: - Initialization
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    //
    // MARK: - IBOutlets
    //
    @IBOutlet weak var tableView: UITableView!

}

extension SurveyListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
