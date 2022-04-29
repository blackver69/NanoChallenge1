//
//  CreateMyGoalsPageViewController.swift
//  NanoChallenge1
//
//  Created by Ricky on 26/04/22.
//

import Foundation
import UIKit


protocol protocolCreateMyGoals: AnyObject{
    func insertData(goalName: String, goalTime: String, goalDuration: String, taskList: [TaskModel], goalImage : String)
}


class CreateMyGoalsPageViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, protocolImageChoose {
    
    
    
    
    @IBOutlet weak var imgButton: UIButton!
    
    @IBOutlet weak var imageGoals: UIImageView!
    @IBOutlet weak var enterDuration: UITextField!
    @IBOutlet weak var enterName: UITextField!
    @IBOutlet weak var timeGoal: UIPickerView!
    
    @IBOutlet weak var warningNumber: UILabel!
    
    weak var delegate: protocolCreateMyGoals?
    var img : String = ""
    let date: [String] = [
        "Days",
        "Months",
        "Years"
    ]
    var dateChosen: String = "Days"
    var durationData : String = ""
    var nameData : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        timeGoal.delegate = self
        
        timeGoal.dataSource = self
        
        enterName.text = ""
        enterDuration.text = ""
        
        // Do any additional setup after loading the view.
    }


    @IBAction func pressCancel(_ sender: Any) {
        self.dismiss(animated: true){
            
        }
    }
    @IBAction func pressSave(_ sender: Any) {
        
        if self.nameData == ""{
            displayAlert(title: "name null", body: "insert your goal name", isDisplayDetail: true)
        }else if durationData == ""{
            displayAlert(title: "duration null", body: "insert your times", isDisplayDetail: true)
        }else if self.img == ""{
            displayAlert(title: "image null", body: "choose your image", isDisplayDetail: true)
        }else{
            self.dismiss(animated: true){
                self.delegate?.insertData(goalName: self.nameData, goalTime: self.durationData, goalDuration: self.dateChosen , taskList: [], goalImage: self.img)
            }
        }
        
        
    }
    
    
    @IBAction func nameChanged(_ sender: Any) {
        nameData = enterName.text ?? ""
    }
    
    @IBAction func durationChanged(_ sender: Any) {
        if let duration = enterDuration.text{
            if let warn = numValidate(duration){
                warningNumber.text = warn
                
            }else{
                warningNumber.text = ""
                durationData = duration
                
            }
            
        }
    }
    
    //number validate
    
    func numValidate(_ num: String)-> String?{
        
        let regExpression = ".*[0-9].*"
        
        let check = NSPredicate(format: "SELF MATCHES %@", regExpression)
        if(!check.evaluate(with: num)){
            return "Must Be Number"
        }
        return nil
    }
    
    
    
    //picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return date.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return date[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dateChosen = date[row]
        timeGoal.layer.cornerRadius = 2
        timeGoal.layer.borderWidth = 1
        timeGoal.layer.borderColor = UIColor.green.cgColor
        timeGoal.resignFirstResponder()
    }
    
    
    
    func insertImage(img: String) {
        self.img = img
        imageGoals.image = UIImage(systemName: self.img)
        
    }
    @IBAction func buttonPressed(_ sender: Any) {
        
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

