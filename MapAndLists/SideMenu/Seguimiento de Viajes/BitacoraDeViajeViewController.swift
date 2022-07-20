//
//  BitacoraDeViajeViewController.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 4/07/22.
//

import UIKit
import SDWebImage

class BitacoraDeViajeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - IBActions
    @IBAction func BackButtonBitacora(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Properties
    var request_id:Int = 0
    var ArrayBitacora : [(BitacioraDeViajeModel.Data)] = []
    var ViewModel = BitacioraDeViajeViewModel()
    
    //MARK: - Constants

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "BitacoraCell", bundle: nil), forCellReuseIdentifier: "BitacoraReusableCell")
        obtenerInfo()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let index = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BitacoraReusableCell", for: indexPath) as! BitacoraTableViewCell
        
        cell.FechaLabel.text = ArrayBitacora[index].created_at
        cell.EventoLabel.text = ArrayBitacora[index].created_at
        cell.ComentarioLabel.text = ArrayBitacora[index].comment
        cell.SoporteLabel.text = ArrayBitacora[index].photo?.url
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ArrayBitacora.count
        
    }
    
    func obtenerInfo() {
        
        ViewModel.getBitacora(request_id: request_id) { (Result) in
            
            
            self.ArrayBitacora = (Result?.data)!
            self.tableView.reloadData()
                
                }
        }
    
    
}
