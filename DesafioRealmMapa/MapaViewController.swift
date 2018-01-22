//
//  MapaViewController.swift
//  DesafioRealmMapa
//
//  Created by Swift on 19/01/2018.
//  Copyright © 2018 Corporate. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController {

    var latitude : Float = 0.0
    var longitude : Float = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var mapa: MKMapView!
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
