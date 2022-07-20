//
//  ActEnPlantaViewController.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 4/07/22.
//

import UIKit
import iOSDropDown
import SideMenu


class ActEnPlantaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate  {
    
    //MARK: - IBoutlets
    @IBOutlet weak var Buscador: UITextField!
    @IBOutlet weak var tableView: UITableView!

    
    //MARK: - IBActions
    @IBAction func SideMenu(_ sender: Any) {
        
        present(SideMenuManager.default.leftMenuNavigationController!, animated: true, completion: nil)
        
    }
    
    //MARK: - Properties
    var viewModel = ActPlantaViewModel()
    var ArrayActividadEnPlanta : [(ActPlantaModel.Plants)] = []
    var ArrayActividadEnPlantaOriginal : [(ActPlantaModel.Plants)] = []
    var infoPlanta : ActPlantaModel.Plants?
    var id: Int = 0
    
    //MARK: - Constants
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "SeguiViaje", bundle: nil), forCellReuseIdentifier: "showSeguiviajeReusable")
        ConfigSideMenu(navigation: self.navigationController!)
        self.hideKeyboardWhenTappedAround()
        obtenerInfo()
        Buscador.delegate = self
        Buscador.addTarget(self, action: #selector(self.myTextFieldDidChange), for: .editingChanged)
    }
    @objc func myTextFieldDidChange(_ textField: UITextField) {
            
            if textField == Buscador{
                
                BuscarNombre(nombre:Buscador.text!){
                    
                    (result) -> () in
                    
                    self.ArrayActividadEnPlanta.removeAll()
                    self.ArrayActividadEnPlanta = result
                    self.tableView.setContentOffset(CGPoint(x: 0, y: 0 - self.tableView.contentInset.top), animated: true)
                    self.tableView.reloadData()
                    
                }
                
            }
            
        }
    
    func BuscarNombre(nombre:String, completion: @escaping (_ result: [(ActPlantaModel.Plants)])->()){
            
            var local:[(ActPlantaModel.Plants)] = []
            let cad = nombre.lowercased()
            
            if cad == "" || cad == " "{
                
                print("entre aca")
                completion(ArrayActividadEnPlantaOriginal)
                
            }else{
                
                print("no era vacio")
                
                for t in ArrayActividadEnPlantaOriginal{
                    
                    var tag = ""
                    
                    if t.name != "" {
                        
                        tag = "\(t.name!)"
                        
                        
                    }else{
                            
                            tag = "N/A"
                            
                        
                    }
                    
                    if tag.lowercased().range(of:"\(cad)", options:[.caseInsensitive,.diacriticInsensitive]) != nil{
                        
                        local.append(t)
                        
                    }
                    
                }
                
                completion(local)
                
            }
            
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        infoPlanta = ArrayActividadEnPlanta[indexPath.row]
        self.performSegue(withIdentifier: "showVehPlanta", sender: nil)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "showSeguiviajeReusable", for: indexPath) as! SeguiViajeTableViewCell
        cell.OrigenDestino.text = ArrayActividadEnPlanta[index].name
        cell.TipoDeCarga.text = ArrayActividadEnPlanta[index].contact_name
        cell.StatusFecha.text = ArrayActividadEnPlanta[index].contact_phone
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArrayActividadEnPlanta.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showVehPlanta" {
            let destinationVC = segue.destination as! VehPlantaViewController
            destinationVC.InfoPlanta = infoPlanta
            destinationVC.id = (infoPlanta?.id)!
        }
        
    }
    
    func obtenerInfo() {
        showLoadingView(vista: self)
        viewModel.getActividad { (Result) in
            
            
            self.ArrayActividadEnPlanta = (Result?.plants)!
            self.ArrayActividadEnPlantaOriginal = (Result?.plants)!
            self.tableView.reloadData()
            HideLoadingView(vista: self)
                }
        }
    
}
