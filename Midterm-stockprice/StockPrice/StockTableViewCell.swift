//
//  StockTableViewCell.swift
//  StockPrice
//
//  Created by user214742 on 4/10/22.
//

import UIKit

class StockTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblCompanyName: UILabel!
    
    
    @IBOutlet weak var lblSymbol: UILabel!
    
    
    
    var symbol = ""
    var companyName = ""
    var sendStockDelegate : SendStockDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    @IBAction func getPriceAction(_ sender: Any) {
        
        
        let url = getCompanyQuoteURL(symbol)
        
      
        
        getCompanyData(url)
            .done { stockModel in
            self.sendStockDelegate?.sendStockData(stockModel)
        }
        .catch { error in
            print(error.localizedDescription)
        }
        
        
        
    }
    
}
