//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculator = Calculator()
    
    @IBAction func heightSliderDidChange(_ sender: UISlider) {
        let height = sender.value
        heightLabel.text = String(format: "%.2f", height) + "m"
    }
    @IBAction func weightSliderDidChange(_ sender: UISlider) {
        let weight = sender.value
        weightLabel.text = String(format: "%.1f", weight) + "Kg"
    }
    @IBAction func calculateButtonAction(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        calculator.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmiValue = calculator.getBMI()
            destinationVC.advice = calculator.getAdvice()
            destinationVC.color = calculator.getColor()
        }
    }
}

