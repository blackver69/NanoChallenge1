//
//  ScopeGoalModel.swift
//  NanoChallenge1
//
//  Created by Ricky on 26/04/22.
//

//
//  ScopeGoals.swift
//  NanoChallenge1
//
//  Created by Ricky on 26/04/22.
//

import Foundation


class ScopeGoalModel{
    private var scopeName: String
    
    private var goalsList : [GoalModel]
    private var imageScope : String
    init(scopeName : String, goalsList : [GoalModel], imageScope : String){
        self.scopeName = scopeName
        self.goalsList = goalsList
        self.imageScope = imageScope
    }
    
    

    func addGoalList(goal : GoalModel){
        self.goalsList.append(goal)
    }
    
    func getGoalList()-> [GoalModel]{
        return goalsList
    }
    
    
    func setImageScope(imageScope : String){
        self.imageScope = imageScope
    }
    
    func getImageScope()->String{
        return imageScope
    }
    
    
    func getScopeName()->String{
        return scopeName
    }
}
