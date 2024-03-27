//
//  ViewController.swift
//  ShoppingListWithCoreData
//
//  Created by Aydın Kutlu on 25.03.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addClicked))
    }

    @objc func addClicked(){
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
}

