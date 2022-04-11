//
//  ViewController.swift
//  StockPrice
//
//  Created by user214742 on 4/10/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SendStockDelegate {

    
    
    

    @IBOutlet weak var lblCompanyName: UILabel!
    
    @IBOutlet weak var lblSymbol: UILabel!
    
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblHigh: UILabel!
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var lblLow: UILabel!
    
    
    var stocks : [StockModel] = [StockModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initStocks()
        getAAPLPrice()    }
    
    
    
    func getAAPLPrice(){
        
        let url = getCompanyQuoteURL("AAPL")
        
        
        getCompanyData(url)
            .done { stockModel in
            self.sendStockData(stockModel)
        }
        .catch { error in
            print(error.localizedDescription)
        }    }
    
    func initStocks(){
        
        let AAPL = StockModel("Apple", "AAPL");
        let FB = StockModel("Facebook", "FB");
        let AMZN = StockModel("AMAZON", "AMZN");
        let GOOG = StockModel("Google", "GOOG");
        let MSFT = StockModel("Microsoft", "MSFT");
        
      
    
        stocks.append(AAPL)
        stocks.append(FB)
        stocks.append(AMZN)
        stocks.append(GOOG)
        stocks.append(MSFT)
       
  }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
       // cell.textLabel?.text = stocks[indexPath.row].companyName
//return cell    }
    
        
        let cell = Bundle.main.loadNibNamed("StockTableViewCell", owner: self, options: nil)?.first as! StockTableViewCell
                
        let stockModel = stocks[indexPath.row]
        
        cell.lblSymbol.text = stockModel.symbol
        cell.lblCompanyName.text = stockModel.companyName
        cell.symbol = stockModel.symbol
        cell.companyName = stockModel.companyName
        cell.sendStockDelegate = self
        
        return cell

}
    
    
    func sendStockData(_ stockModel: StockModel) {
        
        lblCompanyName.text = "Company: \(stockModel.companyName)"
        lblSymbol.text = "Symbol: \(stockModel.symbol)"
        lblPrice.text = "Price: \(stockModel.price)"
        lblLow.text = "Day low: \(stockModel.dayLow) "
        lblHigh.text = "Day high: \(stockModel.dayHigh)"
    }
}
