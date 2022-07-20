//
//  SolicitudesViewController.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 10/07/22.
//

import UIKit
import SideMenu

class SolicitudesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var Buscador: UITextField!
    
    //MARK: - IBActions    
    @IBAction func SideMenu(_ sender: Any) {
        
        present(SideMenuManager.default.leftMenuNavigationController!, animated: true, completion: nil)
        
    }
    //MARK: - Properties
    var viewModel = SolicitudesViewModel()
    var ArraySolicitudes : [(SolicitudesModel.Datas)] = []
    var ArraySolicitudesOriginal : [(SolicitudesModel.Datas)] = []
    var infoVeh: SolicitudesModel.Datas?
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
                    
                    self.ArraySolicitudes.removeAll()
                    self.ArraySolicitudes = result
                    self.tableView.setContentOffset(CGPoint(x: 0, y: 0 - self.tableView.contentInset.top), animated: true)
                    self.tableView.reloadData()
                    
                }
                
            }
            
        }
    
    func BuscarNombre(nombre:String, completion: @escaping (_ result: [(SolicitudesModel.Datas)])->()){
            
            var local:[(SolicitudesModel.Datas)] = []
            let cad = nombre.lowercased()
            
            if cad == "" || cad == " "{
                
                print("entre aca")
                completion(ArraySolicitudesOriginal)
                
            }else{
                
                print("no era vacio")
                
                for t in ArraySolicitudesOriginal{
                    
                    var tag = ""
                    
                    if t.route_name != "" {
                        
                        tag = "\(t.route_name!)"
                        
                        
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
        
        id = ArraySolicitudes[indexPath.row].id!
        infoVeh = ArraySolicitudes[indexPath.row]

        self.performSegue(withIdentifier: "showSolicitudid", sender: nil)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "showSeguiviajeReusable", for: indexPath) as! SeguiViajeTableViewCell
        cell.OrigenDestino.text = ArraySolicitudes[index].route_name
        
        var StringProduct: String = ""
        for string2 in ArraySolicitudes[index].products! {
            
            if StringProduct == "" {
                
                StringProduct = string2
                
            }else{
                
                StringProduct =  "\(StringProduct) \(string2)"
                
            }
        }
        cell.TipoDeCarga.text = StringProduct
        cell.StatusFecha.text = ArraySolicitudes[index].business?.description!
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArraySolicitudes.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showSolicitudid" {
            let destinationVC = segue.destination as! SolicitudViewController
            destinationVC.id = id
            destinationVC.infoVeh = infoVeh
        }
        
    }
    
    func obtenerInfo() {
        showLoadingView(vista: self)
        viewModel.getSolicitudes { (Result) in
            
            if let arraysolicitud = Result?.data!, let arraysolicitudoriginal = Result?.data! {
                self.ArraySolicitudes = arraysolicitud
                self.ArraySolicitudesOriginal = arraysolicitudoriginal
                self.tableView.reloadData()
                
            }
            HideLoadingView(vista: self)
                }
        }
    

}
