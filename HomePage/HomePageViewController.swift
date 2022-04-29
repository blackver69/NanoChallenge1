//
//  HomePageViewController.swift
//  NanoChallenge1
//
//  Created by Ricky on 26/04/22.
//

import Foundation
import UIKit


var catogoryDatabase : [ScopeGoalModel] = [
    ScopeGoalModel(scopeName: "Membaca", goalsList: [
        GoalModel(
            goalName: "Belajar",
            goalTime: "20",
            goalDuration: "Days",
            taskList: [
                TaskModel(taskName: "Makan", taskImage: "square.and.arrow.down"),
                TaskModel(taskName: "Makan", taskImage: "square.and.arrow.down"),
                TaskModel(taskName: "Makan", taskImage: "square.and.arrow.down"),
                TaskModel(taskName: "Makan", taskImage: "square.and.arrow.down")
            ],
            goalImage: "square.and.arrow.down"),
        GoalModel(
            goalName: "Belajar",
            goalTime: "20",
            goalDuration: "Days",
            taskList: [],
            goalImage: "square.and.arrow.down"),
        GoalModel(
            goalName: "Belajar",
            goalTime: "20",
            goalDuration: "Days",
            taskList: [],
            goalImage: "square.and.arrow.down")
        
    ]
                   , imageScope: "square.and.arrow.down"),
    ScopeGoalModel(scopeName: "Membaca", goalsList: [], imageScope: "square.and.arrow.down"),
    ScopeGoalModel(scopeName: "Membaca", goalsList: [], imageScope: "square.and.arrow.down")]

class HomePageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, protocolCreateScope  {
    
    

    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var createButton: UIButton!
    
    
    
    
    let searchController = UISearchController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.searchTextField.backgroundColor = UIColor.white
    
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        
        
        title = "HomePage"
        let col = Colour()
        createButton.backgroundColor = col.hexStringToUIColor(hex: "333C83")
//        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
//        navigationItem.rightBarButtonItem = add
//        navigationController?.navigationBar.backgroundColor = UIColor(red: 253, green: 175, blue: 117, alpha: 1.0)
        
        
        // Do any additional setup after loading the view.
        
        tabBarController?.tabBar.isHidden = false
        
        
    }
    


    // Collection View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catogoryDatabase.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as? CategoryCollectionViewCell else{
                    fatalError()
            }
        
        
        cell.imageCategory.image = UIImage(systemName: catogoryDatabase[indexPath.row].getImageScope())
        cell.nameCategory.text = catogoryDatabase[indexPath.row].getScopeName()
        let count : String = String(catogoryDatabase[indexPath.row].getGoalList().count) + " Goals"
        cell.countGoals.text = count
        cell.imageCategory.drawARoundedCorner()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = catogoryDatabase[indexPath.row]
        
        performSegue(withIdentifier: "MyGoalsSegue", sender: data)
        
    }
    
    
    //send data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MyGoalsSegue"{
            
            
            let senderData = sender as? ScopeGoalModel
            
        
            let vc = segue.destination as? MyGoalsPageViewController
            
            vc?.categoryData = senderData
            
        }else if segue.identifier == "createScopeSegue"{
            
            let vc = segue.destination as?  CreateScopePageViewController
            vc?.delegate = self
        }
    }
    
    
    
    func insertData(scopeName: String, scopeImage: String) {
        let data = ScopeGoalModel(scopeName: scopeName, goalsList: [], imageScope: scopeImage)
        catogoryDatabase.append(data)
        categoryCollectionView.reloadData()
    }

    @IBAction func pressCreate(_ sender: Any) {
        performSegue(withIdentifier: "createScopeSegue", sender: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.searchTextField.backgroundColor = UIColor.white
    }
}


