//
//  tipsyBrain.swift
//  Tipsy
//
//  Created by Manasa Vishnu Moorthy on 22/07/23.


import UIKit

struct tipsyBrain{
    var tip:TIP?
    
    mutating func calculateTip(billText: String, tipSelected: Double, stepperMinimum: Int){
        let totalTip = (((billText as NSString).floatValue + (billText as NSString).floatValue * Float(tipSelected)) / Float(stepperMinimum))
        let tipValue=String(format: "%.0f", tipSelected*100)
        let settingsText="Split between \(Int(stepperMinimum)) people, with \(tipValue)% tip"
        tip=TIP(total: totalTip, settings: settingsText)
    }
    func getTotalTip() -> Float{
        return tip?.total ?? 0.0
    }
    func getSettingsText() -> String{
        return tip?.settings ?? "No setting"
    }
    
}
