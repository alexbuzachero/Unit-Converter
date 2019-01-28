//
//  TemperatureRange.swift
//  Unit Converter
//
//  Created by Alexander Dos Santos Buzachero on 1/21/19.
//  Copyright © 2019 Langara Colege. All rights reserved.
//
import UIKit
import Foundation

class TemperatureRange: NSObject, UIPickerViewDataSource {
    let values = (-100...100).map { $0 }
    
    //Data Source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
}
