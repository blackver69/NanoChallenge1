//
//  GoalModel.swift
//  NanoChallenge1
//
//  Created by Ricky on 26/04/22.
//

import Foundation


class GoalModel{
    
    private var goalName: String
    private var goalTime: String
    private var goalDuration: String
    private var goalImage: String
    private var taskList: [TaskModel]
    private var isFavorite: Bool = true
    
    init(goalName: String, goalTime: String, goalDuration: String, taskList: [TaskModel], goalImage : String){
        self.goalName = goalName
        self.goalTime = goalTime
        self.goalDuration = goalDuration
        self.taskList = taskList
        self.goalImage = goalImage
    }
    
    func setGoalName(goalName : String){
        self.goalName = goalName
        
    }
    func getGoalName()->String{
        
 

        return goalName
    }
    
    func setGoalTime(goalTime : String){
        self.goalTime = goalTime
        
    }
    func getGoalTime()->String{
   

        return goalTime
    }
    
    func setGoalDuration(goalDuration: String){
        self.goalDuration = goalDuration
        
    }
    func getGoalDuration()->String{


        return goalDuration
    }
    
    
    func addTaskList(taskList : TaskModel){
        self.taskList.append(taskList)
    }
    
    func getTaskList()-> [TaskModel]{
        return taskList
    }
    
    func setIsFavorite(isFavorite : Bool){
        self.isFavorite = isFavorite
    }
    
    func getIsFavorite()-> Bool{
        return isFavorite
    }
    
    func setGoalImage(goalImage: String){
        self.goalImage = goalImage
    }
    
    func getGoalImage()->String{
        return goalImage
    }
    
    func setIsFavorite(fav : Bool){
        self.isFavorite = fav
    }
}
