//
//  NvSolicitud2VistaViewController.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 12/07/22.
//

import UIKit
import NotificationBannerSwift

enum opcionSeleccionada {
    case negocioButton
    case ConfigButton
    case typeVehButton
    case rutaButton
    case TypeSolicitudButton
}

enum Vistas {
    
    case NvSolicitud2ViewController
    case NvSolicitud3ViewController
    case NvSolicitud4ViewController
    case NvSolicitud5ViewController
}

class NvSolicitud2VistaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var negocioLabel: UILabel!
    @IBOutlet weak var configLabel: UILabel!
    @IBOutlet weak var tipoVehLabel: UILabel!
    @IBOutlet weak var buttonout: UIButton!
    @IBOutlet weak var rutaLabel: UILabel!
    @IBOutlet weak var tipoSolicitudLabel: UILabel!
    
    //MARK: - IBActions
    
    
    @IBAction func ContinuarButton(_ sender: Any) {
        
        self.performSegue(withIdentifier: "showPaso2", sender: nil)
        
    }
    
    @IBAction func negocioButton(_ sender: Any) {
        self.view.endEditing(true)
        
        ViewModel.getNegocio { (Result) in
            
            if let arraynego = Result?.data {
                
                self.opcionesSeleccionados = .negocioButton
                self.arrayNegocios = arraynego
                self.vistaTable.tablaopciones.reloadData()
                self.vistaTable.isHidden = false
                self.vistaTable.titulo.text = "Negocio"
                
            }
            
        }
    }
    
    @IBAction func ConfigButton(_ sender: Any) {
        
        ViewModel.getConfiguracion { (Result) in
            
            if let arrayconfig = Result?.data {
                
                self.opcionesSeleccionados = .ConfigButton
                self.arrayConfig = arrayconfig
                self.vistaTable.tablaopciones.reloadData()
                self.vistaTable.isHidden = false
                self.vistaTable.titulo.text = "Configuración de Vehículo"
                
            }
            
        }
        
    }
    
    @IBAction func typeVehButton(_ sender: Any) {
        ViewModel.getTipoVeh { (Result) in
            
            if let arraytipovehi = Result?.data {
                
                self.opcionesSeleccionados = .typeVehButton
                self.arrayTipoVeh = arraytipovehi
                self.vistaTable.tablaopciones.reloadData()
                self.vistaTable.isHidden = false
                self.vistaTable.titulo.text = "Tipo de Vehiculo"
                
            }
            
        }
        
    }
    
    @IBAction func rutaButton(_ sender: Any) {
            if id != 0 {
                ViewModel.getRuta(id: id) { (Result) in
            
            if let arrayrutaa = Result?.data {
                
                self.opcionesSeleccionados = .rutaButton
                self.arrayRuta = arrayrutaa
                self.vistaTable.tablaopciones.reloadData()
                self.vistaTable.isHidden = false
                self.vistaTable.titulo.text = "Ruta"
                }
            }
            
        }else{
            NotificationBanner.init(title: "Error", subtitle: "Seleccione el Negocio", style: .warning).show()
        }
    }
    
    @IBAction func TypeSolicitudButton(_ sender: Any) {
        ViewModel.getTipoSolicitud { (Result) in
            
            if let arraytiposoli = Result?.data {
                
                self.opcionesSeleccionados = .TypeSolicitudButton
                self.arrayTipoSolici = arraytiposoli
                self.vistaTable.tablaopciones.reloadData()
                self.vistaTable.isHidden = false
                self.vistaTable.titulo.text = "Tipo de Solicitud"
                
            }else{
                NotificationBanner.init(title: "Error", subtitle: "No hay Tipos de Solicitudes", style: .warning).show()
            }
            
        }
        
    }
    
    //MARK: - Properties
    
    var vistaTable: VistaTable!
    var ViewModel = CreacionServicioViewModel()
    var opcionesSeleccionados: opcionSeleccionada!
    var arrayNegocios : [(NegocioModelo.Datas)] = []
    var arrayConfig: [(ConfiguracionModelo.Datas)] = []
    var arrayTipoVeh: [(TipoVehModelo.Datas)] = []
    var arrayRuta: [(RutaModelo.Datas)] = []
    var arrayTipoSolici: [(TipoSolicitudModelo.Datas)] = []
    static var vistas: Vistas!
    var id: Int = 0
    static var navigation: UINavigationController? = nil
    static var label: UILabel? = nil
    //MARK: - Constants
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        vistaTable.vistaCorner.layer.cornerRadius = 8
        vistaTable.vistaCorner.layer.masksToBounds = true
        NvSolicitud3ViewController.navigation = self.navigationController
        buttonout.layer.cornerRadius = 8
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        NvSolicitud2VistaViewController.vistas = .NvSolicitud2ViewController
        NvSolicitud2VistaViewController.label?.text = "Información básica"
    }
    
    
    
    @objc func CloseVistaTable(_ sender: UITapGestureRecognizer) {
        
        vistaTable.isHidden = true
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        vistaTable.isHidden = true
        
        switch opcionesSeleccionados {
        case .negocioButton:
            negocioLabel.text = arrayNegocios[indexPath.row].description!
            id = arrayNegocios[indexPath.row].id!
            NvSolicitud5ViewController.creacionstruct.business_id = arrayNegocios[indexPath.row].id!
        case .ConfigButton:
            configLabel.text =
            arrayConfig[indexPath.row].description!
            NvSolicitud5ViewController.creacionstruct.carconfig_id =
            arrayConfig[indexPath.row].id!
        case .typeVehButton:
            tipoVehLabel.text =
            arrayTipoVeh[indexPath.row].name!
            NvSolicitud5ViewController.creacionstruct.cartype_id = arrayTipoVeh[indexPath.row].id!
        case .rutaButton:
            rutaLabel.text = arrayRuta[indexPath.row].name!
            NvSolicitud5ViewController.creacionstruct.businessroute_id = arrayRuta[indexPath.row].id!
        case .TypeSolicitudButton:
            tipoSolicitudLabel.text =
            arrayTipoSolici[indexPath.row].name!
            NvSolicitud5ViewController.creacionstruct.booking_type_id = arrayTipoSolici[indexPath.row].id!
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch opcionesSeleccionados {
        case .negocioButton:
            if arrayNegocios.count <= 9 {
            self.vistaTable.heigt.constant = CGFloat(arrayNegocios.count) * 40
            }else{
                self.vistaTable.heigt.constant = 8 * 40
            }
            return arrayNegocios.count
        case .ConfigButton:
            if arrayConfig.count <= 8 {
            self.vistaTable.heigt.constant = CGFloat(arrayConfig.count) * 40
            }else{
            self.vistaTable.heigt.constant = 8 * 40
            }
            return arrayConfig.count
        case .typeVehButton:
            if arrayTipoVeh.count <= 8 {
            self.vistaTable.heigt.constant = CGFloat(arrayTipoVeh.count) * 40
            }else{
                self.vistaTable.heigt.constant = 8 * 40
            }
            return arrayTipoVeh.count
        case .rutaButton:
            if arrayRuta.count <= 8 {
            self.vistaTable.heigt.constant = CGFloat(arrayRuta.count) * 40
        }else{
            self.vistaTable.heigt.constant = 8 * 40
        }
            return arrayRuta.count
        case .TypeSolicitudButton:
            if arrayTipoSolici.count <= 8 {
            self.vistaTable.heigt.constant = CGFloat(arrayTipoSolici.count) * 40
            }else{
                self.vistaTable.heigt.constant = 8 * 40
            }
            return arrayTipoSolici.count
        default:
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "showCelVistaTable", for: indexPath) as! InfoCellTableViewCell
        
        
        switch opcionesSeleccionados {
        case .negocioButton :
            cell.Thingslabel.text = arrayNegocios[index].description!
            return cell
        case .ConfigButton :
            cell.Thingslabel.text = arrayConfig[index].description!
            return cell
        case .typeVehButton:
            cell.Thingslabel.text = arrayTipoVeh[index].name!
        case .rutaButton:
            cell.Thingslabel.text = arrayRuta[index].name!
        case .TypeSolicitudButton:
            cell.Thingslabel.text = arrayTipoSolici[index].name!
        default:
            break
            
        }
        return cell
    }
    
    func setUpUI() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.CloseVistaTable(_:)))
        vistaTable = SetupValorOfertar(vista: self, Titulo: "Negocio", cancelar: tap)
        vistaTable.tablaopciones.register(UINib(nibName: "InfoCell", bundle: nil), forCellReuseIdentifier: "showCelVistaTable")
        
        
    }
    
}

