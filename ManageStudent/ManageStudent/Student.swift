//
//  Student.swift
//  ManageStudent
//
//  Created by healer on 5/6/17.
//  Copyright © 2017 healer. All rights reserved.
//

import Foundation

class Student{
    
    private var nameSt : String
    private var universitySt : String
    private var descriptionSt : String
    private var yearOldSt : Int
    
    init(name : String, university: String, description: String, yearOld: Int) {
        nameSt = name
        universitySt = university
        descriptionSt = description
        yearOldSt = yearOld
    }
    
    func getName() -> String{
        return nameSt
    }
    
    func setName(name: String){
        nameSt = name
    }
    
    func getUniversity() -> String{
        return universitySt
    }
    
    func setUniversity(university: String){
        universitySt = university
    }
    
    func getDescription() -> String{
        return descriptionSt
    }
    
    func setDescription(description: String){
        descriptionSt = description
    }
    
    func getYearOld() -> Int{
        return yearOldSt
    }
    
    func setYearOld(yearOld: Int){
        yearOldSt = yearOld
    }
}

