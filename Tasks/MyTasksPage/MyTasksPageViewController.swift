//
//  MyTasksPageViewController.swift
//  NanoChallenge1
//
//  Created by Ricky on 26/04/22.
//

import Foundation
import UIKit

class MyTasksPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, protocolCreateTask {
    
    
    

    @IBOutlet weak var tasksTableView: UITableView!
    @IBOutlet weak var isFavorite: UIButton!
    var goalData : GoalModel!
    
    let cellSpacingHeight: CGFloat = 5
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasksTableView.dataSource = self
        tasksTableView.delegate = self
        
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        
        navigationItem.rightBarButtonItem = add
       
        
        // Do any additional setup after loading the view.
        title = "Your Goals"
        navigationItem.colourItem()
        tabBarController?.tabBar.isHidden = true
        
        isFavorite.tintColor = .red
        
        if goalData.getIsFavorite() == true{
            isFavorite.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }else{
            isFavorite.setImage(UIImage(systemName: "heart"), for: .normal)
        }
//        tasksTableView.frame.inset(by: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
    }
    
    //table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goalData.getTaskList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tasksTableView.dequeueReusableCell(withIdentifier: "TasksCell", for: indexPath)as? TaskTableViewCell else{
            fatalError()
        }
        
        let data =  goalData.getTaskList()
        
        let dataArr = data[indexPath.row]
        
        cell.imageTask.image = UIImage(systemName: dataArr.getTaskImage())
        cell.nameTask.text = dataArr.getTaskName()
        var icon: String = ""
        if(!dataArr.getTaskCheck()){
            icon = "clear"
        }else{
            icon = "checkmark"
        }
        
        cell.buttonTask.setImage(UIImage(systemName: icon), for: .normal)
        cell.buttonTask.tag = indexPath.row
        cell.buttonTask.addTarget(self, action: #selector(donePressed), for: .touchUpInside)
        return cell
    }
    
    //subs
    func insertData(taskName: String, taskImage: String) {
        let data = TaskModel(taskName: taskName, taskImage: taskImage)
        goalData.addTaskList(taskList: data)
        tasksTableView.reloadData()
    }
    
    @objc func addTapped(){
        performSegue(withIdentifier: "createTaskSegue", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createTaskSegue"{
        
            let vc = segue.destination as? CreateTaskViewController
            vc?.delegate = self
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return cellSpacingHeight
    }
    
    @IBAction func favoritePressed(_ sender: Any) {
        if goalData.getIsFavorite() == false{
            goalData.setIsFavorite(fav: true)
            isFavorite.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }else{
            goalData.setIsFavorite(fav: false)
            isFavorite.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
//    @IBAction func isDonePressed(_ sender: Any) {
//        var icon: String = ""
//        let data =  goalData.getTaskList()
//        let senderData = sender
//
//        if(!dataArr.getTaskCheck()){
//            icon = "clear"
//            dataArr.setTaskCheck(taskCheck: true)
//        }else{
//            icon = "checkmark"
//            dataArr.setTaskCheck(taskCheck: false)
//        }
//        tasksTableView.reloadData()
//    }
    
    
    @objc func donePressed(sender: UIButton){
        let buttonTag = sender.tag
        let data =  goalData.getTaskList()
        let dataArr = data[buttonTag]
        var icon : String = ""
        if(!dataArr.getTaskCheck()){
            icon = "clear"
            dataArr.setTaskCheck(taskCheck: true)
        }else{
            icon = "checkmark"
            dataArr.setTaskCheck(taskCheck: false)
        }
        tasksTableView.reloadData()
    }
}
