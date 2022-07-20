//
//  ServiciosIDViewController.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 29/06/22.
//

import UIKit
import NotificationBannerSwift

enum Storyboards {
    
case ServiciosSolicitados
case SeguimientoDeViajes
case historicoViajes
    
}

class ServiciosIDViewController: UIViewController{
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var ViewServ: UIView!
    @IBOutlet weak var LineaServ: UIView!
    @IBOutlet weak var ServicioIDLabel: UILabel!
    @IBOutlet weak var lineaResum: UIView!
    @IBOutlet weak var ResumenServView: UIView!
    @IBOutlet weak var InfoResServView: UIView!
    @IBOutlet weak var lineaResum2: UIView!
    @IBOutlet weak var lineaDatos: UIView!
    @IBOutlet weak var expandirServImageView: UIImageView!
    @IBOutlet weak var lineaDatos2: UIView!
    @IBOutlet weak var DatosCondView: UIView!
    @IBOutlet weak var InfoDatosCondView: UIView!
    @IBOutlet weak var mapaSegView: UIView!
    @IBOutlet weak var lineaMapa: UIView!
    @IBOutlet weak var lineaDescargue: UIView!
    @IBOutlet weak var GuiaDescargaView: UIView!
    @IBOutlet weak var lineaBitacora: UIView!
    @IBOutlet weak var BitacoraView: UIView!
    @IBOutlet weak var EstadoLabel: UILabel!
    @IBOutlet weak var IDBookingLabel: UILabel!
    @IBOutlet weak var FechaCreacionLabel: UILabel!
    @IBOutlet weak var RutaLabel: UILabel!
    @IBOutlet weak var CargaLabel: UILabel!
    @IBOutlet weak var ViewInfo: UIView!
    @IBOutlet weak var expandirInfoImageView: UIImageView!
    @IBOutlet weak var TipoNegociacionLabel: UILabel!
    @IBOutlet weak var VehSolicitadoLabel: UILabel!
    @IBOutlet weak var lineaInfoView: UIView!
    @IBOutlet weak var RestriccionesLabel: UILabel!
    @IBOutlet weak var DemorarConductorLabel: UILabel!
    @IBOutlet weak var FinServicioLabel: UILabel!
    @IBOutlet weak var tEsperaCargueLabel: UILabel!
    @IBOutlet weak var tCargueLabel: UILabel!
    @IBOutlet weak var tEsperaDescargueLabel: UILabel!
    @IBOutlet weak var tDescargue: UILabel!
    @IBOutlet weak var ManifiestoDeCargaLabel: UILabel!
    @IBOutlet weak var ConductorAsignadoName: UILabel!
    @IBOutlet weak var CAsignadoDocumentLabel: UILabel!
    @IBOutlet weak var CAsigTlfLabel: UILabel!
    @IBOutlet weak var CAsigPlacaLabel: UILabel!
    @IBOutlet weak var CAsigMarcaLabel: UILabel!
    @IBOutlet weak var CAsigColorLabel: UILabel!
    @IBOutlet weak var CAsigConfigLabel: UILabel!
    @IBOutlet weak var TrailerPlacaLabel: UILabel!
    @IBOutlet weak var TrailerMarcaLabel: UILabel!
    @IBOutlet weak var TrailerColorLabel: UILabel!
    @IBOutlet weak var TrailerModeloLabel: UILabel!
    @IBOutlet weak var DatosCondExpandir: UIImageView!
    @IBOutlet weak var ResumServExpandir: UIImageView!
    @IBOutlet weak var VistaLineas: UIView!
    @IBOutlet weak var ImageInicioServ: UIImageView!
    @IBOutlet weak var lineaInicioCargue: UIImageView!
    @IBOutlet weak var ImageCargue: UIImageView!
    @IBOutlet weak var LineaCargueEnruta: UIImageView!
    @IBOutlet weak var ImageEnRuta: UIImageView!
    @IBOutlet weak var LineaEnRutaDescargue: UIImageView!
    @IBOutlet weak var ImageDescargue: UIImageView!
    @IBOutlet weak var lineaaDescargueFin: UIImageView!
    @IBOutlet weak var ImageFindeServ: UIImageView!
    @IBOutlet weak var ServicioLabelName: UILabel!
    @IBOutlet weak var VerDocumento: UILabel!
    @IBOutlet weak var VerDocumento2: UILabel!
    @IBOutlet weak var BitacoraLabelName: UILabel!
    
    // MARK: - IBActions
    @IBAction func BackButton(_ sender: Any) {
        
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func ServicioButtonAction(_ sender: Any) {
        
        if ViewServ.isHidden == true {
            
        expandirServImageView.transform = expandirServImageView.transform.rotated(by: .pi / 2)
        }else{
            expandirServImageView.transform = expandirServImageView.transform.rotated(by: ((.pi / 2) * -1))
        }
        
        UIView.transition(with: ViewInfo, duration: 0.4,
                          options: .transitionCrossDissolve,
                          animations: {
            self.ViewServ.isHidden = !self.ViewServ.isHidden
                      })
        
        
    }
    
    @IBAction func InfoServButton(_ sender: Any) {
        
        if ViewInfo.isHidden == true {
            
        expandirInfoImageView.transform = expandirInfoImageView.transform.rotated(by: .pi / 2)
        }else{
            expandirInfoImageView.transform = expandirInfoImageView.transform.rotated(by: ((.pi / 2) * -1))
        }
        
        lineaResum.isHidden = !lineaResum.isHidden
        UIView.transition(with: ViewInfo, duration: 0.4,
                          options: .transitionCrossDissolve,
                          animations: {
            self.ViewInfo.isHidden = !self.ViewInfo.isHidden
                      })
        
    }
    @IBAction func ResumServButton(_ sender: Any) {
        if InfoResServView.isHidden == true {
            
        ResumServExpandir.transform = ResumServExpandir.transform.rotated(by: .pi / 2)
        }else{
            ResumServExpandir.transform = ResumServExpandir.transform.rotated(by: ((.pi / 2) * -1))
        }
        
        UIView.transition(with: InfoResServView, duration: 0.4,
                          options: .transitionCrossDissolve,
                          animations: {
            self.InfoResServView.isHidden = !self.InfoResServView.isHidden
                      })
    }
    
    @IBAction func DatosCondButton(_ sender: Any) {
        
        if InfoDatosCondView.isHidden == true {
            
        DatosCondExpandir.transform = DatosCondExpandir.transform.rotated(by: .pi / 2)
        }else{
            DatosCondExpandir.transform = DatosCondExpandir.transform.rotated(by: ((.pi / 2) * -1))
        }
        
        UIView.transition(with: InfoDatosCondView, duration: 0.4,
                          options: .transitionCrossDissolve,
                          animations: {
            self.InfoDatosCondView.isHidden = !self.InfoDatosCondView.isHidden
                      })
    }
    
    @IBAction func GuiaCargaButton(_ sender: Any) {
        self.performSegue(withIdentifier: "showGuia", sender: nil)
        voyACargue = true
        return
    }
    @IBAction func GuiaDescargaButtton(_ sender: Any) {
        self.performSegue(withIdentifier: "showGuia", sender: nil)
        voyACargue = false
        return
        
    }
    
    @IBAction func BitacoraButton(_ sender: Any) {
        self.performSegue(withIdentifier: "BitacoraDeViaje", sender: nil)
        voyACargue = false
        return
    }
    
    // MARK: - Properties
    var request_id:Int = 0
    var ViewModel = DetalleServViewModel()
    var requestInfo: DetalleServModel.DetalleServData!
    var arrayRequest: [(DetalleServModel.DetalleServData)] = []
    var whatStoryboard: Storyboards!
    var voyACargue: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("whatStoryboard \(String(describing: whatStoryboard))")
        LineaServ.isHidden = false
        obtenerInfo()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showGuia" {
            let destinationVC = segue.destination as! GuiadeCargaViewController
            destinationVC.ArrayDetallesServ = (requestInfo.full?.products)!
            
            if voyACargue == true {
                destinationVC.GuiaCarga = "Guia de Descarga"
            }else{
                destinationVC.GuiaCarga = "Guia de Carga"
                }
            
        }else if segue.identifier == "BitacoraDeViaje" {
            
            let destinationVC = segue.destination as! BitacoraDeViajeViewController
            destinationVC.request_id = request_id
            }
        }
    
    func obtenerInfo() {
        
        showLoadingView(vista: self)
        ViewModel.getDetalle(request_id: request_id) {  (Result) in
            
            self.setUpUI(modelo: Result!)
           
        }
        
    }
    
    func setUpUIFlujoServ() {
        
        ImageInicioServ.backgroundColor = UIColor.init(named: "GrisClaro")!
        ImageInicioServ.layer.cornerRadius = 8
        ImageCargue.backgroundColor = UIColor.init(named: "GrisClaro")!
        ImageCargue.layer.cornerRadius = 8
        ImageEnRuta.backgroundColor = UIColor.init(named: "GrisClaro")!
        ImageEnRuta.layer.cornerRadius = 8
        ImageDescargue.backgroundColor = UIColor.init(named: "GrisClaro")!
        ImageDescargue.layer.cornerRadius = 8
        ImageFindeServ.backgroundColor = UIColor.init(named: "GrisClaro")!
        ImageFindeServ.layer.cornerRadius = 8
        lineaInicioCargue.backgroundColor = UIColor.init(named: "GrisClaro")!
        LineaCargueEnruta.backgroundColor = UIColor.init(named: "GrisClaro")!
        LineaEnRutaDescargue.backgroundColor = UIColor.init(named: "GrisClaro")!
        lineaDescargue.backgroundColor = UIColor.init(named: "GrisClaro")!
        lineaaDescargueFin.backgroundColor = UIColor.init(named: "GrisClaro")!
        
        switch requestInfo.full?.requeststatus?.id {
        case 21 :
            ImageInicioServ.backgroundColor = UIColor.init(named: "NaranjaFx")!
            
        case 17 :
            ImageInicioServ.backgroundColor = UIColor.init(named: "NaranjaFx")!
            ImageCargue.backgroundColor = UIColor.init(named: "NaranjaFx")!
            lineaInicioCargue.backgroundColor = UIColor.init(named: "NaranjaFx")!
        case 7 :
            ImageInicioServ.backgroundColor = UIColor.init(named: "NaranjaFx")!
            ImageCargue.backgroundColor = UIColor.init(named: "NaranjaFx")!
            ImageEnRuta.backgroundColor = UIColor.init(named: "NaranjaFx")!
            lineaInicioCargue.backgroundColor = UIColor.init(named: "NaranjaFx")!
            LineaCargueEnruta.backgroundColor = UIColor.init(named: "NaranjaFx")!
        case 18 :
            ImageInicioServ.backgroundColor = UIColor.init(named: "NaranjaFx")!
            ImageCargue.backgroundColor = UIColor.init(named: "NaranjaFx")!
            ImageEnRuta.backgroundColor = UIColor.init(named: "NaranjaFx")!
            ImageDescargue.backgroundColor = UIColor.init(named: "NaranjaFx")!
            lineaInicioCargue.backgroundColor = UIColor.init(named: "NaranjaFx")!
            LineaCargueEnruta.backgroundColor = UIColor.init(named: "NaranjaFx")!
            LineaEnRutaDescargue.backgroundColor = UIColor.init(named: "NaranjaFx")!
        case 10 :
            ImageInicioServ.backgroundColor = UIColor.init(named: "NaranjaFx")!
            ImageCargue.backgroundColor = UIColor.init(named: "NaranjaFx")!
            ImageEnRuta.backgroundColor = UIColor.init(named: "NaranjaFx")!
            ImageDescargue.backgroundColor = UIColor.init(named: "NaranjaFx")!
            ImageFindeServ.backgroundColor = UIColor.init(named: "NaranjaFx")!
            lineaInicioCargue.backgroundColor = UIColor.init(named: "NaranjaFx")!
            LineaCargueEnruta.backgroundColor = UIColor.init(named: "NaranjaFx")!
            LineaEnRutaDescargue.backgroundColor = UIColor.init(named: "NaranjaFx")!
            lineaDescargue.backgroundColor = UIColor.init(named: "NaranjaFx")!
        default:
            break
        }
        
    }
    
    
    func setUpUI(modelo: DetalleServModel.DetalleServData){
        
        self.requestInfo = modelo
        let tap = UITapGestureRecognizer(target: self, action: #selector(ServiciosIDViewController.tapFunction))
                VerDocumento.isUserInteractionEnabled = true
                VerDocumento.addGestureRecognizer(tap)
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(ServiciosIDViewController.tapFunction2))
                VerDocumento2.isUserInteractionEnabled = true
                VerDocumento2.addGestureRecognizer(tap2)
                
        self.ServicioIDLabel.text = "Servicio ID \(self.requestInfo.full!.id!)"
        self.EstadoLabel.text = self.requestInfo.full!.requeststatus?.name
        self.FechaCreacionLabel.text = self.requestInfo.full?.created_at!
        self.RutaLabel.text = "\(self.requestInfo.full!.origen!) - \(self.requestInfo.full!.destino!)"
        self.TipoNegociacionLabel.text = self.requestInfo.full!.negotiated
        self.VehSolicitadoLabel.text = "\(self.requestInfo.full!.requested_vehicles!) - \(self.requestInfo.full!.packing!)"
        self.RestriccionesLabel.text = self.requestInfo.full!.restrictions
        
        self.DemorarConductorLabel.text = self.requestInfo.data!.delay_driver
        self.FinServicioLabel.text = self.requestInfo.data!.finish_service
        self.tEsperaCargueLabel.text = self.requestInfo.data!.time_wait_load
        self.tCargueLabel.text = self.requestInfo.data!.time_load
        self.tEsperaDescargueLabel.text = self.requestInfo.data!.time_wait_unload
        self.tDescargue.text = self.requestInfo.data!.time_unload
        self.ManifiestoDeCargaLabel.text = self.requestInfo.data!.timesheet
        self.ConductorAsignadoName.text = self.requestInfo.full!.driver
        if let asignadodoc = self.requestInfo.full?.driver_doc {
        self.CAsignadoDocumentLabel.text = "\(asignadodoc)"
        }
        if let asigadotlf = self.requestInfo.full?.driver_doc {
        self.CAsigTlfLabel.text = "\(asigadotlf)"
        }
        if let asigplaca = self.requestInfo.full!.placa {
        self.CAsigPlacaLabel.text = asigplaca
        }
        if let asigmarca = self.requestInfo.full?.carmark?.name {
        self.CAsigMarcaLabel.text = "\(asigmarca)"
        }
        if let asigcolor = self.requestInfo.full?.vehicle?.carcolor_id {
        self.CAsigColorLabel.text = "\(asigcolor)"
        }
        if let asigconfig = self.requestInfo.full!.code {
        self.CAsigConfigLabel.text = asigconfig
        }
        
        
        if let _ =  self.requestInfo.full?.trailer_placa {
            
            self.TrailerPlacaLabel.text = "\(self.requestInfo.full!.trailer_placa!)"
            self.TrailerMarcaLabel.text = "\(self.requestInfo.full!.trailer_marca!.name!)"
            self.TrailerColorLabel.text = self.requestInfo.full!.trailer_color!.name!
            self.TrailerModeloLabel.text = "\(self.requestInfo.full!.trailer_model!)"
            
        }else {
            self.TrailerPlacaLabel.isHidden = true
            self.TrailerMarcaLabel.isHidden = true
            self.TrailerColorLabel.isHidden = true
            self.TrailerModeloLabel.isHidden = true
        }
        
        switch whatStoryboard {
            
        case .ServiciosSolicitados:
            
            
            expandirServImageView.transform = expandirServImageView.transform.rotated(by: .pi / 2)
            
            ViewServ.isHidden = false
            lineaInfoView.isHidden = false
            ViewInfo.isHidden = true
            ResumenServView.isHidden = true
            InfoResServView.isHidden = true
            InfoDatosCondView.isHidden = true
            lineaResum.isHidden = true
            lineaResum2.isHidden = true
            lineaDatos.isHidden = true
            lineaDatos2.isHidden = true
            lineaBitacora.isHidden = true
            lineaDescargue.isHidden = true
            DatosCondView.isHidden = true
            GuiaDescargaView.isHidden = true
            BitacoraView.isHidden =  true
            VistaLineas.isHidden = true
            
        case .SeguimientoDeViajes:
            
            setUpUIFlujoServ()
            expandirServImageView.transform = expandirServImageView.transform.rotated(by: .pi / 2)
            ViewServ.isHidden = false
            lineaInfoView.isHidden = false
            ViewInfo.isHidden = true
            ResumenServView.isHidden = false
            lineaResum.isHidden = true
            lineaResum2.isHidden = false
            InfoResServView.isHidden = true
            lineaDatos.isHidden = true
            lineaDatos2.isHidden = false
            lineaBitacora.isHidden = false
            lineaDescargue.isHidden = false
            DatosCondView.isHidden = false
            InfoDatosCondView.isHidden = true
            GuiaDescargaView.isHidden = false
            BitacoraView.isHidden =  false
            VistaLineas.isHidden = false
            
        case .historicoViajes:
            
            //setUpUIFlujoServ()
            
            expandirServImageView.transform = expandirServImageView.transform.rotated(by: .pi / 2)
            
            ViewServ.isHidden = false
            lineaInfoView.isHidden = false
            ViewInfo.isHidden = true
            ResumenServView.isHidden = false
            lineaResum.isHidden = true
            lineaResum2.isHidden = false
            InfoResServView.isHidden = true
            lineaDatos.isHidden = true
            lineaDatos2.isHidden = false
            lineaBitacora.isHidden = false
            lineaDescargue.isHidden = false
            DatosCondView.isHidden = false
            InfoDatosCondView.isHidden = true
            GuiaDescargaView.isHidden = false
            BitacoraView.isHidden =  false
            VistaLineas.isHidden = true
            self.ServicioLabelName.text = "Bitácora"
            self.BitacoraLabelName.text = "Seguimiento"
            
        default:
            break
        }
        
        HideLoadingView(vista: self)
        
    }
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        
            if requestInfo.data?.loading_order != nil {
            
                guard let url = URL(string: (EndPoints.domain+(requestInfo.data?.loading_order)!)) else {return}
            UIApplication.shared.open(url)
        }else{
            NotificationBanner.init(title: "Error", subtitle: "No hay orden de carga",  style: .info).show()
            }
        }
    @objc func tapFunction2(sender:UITapGestureRecognizer) {
        if requestInfo.data?.timesheet != nil {
        
            guard let url = URL(string: (EndPoints.domain+(requestInfo.data?.timesheet)!)) else {return}
        UIApplication.shared.open(url)
    }else{
        NotificationBanner.init(title: "Error", subtitle: "No hay orden de carga",  style: .info).show()
            }
        }
}
