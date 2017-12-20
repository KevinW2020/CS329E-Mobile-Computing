//
//  Doctor.swift
//  medicore
//
//  Created by Khalil Manpuri on 12/7/17.
//  Copyright © 2017 Final Project. All rights reserved.
//

import Foundation
class Doctor{
    var Name:String?
    var Special = [Disease]()
    var Rating = [Int]()
    var Reviews = [String]()
    var imageName: String?
    init(Name:String?){
        self.Name = Name
      
    }
}
