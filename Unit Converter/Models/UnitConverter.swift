//
//  UnitConverter.swift
//  Unit Converter
//
//  Created by Alexander Dos Santos Buzachero on 1/21/19.
//  Copyright © 2019 Langara Colege. All rights reserved.
//

import Foundation

class UnitConverter{
    
    func degreesFarenheit(degreesCelcius: Int) -> Int {
        return Int(1.8 * Float(degreesCelcius) + 32.0)
    }
}
