//
//  FavoritesPageViewController.swift
//  NanoChallenge1
//
//  Created by Ricky on 27/04/22.
//

import Foundation

import UIKit

 




class FavoritesPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    


    @IBOutlet weak var favoriteTableView: UITableView!
    var flagGoals : [Int] = []
    var favGoals : [GoalModel] = []
    
    
    let searchController = UISearchController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favoriteTableView.delegate = self
        favoriteTableView.dataSource = self
    
        self.getGoalFav()
        
        title = "Your Favorites"
        
        
//        let category = tabBarController as! HomePageViewController
//
//        categoryGoal = category.catogoryDatabase
        // Do any additional setup after loading the view.
        
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.searchTextField.backgroundColor = UIColor.white
    }
    
    
    //tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favGoals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = favoriteTableView.dequeueReusableCell(withIdentifier: "goalsCell", for: indexPath)as? FavoritesTableViewCell else{
            fatalError()
        }
        var icon = ""
        
        if(!favGoals[indexPath.row].getIsFavorite()){
            icon = "heart"

        }else{
            icon = "heart.fill"
        }
        let img: UIImage = UIImage(systemName: "heart" )!
        cell.checkGoal.setBackgroundImage(img, for: .normal)
        cell.nameGoal.text = favGoals[indexPath.row].getGoalName()
        cell.imageGoal.image = UIImage(systemName: favGoals[indexPath.row].getGoalImage())
        cell.checkGoal.addTarget(self, action: #selector(lovePressed), for: .touchUpInside)
        cell.checkGoal.setImage(UIImage(systemName: icon ), for: .normal)
        cell.categoryName.text = getCategory()
        return cell
    }
    //check data
    func getGoalFav(){
        
        for category in catogoryDatabase{
            flagGoals.append(0)
            for goal in category.getGoalList() {
                if(goal.getIsFavorite() == true){
                    print("masuk")
                    favGoals.append(goal)
                    flagGoals[flagGoals.count - 1] += 1
                }
            }
        }
    }
    
    func getCategory()-> String{
        for i in 0..<flagGoals.count{
            if(flagGoals[i]>0){
                flagGoals[i] -= 1
                let a = catogoryDatabase[i].getScopeName()
                return a
                
            }
        }
        return ""
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.searchTextField.backgroundColor = UIColor.white
    }
    
    @objc func lovePressed(sender: UIButton){
        let buttonTag = sender.tag
        let dataArr = favGoals[buttonTag]
        var icon : String = ""
        if(dataArr.getIsFavorite()){
            icon = "heart"
            dataArr.setIsFavorite(fav: false)
        }else{
            icon = "heart.fill"
            dataArr.setIsFavorite(fav: true)
        }
        sender.setImage(UIImage(systemName: icon), for: .normal)
        favoriteTableView.reloadData()
    }

    override func viewDidAppear(_ animated: Bool) {
        favoriteTableView.reloadData()
    }
    
}
