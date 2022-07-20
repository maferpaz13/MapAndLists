//
//  SeguimientoViajeViewController.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 30/06/22.
//

import UIKit
import iOSDropDown
import SideMenu

class SeguimientoViajeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate {
    
    
    //MARK: - IBoutlets
    @IBOutlet weak var Buscador: UITextField!
    @IBOutlet weak var tableView: UITableView!
    //MARK: - IBActions
    @IBAction func SideMenu(_ sender: Any) {
        
        present(SideMenuManager.default.leftMenuNavigationController!, animated: true, completion: nil)
        
    }
    //MARK: - Properties
    var ViewModel = SeguimientoViajeViewModel()
    var ArraySeguimientoViaje : [(SeguimientoViajeModel.Requests)] = []
    var ArraySeguimientoViajeOriginal : [(SeguimientoViajeModel.Requests)] = []
    var request_id:Int = 0
    
    //MARK: - Constantes
    let defaults = UserDefaults.standard
    
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
                    
                    self.ArraySeguimientoViaje.removeAll()
                    self.ArraySeguimientoViaje = result
                    self.tableView.setContentOffset(CGPoint(x: 0, y: 0 - self.tableView.contentInset.top), animated: true)
                    self.tableView.reloadData()
                    
                }
                
            }
            
        }
    
    func BuscarNombre(nombre:String, completion: @escaping (_ result: [(SeguimientoViajeModel.Requests)])->()){
            
            var local:[(SeguimientoViajeModel.Requests)] = []
            let cad = nombre.lowercased()
            
            if cad == "" || cad == " "{
                
                print("entre aca")
                completion(ArraySeguimientoViajeOriginal)
                
            }else{
                
                print("no era vacio")
                
                for t in ArraySeguimientoViajeOriginal{
                    
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
        
        request_id = ArraySeguimientoViaje[indexPath.row].request_id!
        
        self.performSegue(withIdentifier: "showServID", sender: nil)
        
        return
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArraySeguimientoViaje.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showServID" {
            let destinationVC = segue.destination as! ServiciosIDViewController
            destinationVC.request_id = request_id
            destinationVC.whatStoryboard = .SeguimientoDeViajes
            }

        }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "showSeguiviajeReusable", for: indexPath) as! SeguiViajeTableViewCell
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: ArraySeguimientoViaje[index].loading_date!)
        dateFormatter.dateFormat = "yy/MM/dd"
        let resultString = dateFormatter.string(from: date!)
        
        
        cell.OrigenDestino.text = "\(ArraySeguimientoViaje[index].city_origin!) - \(ArraySeguimientoViaje[index].city_destin!)"
        cell.TipoDeCarga.text = ArraySeguimientoViaje[index].commercial_product!
        cell.StatusFecha.text = "\(ArraySeguimientoViaje[index].request_status!)\(resultString) \(ArraySeguimientoViaje[index].fringe_time!)"
        
        return cell
        
    }
    
    func obtenerInfo() {
        showLoadingView(vista: self)
        ViewModel.getSeguimiento { (Result) in
            
            
            self.ArraySeguimientoViaje = (Result?.requests)!
            self.ArraySeguimientoViajeOriginal = (Result?.requests)!
            self.tableView.reloadData()
            HideLoadingView(vista: self)
                }
        }
    
    
}
