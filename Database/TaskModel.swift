//
//  TaskModel.swift
//  NanoChallenge1
//
//  Created by Ricky on 26/04/22.
//

import Foundation


class TaskModel{
    private var taskName: String
    private var taskCheck : Bool = false
    private var taskImage: String
    init(taskName : String, taskImage: String){
        self.taskName = taskName
        self.taskImage = taskImage
    }
    
    func setTaskCheck(taskCheck : Bool){
        self.taskCheck = taskCheck
    }
    func getTaskCheck()->Bool{
        return taskCheck
    }
    
    func getTaskImage()->String{
        return taskImage
    }
    func getTaskName()->String{
        return taskName
    }
    
}
