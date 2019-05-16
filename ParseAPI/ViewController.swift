//
//  ViewController.swift
//  ParseAPI
//
//  Created by Ivan Drago on 12/05/2019.
//  Copyright © 2019 Ivan Drago. All rights reserved.
//

import UIKit

struct CoinInformation: Codable {
    
    var data: [Coin]?
    var info: Inform?
    
}

struct Coin: Codable {
    var id: String?
    var symbol: String?
    var name: String?
    var nameid: String?
    var rank: Int64?
    var price_usd: String?
    var percent_change_24h: String?
    var percent_change_1h: String?
    var percent_change_7d: String?
    var price_btc: String?
    var market_cap_usd: String?
    var volume24: Double?
    var volume24a: Double?
    var csupply: String?
    var tsupply: String?
    var msupply: String?
}

struct Inform: Codable {
    var coins_num: Int64?
    var time: Int64?
    
}



/*struct Global: Decodable{
    
    var coins: Information
}*/

/*struct Information: Decodable{
    
    var coins_count: Int64?
    var active_markets: Int64?
    var total_mcap: Double?
    var total_volume: Double?
    var btc_d: String?
    var eth_d: String?
    var mcap_change: String?
    var volume_change: String?
    var avg_change_percent: String?
    var volume_ath: Double?
    var mcap_ath: Int64?
}
*/

class ViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100//coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoinCell", for: indexPath) as? CoinTableViewCell else {
           return UITableViewCell()
        //let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        //cell.textLabel?.text = data[indexPath.row]
        }
        cell.nameLabel.text = coins[indexPath.row].name
        
        cell.nameLabel.text = "Test"//DownloadedCoinPrice.data.name
        cell.PraceLabel.text = coins[indexPath.row].price_usd
        cell.PercentChangeLabel.text = coins[indexPath.row].percent_change_24h
        print(coins[indexPath.row].price_usd,"String")
        return cell
    }
    
     var coins: [Coin] = []
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
       func downloadJson(){
            let urlString = "https://api.coinlore.com/api/tickers/"
            guard let url = URL(string: urlString) else {return}
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                guard let data = data else {return}
                guard error == nil else {return}
                
                do{
                    let DownloadedCoinPrice = try JSONDecoder().decode(CoinInformation.self, from: data)
                    self.coins = DownloadedCoinPrice.data!
                    DispatchQueue.main.async{
                    self.tableView.reloadData()
                    //print(self.coins)
                    }
                    
                    print(DownloadedCoinPrice.data?[0].name)
                    
                } catch let error{
                    print(error)
                }
                
                }.resume()
        }
        
        downloadJson()
        
      

}

}
