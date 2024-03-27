//
//  DetailsViewController.swift
//  ShoppingListWithCoreData
//
//  Created by Aydın Kutlu on 26.03.2024.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var itemSize: UITextField!
    @IBOutlet weak var itemPrice:UITextField!
    @IBOutlet weak var item: UITextField!
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Klavye kapatmak için..
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    @IBAction func saveClicked(_ sender: Any) {
    }
    
    @objc func closeKeyboard(){
        view.endEditing(true)
    }

}
