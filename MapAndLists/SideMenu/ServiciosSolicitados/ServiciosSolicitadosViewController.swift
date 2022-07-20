//
//  ServiciosSolicitadosViewController.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 28/06/22.
//

import UIKit
import iOSDropDown
import SideMenu

class ServiciosSolicitadosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate {
    
    //MARK: - IBoutlets
    @IBOutlet weak var Buscador: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - IBActions
    @IBAction func SideMenu(_ sender: Any) {
        
        present(SideMenuManager.default.leftMenuNavigationController!, animated: true, completion: nil)
    }
    
    //MARK: - Properties
    var ArrayServiciosSolicitados: [(ServiciosSolicitadosModel.Requests)] = []
    var ArrayServiciosSolicitadosOriginal: [(ServiciosSolicitadosModel.Requests)] = []
    var ViewModel = ServiciosSolicitadosViewModel()
    var request_id:Int = 0
    
    //MARK: - Constantes
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ServiciosSolicitadosCell", bundle: nil), forCellReuseIdentifier: "showServSolReusable")
        ConfigSideMenu(navigation: self.navigationController!)
        self.hideKeyboardWhenTappedAround()
        obtenerInfo()
        Buscador.delegate = self
        Buscador.addTarget(self, action: #selector(self.myTextFieldDidChange), for: .editingChanged)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showServID" {
            let destinationVC = segue.destination as! ServiciosIDViewController
            destinationVC.request_id = request_id
            destinationVC.whatStoryboard = .ServiciosSolicitados
            }
        }
    
    @objc func myTextFieldDidChange(_ textField: UITextField) {
            
            if textField == Buscador{
                
                BuscarNombre(nombre:Buscador.text!){
                    
                    (result) -> () in
                    
                    self.ArrayServiciosSolicitados.removeAll()
                    self.ArrayServiciosSolicitados = result
                    self.tableView.setContentOffset(CGPoint(x: 0, y: 0 - self.tableView.contentInset.top), animated: true)
                    self.tableView.reloadData()
                    
                }
                
            }
            
        }
    
    func BuscarNombre(nombre:String, completion: @escaping (_ result: [(ServiciosSolicitadosModel.Requests)])->()){
            
            var local:[(ServiciosSolicitadosModel.Requests)] = []
            let cad = nombre.lowercased()
            
            if cad == "" || cad == " "{
                
                print("entre aca")
                completion(ArrayServiciosSolicitadosOriginal)
                
            }else{
                
                print("no era vacio")
                
                for t in ArrayServiciosSolicitadosOriginal{
                    
                    var tag = ""
                    
                    if t.city_origin != ""
                        && t.city_destin != ""{
                        
                        tag = "\(t.city_origin!) - \(t.city_destin!)"
                        
                        
                    }else{
                        
                        if t.city_origin != ""{
                            
                            tag = "\(t.city_origin!))"
                            
                            
                        }else
                        
                        if t.city_destin != ""{
                            
                            tag = "\(t.city_destin!)"
                            
                        }else{
                            
                            tag = "N/A"
                            
                        }
                        
                    }
                    
                    if tag.lowercased().range(of:"\(cad)", options:[.caseInsensitive,.diacriticInsensitive]) != nil{
                        
                        local.append(t)
                        
                    }
                    
                }
                
                completion(local)
                
            }
            
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        request_id = ArrayServiciosSolicitados[indexPath.row].request_id!
        
        self.performSegue(withIdentifier: "showServID", sender: nil)
        
        return
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArrayServiciosSolicitados.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let index = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "showServSolReusable", for: indexPath) as! ServiciosSolicitadosTableViewCell
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: ArrayServiciosSolicitados[index].loading_date!)
        dateFormatter.dateFormat = "yy/MM/dd"
        let resultString = dateFormatter.string(from: date!)
        
        
        cell.EmpresaLabel.text = "\(ArrayServiciosSolicitados[index].city_origin!) - \(ArrayServiciosSolicitados[index].city_destin!)"
        cell.NombreLabel.text = ArrayServiciosSolicitados[index].commercial_product!
        cell.NumLabel.text = "\(ArrayServiciosSolicitados[index].request_status!) \(resultString) \(ArrayServiciosSolicitados[index].fringe_time!)"
        
        return cell
    }
    
    
    func obtenerInfo() {
        showLoadingView(vista: self)
        ViewModel.getServicios { (Result) in
            
            
            self.ArrayServiciosSolicitados = (Result?.requests)!
            self.ArrayServiciosSolicitadosOriginal = (Result?.requests)!
            self.tableView.reloadData()
            HideLoadingView(vista: self)
                }
        }
}
