//
//  StockViewController.swift
//  Assignment5
//
//  Created by user214742 on 3/1/22.
//

import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire


class StockViewController: UIViewController {

    @IBOutlet weak var txtStockSymbol: UITextField!
    
    
    @IBOutlet weak var lblStockPrice: UILabel!
    
    @IBOutlet weak var lblDCF: UILabel!
    
   // @IBOutlet weak var lblDate: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func getStockPrice(_ sender: Any) {
        
        
        guard let symbol = txtStockSymbol.text else {return }
    
        
        let url = "\(shortQuoteURL)\(symbol.uppercased())?apikey=\(apiKey)"
        
        print(url)
        
        SwiftSpinner.show("Getting discounted-cash-flow Value for \(symbol)")
        AF.request(url).responseJSON { response in
            SwiftSpinner.hide(nil)
            if response.error != nil {
                print(response.error!)
                return
            }
            // If I am here then I have got the data
            
            let stocks = JSON(response.data!).array
            
            guard let stock = stocks!.first else { return}
            
            print(stock)
            let quote = QuoteShort()
            quote.symbol = stock["symbol"].stringValue
            quote.marketCap = stock["marketCap"].intValue
            quote.data = stock["data"].stringValue
            
            
            self.lblStockPrice.text = "\(quote.symbol) "
            self.lblDCF.text = "\(quote.marketCap)"
            
            
        }
        
    }
    

}
