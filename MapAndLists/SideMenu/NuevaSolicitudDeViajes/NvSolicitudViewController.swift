//
//  NvSolicitudViewController.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 12/07/22.
//

import UIKit
import SideMenu

class NvSolicitudViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var buttonout: UIButton!
    
    //MARK: - IBActions
    
    @IBAction func SideMenu(_ sender: Any) {
        
        present(SideMenuManager.default.leftMenuNavigationController!, animated: true, completion: nil)
        
    }
    
    @IBAction func BotonNvServ(_ sender: Any) {
        self.performSegue(withIdentifier: "showNvServ", sender: nil)
    }
    
    //MARK: - Properties
    //MARK: - Constants
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ConfigSideMenu(navigation: self.navigationController!)
        buttonout.layer.cornerRadius = 8
        
    }
    

}
