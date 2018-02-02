//
//  ViewController.swift
//  JsonDataFetch
//
//  Created by darshan on 31/01/18.
//  Copyright © 2018 darshan. All rights reserved.
//

import UIKit

struct info : Decodable {
    let name : String
    let capital : String
    let region : String
    let population : Int
    let subregion: String
    let alpha2Code : String
}
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
   

    @IBOutlet var tabelView: UITableView!
    var arrData = [info]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
       

    }

    func getdata() {
        
        let url = URL(string:"https://restcountries.eu/rest/v2/all")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do{
                if error == nil {
                    self.arrData = try JSONDecoder().decode([info].self, from: data!)
                }
                //for fetch multiple data
                for mainArr in self.arrData {
                    print(mainArr.name, ":" ,mainArr.capital )
                    
                    
                    //for avoid thread warning
                    DispatchQueue.main.async {
                        self.tabelView.reloadData()
                    }
                    
                }
            }catch{
                
                print("something is wrong error in get json data")
            }
            
           
        }.resume()
        
    }
    
    //tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:CountryTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CountryTableViewCell
        cell.namelbl.text = "name: \(arrData[indexPath.row].name)"
        cell.lblcapital.text = "capital: \(arrData[indexPath.row].capital)"
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let DetailsView:DetailsViewController = self.storyboard!.instantiateViewController(withIdentifier:"DetailsView") as! DetailsViewController
        
        DetailsView.strregion = "region: \(arrData[indexPath.row].region)"
        DetailsView.strpopualtion = "population: \(arrData[indexPath.row].population)"
        DetailsView.strcallingCodes = "subregion: \(arrData[indexPath.row].subregion)"
        DetailsView.stralpha2Code = "alpha2Code: \(arrData[indexPath.row].alpha2Code)"

        self.navigationController?.pushViewController(DetailsView, animated: true)
        
    }

}

