
//
//  CreateScopepPageViewController.swift
//  NanoChallenge1
//
//  Created by Ricky on 26/04/22.
//

import Foundation


import UIKit

protocol protocolCreateScope: AnyObject{
    func insertData(scopeName : String, scopeImage: String)
}
class CreateScopePageViewController: UIViewController, protocolImageChoose {
    
    
    weak var delegate: protocolCreateScope?
    var name: String = ""
    @IBOutlet weak var nameInsert: UITextField!
    var imgName: String = ""
    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        nameInsert.text = ""
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func pressSave(_ sender: Any) {
        
        if imgName == ""{
            displayAlert(title: "image null", body: "choose your image", isDisplayDetail: true)
        }else if name == ""{
            displayAlert(title: "name null", body: "insert catogory name", isDisplayDetail: true)
        }else{
            self.dismiss(animated: true){
                
                self.delegate?.insertData(scopeName: self.name, scopeImage: self.imgName)
            }
        }
        
    }
    
    @IBAction func nameChanged(_ sender: Any) {
        name = nameInsert.text ?? ""
    }
    
    
    func insertImage(img: String) {
        imgView.image = UIImage(systemName: img)
        imgName = img
    }
    
    @IBAction func choosePressed(_ sender: Any) {
        performSegue(withIdentifier: "imgSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "imgSegue"{
            let vc = segue.destination as? ImageChooseViewController
            vc?.delegate = self
        }
    }
    
    func displayAlert(title: String, body: String, isDisplayDetail: Bool) {
        let alert = UIAlertController.init(title: title, message: body, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction.init(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
}
