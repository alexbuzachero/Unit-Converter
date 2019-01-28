//
//  ViewController.swift
//  Unit Converter
//
//  Created by Alexander Dos Santos Buzachero on 1/21/19.
//  Copyright © 2019 Langara Colege. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet var temperatureRange: TemperatureRange!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var tempreraturePicker: UIPickerView!
    
    //private var temperatureValues = [Int]()
    //

    let unitConverter = UnitConverter()
    
    let userDefaultsLastRowKey = "defaultCelciusPickerRow"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tempreraturePicker.dataSource = self;
        
        tempreraturePicker.delegate = self;
        let defaultPickerRow = initialPickerRow()
        
        tempreraturePicker.selectRow(defaultPickerRow, inComponent: 0, animated: true)
        pickerView(tempreraturePicker, didSelectRow:defaultPickerRow, inComponent: 0)
        
        
        //let lowerBound = -100
        //let upperBound = 100
        
        //for index in lowerBound...upperBound{
        //    temperatureValues.append(index)
        //}
    }
    func initialPickerRow() -> Int{
        
        if let savedRow = UserDefaults.standard.object(forKey: userDefaultsLastRowKey) as? Int {
            return savedRow
        }
        return tempreraturePicker.numberOfRows(inComponent: 0) / 2
    }
    
    func saveSelectedRow(row: Int){
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: userDefaultsLastRowKey)
        defaults.synchronize()
        
    }
    
    func displayConvertedTemperatureForRow(row: Int){
        let celciusValue = temperatureRange.values[row]
        temperatureLabel.text = "\(unitConverter.degreesFarenheit(degreesCelcius: Int(celciusValue)))°F"
    }


}

extension ViewController: UIPickerViewDelegate {
    
 
    //Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return "\(temperatureRange.values[row])°C"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let celciusValue = Float(temperatureRange.values[row])
        saveSelectedRow(row: row)
        

        
        temperatureLabel.text = "\(unitConverter.degreesFarenheit(degreesCelcius: Int(celciusValue)))°F"
    }
    
    
}
