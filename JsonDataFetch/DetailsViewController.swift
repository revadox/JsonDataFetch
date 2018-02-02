//
//  DetailsViewController.swift
//  JsonDataFetch
//
//  Created by darshan on 31/01/18.
//  Copyright © 2018 darshan. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    
    @IBOutlet var callingCodes: UILabel!
    
    @IBOutlet var region: UILabel!
    
    @IBOutlet var population: UILabel!
    
    @IBOutlet var latlng: UILabel!
    
    
    
    var strcallingCodes = ""
    var strregion = ""
    var strpopualtion = ""
    var stralpha2Code = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         callingCodes.text = strcallingCodes
         region.text = strregion
         population.text = strpopualtion
         latlng.text = stralpha2Code
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
