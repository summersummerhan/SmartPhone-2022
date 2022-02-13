//
//  SecondViewController.swift
//  Part1
//
//  Created by user214742 on 2/12/22.
//

import UIKit

class SecondViewController: UIViewController {

    

    @IBOutlet weak var lblWelcome: UILabel!
    var welcomeStr = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblWelcome.text = welcomeStr
    }
    



    @IBAction func goBack(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
}
