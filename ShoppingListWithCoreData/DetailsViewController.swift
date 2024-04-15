//
//  DetailsViewController.swift
//  ShoppingListWithCoreData
//
//  Created by Aydın Kutlu on 26.03.2024.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var itemSize: UITextField!
    @IBOutlet weak var itemPrice:UITextField!
    @IBOutlet weak var item: UITextField!
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Klavye kapatmak için..
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        let imageGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        view.addGestureRecognizer(imageGestureRecognizer)
    }
    
    @objc func closeKeyboard(){
        view.endEditing(true)
    }
    
    @objc func selectImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        image.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func saveClicked(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let shopping = NSEntityDescription.insertNewObject(forEntityName: "Shopping", into: context)
        shopping.setValue(item.text!, forKey: "itemName")
        shopping.setValue(itemSize.text!, forKey: "itemSize")
        
        if let itemPrice = Int(itemPrice.text!) {
            shopping.setValue(itemPrice, forKey: "itemPrice")
        }
        
        shopping.setValue(UUID(), forKey: "id")
        let data = image.image?.jpegData(compressionQuality: 0.5)
        shopping.setValue(data, forKey: "image")
        
        do{
            try context.save()
                print("Successfull")
            }
            catch {
                print("Failed")
            }
        }
    }
    
    


