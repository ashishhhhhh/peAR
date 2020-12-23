//
//  ViewController.swift
//  pearApplication
//
//  Created by TARUN on 12/22/20.
//  Copyright © 2020 ashish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainTableView: UITableView!
    private var viewModel = restaurentViewmodel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    loadRestaurentData()
    }
    
    func loadRestaurentData() {
        viewModel.LoadDataToScreen { [weak self] in
            self?.mainTableView.dataSource = self
            self?.mainTableView.reloadData()
        }
    }


}

extension ViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! restaurentTableViewCell
        
        let restaurentNameSake = viewModel.cellForRow(indexPath: indexPath)
        cell.setCellWithValue(restaurentNameSake)
        return cell
    }
}

