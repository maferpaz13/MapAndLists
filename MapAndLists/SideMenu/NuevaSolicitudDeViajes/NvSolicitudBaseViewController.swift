//
//  NvSolicitudBaseViewController.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 16/07/22.
//

import UIKit

class NvSolicitudBaseViewController: UIViewController {
    @IBOutlet weak var LabelName: UILabel!
    
    @IBAction func Back(_ sender: Any) {
        
        switch NvSolicitud2VistaViewController.vistas {
            
        case .NvSolicitud2ViewController:
            _ = navigationController?.popViewController(animated: true)
        default:
            _ = NvSolicitud3ViewController.navigation!.popViewController(animated: true)
            
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        NvSolicitud2VistaViewController.label = LabelName
    }
    

}
