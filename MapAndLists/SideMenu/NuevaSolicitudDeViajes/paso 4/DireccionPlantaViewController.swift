//
//  DireccionPlantaViewController.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 16/07/22.
//

import UIKit

class DireccionPlantaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buscador: UITextField!
    
    @IBAction func Backbutton(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    var arrayDireccion: [(direccionModel.Datas)] = []
    var ViewModel = direccionViewModel()
    var route_id: Int = 0
    var load: Bool = false
    var unload: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ObtenerInfo()
        tableView.register(UINib(nibName: "InfoCell", bundle: nil), forCellReuseIdentifier: "showCelVistaTable")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        NvSolicitud2VistaViewController.label?.text = "Plantas"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if load == true {
        NvSolicitud5ViewController.plantLoad = arrayDireccion[indexPath.row]
        }else{
        NvSolicitud5ViewController.plantLoad2 = arrayDireccion[indexPath.row]
        }
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayDireccion.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let index = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "showCelVistaTable", for: indexPath) as! InfoCellTableViewCell
        
        cell.Thingslabel.text = arrayDireccion[index].name!
        
        return cell
        
    }

    
    func ObtenerInfo() {
        
        showLoadingView(vista: self)
       ViewModel.getdireccion(route_id: route_id, load: load, unload: unload) { (Result) in
            if let arraydirect = (Result?.data) {
            self.arrayDireccion = arraydirect
            self.tableView.reloadData()
            HideLoadingView(vista: self)
            }
        }
        
    }
    
}
