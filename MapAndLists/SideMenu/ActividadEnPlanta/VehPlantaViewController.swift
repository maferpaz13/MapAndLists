//
//  VehPlantaViewController.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 5/07/22.
//

import UIKit
import GoogleMaps
import CoreLocation
import GLKit

class VehPlantaViewController: UIViewController, GMSMapViewDelegate {
    
    //MARK: - IBOutlets
    @IBOutlet weak var Mapa: GMSMapView!
    @IBOutlet weak var OpPlantaNameLabel: UILabel!
    @IBOutlet weak var tlfLabel: UILabel!
    @IBOutlet weak var DireccionLabel: UILabel!
    @IBOutlet weak var TPromCargueLabel: UILabel!
    @IBOutlet weak var TPromDescargueLabel: UILabel!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var ButtonVehCargaOut: UIButton!
    @IBOutlet weak var ViewInfo: UIView!
    @IBOutlet weak var ButtonVehDescargaOut: UIButton!
    //MARK: - IBActions
    @IBAction func ButtonVehCarga(_ sender: Any) {
        self.performSegue(withIdentifier: "showVehEnCargue", sender: nil)
    }
    
    @IBAction func ButtonVehDescarga(_ sender: Any) {
        self.performSegue(withIdentifier: "showVehEnDescargue", sender: nil)
    }
    
    @IBAction func ButtonBack(_ sender: Any) {
        
        _ = navigationController?.popViewController(animated: true)
        
    }
    
       //MARK: - Properties
    var ArrayMarker : [(marker: GMSMarker, modelomarker : ActPlantaModel.Plants)] = []
    var markerDelId : GMSMarker?
    var InfoPlanta : ActPlantaModel.Plants?
    var cirlce: GMSCircle!
    var ArrayPuntos : [CLLocationCoordinate2D] = []
    var id: Int = 0
    
       //MARK: - Constants
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showVehEnCargue" {
            let destinationVC = segue.destination as! VehCargaViewController
            destinationVC.id = (InfoPlanta?.id)!
        }else if segue.identifier == "showVehEnDescargue" {
            let destinationVC = segue.destination as! VehDescargaViewController
            destinationVC.id = (InfoPlanta?.id)!
        }
        
    }
    
    func setUpUI() {
        
        self.Mapa.delegate = self
        let position = CLLocationCoordinate2DMake( Double(InfoPlanta?.lat ?? "") ?? 0.0, Double(InfoPlanta?.lng ?? "") ?? 0.0)
        self.ArrayPuntos.append(position)
        let marker = GMSMarker(position: position)
        marker.icon = GMSMarker.markerImage(with: .black)
        marker.map = self.Mapa
        
        self.OpPlantaNameLabel.text = InfoPlanta?.contact_name
        self.tlfLabel.text = InfoPlanta?.contact_phone
        self.DireccionLabel.text = InfoPlanta?.address_text
        self.TPromCargueLabel.text = "\(InfoPlanta?.estimated_charging_time ?? 0)"
        self.TPromDescargueLabel.text = "\(InfoPlanta?.estimated_download_time ?? 0)"
        self.ButtonVehCargaOut.layer.cornerRadius = 8
        self.ButtonVehDescargaOut.layer.cornerRadius = 8
        ViewInfo.clipsToBounds = true
        ViewInfo.layer.cornerRadius = 20
        ViewInfo.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        //shadowView.layer.shouldRasterize = true
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowRadius = 3
        shadowView.layer.shadowOpacity = 0.2
        
           let circleCenter = CLLocationCoordinate2D(latitude: Double(InfoPlanta?.lat ?? "") ?? 0.0, longitude: Double(InfoPlanta?.lng ?? "") ?? 0.0)
        cirlce = GMSCircle(position: circleCenter, radius: InfoPlanta?.radio_distance_m ?? 100.0)
        cirlce.fillColor = UIColor.init(named: "BordeVerdeAdentro")
           cirlce.strokeColor = UIColor.init(named: "BordeVerde")
           cirlce.strokeWidth = 2
           cirlce.map = Mapa
        
        let path = GMSMutablePath()
        if let arraypoints = InfoPlanta?.polypoints_json{
            for points in arraypoints{
                
                path.add(CLLocationCoordinate2D(latitude: Double(points.lat!) ?? 0.0, longitude: Double(points.lng!) ?? 0.0 ))
                
            }
        }
        
        
        path.add(CLLocationCoordinate2D(latitude: Double((InfoPlanta?.polypoints_json![0].lat)!) ?? 0.0, longitude: Double((InfoPlanta?.polypoints_json![0].lng)!) ?? 0.0 ))
        
        let bounds = GMSCoordinateBounds(path: path)
        let cameraUpdate = GMSCameraUpdate.fit(bounds, with: UIEdgeInsets(top: 160, left: 160, bottom: 160, right: 160))
        Mapa.animate(with: cameraUpdate)
        //self.Mapa.camera = GMSCameraPosition.camera(withLatitude: Double(InfoPlanta?.lat ?? "") ?? 0.0,  longitude: Double(InfoPlanta?.lng ?? "") ?? 0.0, zoom: 10)
        
            let polyline = GMSPolyline(path: path)
        polyline.strokeColor = UIColor.init(named: "NaranjaFx")!
            polyline.strokeWidth = 5.0
            polyline.map = Mapa
    }
    
}
