//
//  VehDescargaViewController.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 7/07/22.
//

import UIKit
import NotificationBannerSwift

class VehDescargaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    //MARK: - IBActions
    @IBAction func backButton(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Properties
    var id: Int = 0
    var infoPlanta : ActPlantaModel.Plants?
    var arrayReques: [(VehCargueDescargueModel.Vehicles_load)] = []
    var vehiculo: VehCargueDescargueModel.Vehicles_load?
    var manifiesto: VehCargueDescargueModel.VehCargueDescargueDatas?
    var ViewModel = VehCargueDescargueViewModel()
    //MARK: - Constants
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "ServiciosSolicitadosCell", bundle: nil), forCellReuseIdentifier: "showServSolReusable")
        print("el id es \(id)")
        Obtenerinfo()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "showImagVeh", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showImagVeh" {
            let destinationVC = segue.destination as! ImagVehViewController
            destinationVC.vehiculo = vehiculo
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "showServSolReusable", for: indexPath) as! ServiciosSolicitadosTableViewCell
        cell.EmpresaLabel.text = arrayReques[index].vehicle?.placa
        cell.NombreLabel.text = arrayReques[index].driver?.full_name
        cell.NumLabel.text = "\(arrayReques[index].requeststatus!.name!)"
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayReques.count
    }
    
    func Obtenerinfo() {
        
        showLoadingView(vista: self)
        ViewModel.getVehCargueDescargue(id: id) { (Result) in
            
            if let arrayques = Result?.vehicles_load {
                if self.arrayReques.count == 0 {
                NotificationBanner.init(title: "Error", subtitle: "No hay Datos de Vehiculos", style: .warning).show()
                }
                self.arrayReques = arrayques
                self.tableView.reloadData()
            }else{
                
                NotificationBanner.init(title: "Error", subtitle: "No hay Data", style: .warning).show()
            }
            HideLoadingView(vista: self)
        }
        }

}
