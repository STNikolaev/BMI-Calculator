//
//  Calculator.swift
//  BMI Calculator
//
//  Created by Alexandr Nikolaev on 10.02.22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct Calculator {
    
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies", color: .blue)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "You're normal", color: .green)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat more veggies", color: .red)
        }
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .white
    }
    
    func getBMI() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
}
