//
//  GuiadeCargaViewController.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 30/06/22.
//

import UIKit

class GuiadeCargaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    // MARK: - IBoutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var GuiaLabel: UILabel!
    
    // MARK: -IBActions
    @IBAction func BackButtonGuia(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Properties
    var ArrayDetallesServ: [(DetalleServModel.Products)] = []
    var GuiaCarga: String = ""
        
    // MARK: - Constants
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "GuiadeCargaCell", bundle: nil), forCellReuseIdentifier: "GuiaDeCargaReusable")
        GuiaLabel.text = GuiaCarga
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArrayDetallesServ.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "GuiaDeCargaReusable", for: indexPath) as! GuiaDeCargaTableViewCell
        
        cell.NumProductLabel.text = ArrayDetallesServ[index].name
        cell.CantidadLabel.text = "\(ArrayDetallesServ[index].weight!)"
        
        return cell
    }
    
    
}
