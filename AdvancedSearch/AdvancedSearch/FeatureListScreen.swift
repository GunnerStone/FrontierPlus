//
//  FeatureListScreen.swift
//  AdvancedSearch
//
//  Created by Frontier Companion on 1/9/20.
//  Copyright © 2020 Frontier Companion. All rights reserved.
//

import UIKit

class FeatureListScreen: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var features: [Feature] = []
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        features = createArray()
        // Do any additional setup after loading the view.
    }
    
    func createArray() -> [Feature] {
        var tempFeatures: [Feature] = []
        
        let feature1 = Feature(image: UIImage(named:"color")! ,title: "Color",  selection: "")
        let feature2 = Feature(image: UIImage(named:"mane")! ,title: "Mane",  selection: "")
        let feature3 = Feature(image: UIImage(named:"face")! ,title: "Face",  selection: "")
        let feature4 = Feature(image: UIImage(named:"whorl")! ,title: "Whorl",  selection: "")
        let feature5 = Feature(image: UIImage(named:"feet")! ,title: "Feet",  selection: "")
        
        tempFeatures.append(feature1)
        tempFeatures.append(feature2)
        tempFeatures.append(feature3)
        tempFeatures.append(feature4)
        tempFeatures.append(feature5)
        
        return tempFeatures
    }
    
}

extension FeatureListScreen: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return features.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let feature = features[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeatureCell") as! FeatureCell
        cell.setFeature(feature: feature)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        // If table cell clicked was Color, segue into the Color-picker view
        if(features[indexPath.row].title=="Color"){
        performSegue(withIdentifier: "showColors", sender: self)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
