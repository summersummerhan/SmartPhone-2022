//
//  ViewController.swift
//  BMICalculator
//
//  Created by user214742 on 5/3/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var weight: UITextField!
    
    @IBOutlet weak var heightInch: UITextField!
    
    @IBOutlet weak var heightFeet: UITextField!
    
    
    @IBOutlet weak var bmiValue: UILabel!
    
    
    @IBOutlet weak var bmiMessage: UILabel!
    
    
    
    @IBAction func getBMI(_ sender: Any) {
        let heightInch = (heightInch.text! as NSString).doubleValue
        
        let heightFeet = (heightFeet.text! as NSString).doubleValue
        
        let feet = heightFeet*12
        let height = heightInch+feet
        
                let weight = (weight.text! as NSString).doubleValue
                
                let nmiValue = (weight/(height*height)) * 703
        
        bmiValue.text = String(format: "%.2f", nmiValue)
        
        
        if nmiValue < 18.5{
            bmiMessage.text = "underweight "
        }else if nmiValue < 24.9{
            bmiMessage.text = "healthy weight "
        }else if nmiValue < 29.9{
            bmiMessage.text = "overweight "
        }else {
            bmiMessage.text = "obese"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

