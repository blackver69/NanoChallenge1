//
//  CreateTaskViewController.swift
//  NanoChallenge1
//
//  Created by Ricky on 27/04/22.
//

import Foundation
import UIKit
protocol protocolCreateTask: AnyObject{
    func insertData(taskName : String, taskImage: String)
}
class CreateTaskViewController: UIViewController , protocolImageChoose{
    
    
    
    
   
    weak var delegate: protocolCreateTask?
    var nameInput : String = ""
    var img : String = ""
    @IBOutlet weak var nameInsert: UITextField!
    @IBOutlet weak var imgTask: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func pressCancel(_ sender: Any) {
        self.dismiss(animated: true){
            
        }
    }
    @IBAction func pressSave(_ sender: Any) {
        
        if nameInput == ""{
            displayAlert(title: "name null", body: "insert your task name", isDisplayDetail: true)
        }else if self.img == ""{
            displayAlert(title: "image null", body: "choose your image", isDisplayDetail: true)
        }else{
            self.dismiss(animated: true){
                self.delegate?.insertData(taskName: self.nameInput, taskImage: self.img)
            }
        }
        
    }

   
    @IBAction func imgChoose(_ sender: Any) {
        performSegue(withIdentifier: "imgSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "imgSegue"{
            let vc = segue.destination as? ImageChooseViewController
            vc?.delegate = self
        }
    }
    func insertImage(img: String) {
        self.img = img
        imgTask.image = UIImage(systemName: img)
    }
    
    func displayAlert(title: String, body: String, isDisplayDetail: Bool) {
        let alert = UIAlertController.init(title: title, message: body, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction.init(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
  
    @IBAction func namePressed(_ sender: Any) {
        nameInput = nameInsert.text ?? ""
    }
}
