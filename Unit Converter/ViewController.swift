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
    
    @IBOutlet weak var segmentController: UISegmentedControl!
    //private var temperatureValues = [Int]()
    //

    let unitConverter = UnitConverter()
    
    let userDefaultsLastRowKey = "defaultCelciusPickerRow"
    let userDefaultsLastDegreesKey = "defaultChosenDegrees"
    
    @IBAction func switchConversor(_ sender: UISegmentedControl) {
        switch segmentController.selectedSegmentIndex
        {
        case 0:
            tempreraturePicker.reloadAllComponents()
            pickerView(tempreraturePicker, didSelectRow:initialPickerRow(), inComponent: 0)
            savedSelectedDegrees(degrees: 0)
            break;
        case 1:
            tempreraturePicker.reloadAllComponents()
            pickerView(tempreraturePicker, didSelectRow:initialPickerRow(), inComponent: 0)
            savedSelectedDegrees(degrees: 1)
            break;
            
        default:
            break;
            
        }
    }
    //var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tempreraturePicker.dataSource = self;
        
        segmentController.selectedSegmentIndex = selectDegrees()
        
        tempreraturePicker.delegate = self;
        //let defaultPickerRow = initialPickerRow()
        
        tempreraturePicker.selectRow(initialPickerRow(), inComponent: 0, animated: true)
        pickerView(tempreraturePicker, didSelectRow: initialPickerRow(), inComponent: 0)
        
        
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
    
    func selectDegrees() -> Int{
        if let savedDegrees = UserDefaults.standard.object(forKey: userDefaultsLastDegreesKey) as? Int{
            return savedDegrees
            
        }
        return 0
    }
    
    func saveSelectedRow(row: Int){
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: userDefaultsLastRowKey)
        defaults.synchronize()
        
    }
    
    func savedSelectedDegrees(degrees:Int) {
        let defaults = UserDefaults.standard
        defaults.set(degrees, forKey: userDefaultsLastDegreesKey)
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
        if segmentController.selectedSegmentIndex == 0 {
            return "\(temperatureRange.values[row])°C"
        } else {
            return "\(temperatureRange.values[row])°F"
        }    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let celciusValue = Float(temperatureRange.values[row])
        saveSelectedRow(row: row)
        
        if segmentController.selectedSegmentIndex == 0 {
            temperatureLabel.text = "\(unitConverter.degreesFarenheit(degreesCelcius: Int(celciusValue)))°F"
        } else {
            temperatureLabel.text = "\(unitConverter.degreesCelsius(degreesFarenheint: Int(celciusValue)))°C"
        }
    }
    
}
