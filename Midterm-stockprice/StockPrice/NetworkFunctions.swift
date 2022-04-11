//
//  NetworkFunctions.swift
//  StockPrice
//
//  Created by user214742 on 4/10/22.
//

import Foundation
import PromiseKit
import Alamofire
import SwiftyJSON



func getCompanyQuoteURL(_ Symbol : String) -> String {
    let url = "\(companyQuoteURL)\(Symbol)?apikey=\(APIKey)"
    return url
}

func getCompanyData(_ url : String) -> Promise<StockModel>{
    
    return Promise<StockModel> { seal -> Void in
        
        AF.request(url).responseJSON { response in
        
            if response.error != nil {
                seal.reject(response.error!)
            }
            
            let stockModel = StockModel("", "")
            //get data here

            let StockModel = JSON(response.data!).arrayValue
            
            guard let stockJSON = StockModel.first else {return seal.fulfill(stockModel)}
            
            stockModel.companyName = stockJSON["name"].stringValue
            stockModel.symbol = stockJSON["stock"].stringValue
            stockModel.price = stockJSON["price"].doubleValue
            stockModel.dayLow = stockJSON["dayLow"].doubleValue
            stockModel.dayHigh = stockJSON["dayHigh"].doubleValue
            seal.fulfill(stockModel)

        }// end of response

    }// end is return Promise
}// end of function
