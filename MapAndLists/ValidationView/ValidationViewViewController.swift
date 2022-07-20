//
//  ValidationViewViewController.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 21/06/22.
//

import UIKit

class ValidationViewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.validaciones()
    }
    
    func validaciones()  {
        
        DispatchQueue.main.async(){
        let defaults = UserDefaults.standard
        
        if let tieneCostumerID = defaults.object(forKey: "bigcustomer_id") as? Int {
                
                self.performSegue(withIdentifier: "showInicio", sender: nil)
                return
            }
        
        if let inicioOno = defaults.object(forKey: "Inicioono") as? Bool {
            
            self.performSegue(withIdentifier: "showMain", sender: nil)
            
            
        }else{
            
            self.performSegue(withIdentifier: "showOnBoarding", sender: nil)
            
            
            }
            
        }
        
    }
    
}
