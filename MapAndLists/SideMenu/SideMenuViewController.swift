//
//  SideMenuTableViewController.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 27/06/22.
//

import UIKit
import SDWebImage

class SideMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ImagenClient: UIImageView!
    @IBOutlet weak var ClienteLabel: UILabel!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArraySideMenu.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let storyBoard : UIStoryboard = UIStoryboard(name: "InicioUbicacionVeh", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "showInicio") as! UINavigationController
            goToView(view: nextViewController)
        case 1:
            let storyBoard : UIStoryboard = UIStoryboard(name: "ServiciosSolicitados", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "showServicioSolicitado") as! UINavigationController
            goToView(view: nextViewController)
        case 2:
            let storyBoard : UIStoryboard = UIStoryboard(name: "SeguimientoDeViajes", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "showSeguiViaje") as! UINavigationController
            goToView(view: nextViewController)
        case 3:
            let storyBoard : UIStoryboard = UIStoryboard(name: "ActEnPlanta", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "showActPlanta") as! UINavigationController
            goToView(view: nextViewController)
        case 4:
            let storyBoard : UIStoryboard = UIStoryboard(name: "Solicitudes", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "showSolicitudes") as! UINavigationController
            goToView(view: nextViewController)
        case 5:
            let storyBoard : UIStoryboard = UIStoryboard(name: "historicoViajes", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "showHistorico") as! UINavigationController
            goToView(view: nextViewController)
        case 6:
            let storyBoard : UIStoryboard = UIStoryboard(name: "NvSolicitud", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "showNvSolicitud") as! UINavigationController
            goToView(view: nextViewController)
        case 7:
            defaults.set(nil, forKey: "bigcustomer_id")
           defaults.set(nil, forKey: "bigcustomer_uuid")
           defaults.set(nil, forKey: "photo_bigcustomer")
           defaults.set(nil, forKey: "bigcustomer_uuid")
           defaults.set(nil, forKey: "username")
           defaults.set(nil, forKey: "id")
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "showMain") as! UINavigationController
            goToView(view: nextViewController)
        default:
            break
        }
    }
    
    func goToView(view: UINavigationController) {
        
        UIApplication.shared.windows.first?.rootViewController = view
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuReusable", for: indexPath) as! SideMenuTableViewCell
        cell.MenuLateralLabel.text = ArraySideMenu[indexPath.row]
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "SideMenuCell", bundle: nil), forCellReuseIdentifier: "SideMenuReusable")
        setUpUI()
        
    }
    //MARK: - Properties
    var ArraySideMenu: [(String)] = []
    
    //MARK: - Constantes
    let defaults = UserDefaults.standard
    
    
    
    func setUpUI() {
        let ImagenClienteURL = URL(string: defaults.string(forKey: "photo_bigcustomer")!)
        ImagenClient.sd_setImage(with: ImagenClienteURL)
        ClienteLabel.text = defaults.string(forKey: "username")
       // ArraySideMenu.append(("INICIO"))
        ArraySideMenu.append(("UBICACIÓN DE VEHÍCULOS"))
        ArraySideMenu.append(("SERVICIOS SOLICITADOS"))
        ArraySideMenu.append(("SEGUIMIENTO DE VIAJES"))
        ArraySideMenu.append(("ACTIVIDAD EN PLANTA"))
        ArraySideMenu.append(("SOLICITUDES"))
        ArraySideMenu.append(("HISTÓRICOS DE VIAJES"))
        ArraySideMenu.append(("NUEVA SOLICITUD DE VIAJES"))
        ArraySideMenu.append(("CERRAR SESIÓN"))
    }
}
