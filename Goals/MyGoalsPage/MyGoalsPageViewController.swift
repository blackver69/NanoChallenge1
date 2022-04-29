//
//  MyGoalsPageViewController.swift
//  NanoChallenge1
//
//  Created by Ricky on 26/04/22.
//

import Foundation


import UIKit

class MyGoalsPageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, protocolCreateMyGoals {

    

    
    
    @IBOutlet weak var goalsCollectionView: UICollectionView!
    var categoryData : ScopeGoalModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        goalsCollectionView.dataSource = self
        goalsCollectionView.delegate = self
        
        
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem = add
        navigationItem.colourItem()
        
        
        title = "Your Goals"
        tabBarController?.tabBar.isHidden = true
        
        
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return categoryData.getGoalList().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = goalsCollectionView.dequeueReusableCell(withReuseIdentifier: "goalCell", for: indexPath)as? GoalCollectionViewCell else{
            fatalError()
        }
        let data = categoryData.getGoalList()
        cell.nameGoal.text = data[indexPath.row].getGoalName()
        
        cell.imageGoal.image = UIImage(systemName: data[indexPath.row].getGoalImage())
        
        cell.imageGoal.layer.cornerRadius = 10
        let count = String(data[indexPath.row].getTaskList().count) + " Tasks"
        cell.taskCount.text = count
        
        let duration = data[indexPath.row].getGoalTime()  + " " +  data[indexPath.row].getGoalDuration()
        cell.taskDuration.text = duration
//        cell.durationGoal.titleLabel?.font =  UIFont(name: "SF Pro Regular", size: 5)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = categoryData.getGoalList()
        let arrData = data[indexPath.row]
        
        performSegue(withIdentifier: "MyGoalsSegue", sender: arrData)
        
    }
    
    func insertData(goalName: String, goalTime: String, goalDuration: String, taskList: [TaskModel], goalImage: String) {
        let goalData = GoalModel(goalName: goalName, goalTime: goalTime, goalDuration: goalDuration, taskList: taskList, goalImage: goalImage)
        
        
        categoryData.addGoalList(goal: goalData)
        goalsCollectionView.reloadData()
    }
    
    @objc func addTapped(){
        performSegue(withIdentifier: "createGoalSegue", sender: nil)
    }
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createGoalSegue"{
        
            let vc = segue.destination as? CreateMyGoalsPageViewController
            vc?.delegate = self
            
        }else if segue.identifier == "MyGoalsSegue"{
            
            let senderData = sender as? GoalModel
            let vc = segue.destination as? MyTasksPageViewController
            vc?.goalData = senderData
                
            
        }
    }
    
    
}

