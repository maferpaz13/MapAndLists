//
//  InicioUbicacionVehViewController.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 20/06/22.
//

import UIKit
import GoogleMaps
import CoreLocation
import GLKit
import iOSDropDown
import SDWebImage
import SideMenu
import Foundation
import FirebaseDatabase

class InicioUbicacionVehViewController: UIViewController, GMSMapViewDelegate {
    
    //MARK: - IBoutlets
    @IBOutlet weak var ViewMap: GMSMapView!
    @IBOutlet weak var BuscarDropDown: DropDown!
    @IBOutlet weak var AlertasNS: NSLayoutConstraint!
    @IBOutlet weak var VistaAlertas: UIView!
    @IBOutlet weak var VistaAcercar: UIView!
    @IBOutlet weak var VistaAlejar: UIView!
    var ArrayPuntos : [CLLocationCoordinate2D] = []
    var ArrayBuscador : [(nombre1: String, nombre2: String, id1: String, id2: String, lat: String, Lng: String)] = []
    var ArrayMarker : [(marker: GMSMarker, modelomarker : UbicacionVehModel.Datas)] = []
    
    //MARK: - IBActions
    @IBAction func SideMenu(_ sender: Any) {
        
        present(SideMenuManager.default.leftMenuNavigationController!, animated: true, completion: nil)
    }
    @IBAction func BotonAcercar(_ sender: Any) {
        let centro = self.getCenterCoord(self.ArrayPuntos)
        self.ViewMap.camera = GMSCameraPosition.camera(withLatitude: centro.latitude, longitude: centro.longitude, zoom: (ViewMap.camera.zoom) + 1)
        
        DBref.updateChildValues(["clave" : "pepito"])
    }
    @IBAction func BotonAlejar(_ sender: Any) {
        let centro = self.getCenterCoord(self.ArrayPuntos)
        self.ViewMap.camera = GMSCameraPosition.camera(withLatitude: centro.latitude, longitude: centro.longitude, zoom: (ViewMap.camera.zoom) - 1)
        
    }
    
    //MARK: - Variables
    var loadingView : VehDetail?
    var markerSeleccionado : GMSMarker?
    //MARK: - Constantes
    let ViewModel = UbicacionVehViewModel()
    let DBref = Database.database().reference()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.ViewMap.settings.rotateGestures = false
        self.hideKeyboardWhenTappedAround()
        ObtenerInfo()
        setUpUI()
        
        ConfigSideMenu(navigation: self.navigationController!)
        DBref.child("configuraciones").child("vehiculos").observe(.value) { (snapshop) in
            
            var dict = snapshop.value as? [String: Any]
            
            print("esta es la \(dict!["carro"])")
            
        }
        
        let push = UserDefaults.standard.string(forKey: "push")

        print("el push es \(push ?? "nada")")
    }
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        
        
        if loadingView != nil && markerSeleccionado != nil {
            
            loadingView!.center = CGPoint(x: self.ViewMap.projection.point(for: markerSeleccionado!.position).x, y: self.ViewMap.projection.point(for: markerSeleccionado!.position).y - 190)
        }
        
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        
        let ArrayMarkers = ArrayMarker.filter ({$0.marker == marker})
        
        if ArrayMarkers.indices.contains(0) {
            
         let centro = ArrayMarkers[0].marker.position
            CATransaction.begin()
               CATransaction.setValue(2.0, forKey: kCATransactionAnimationDuration)
               let city = GMSCameraPosition.camera(withLatitude: centro.latitude, longitude: centro.longitude, zoom: 20)
            
           
            
            self.ViewMap.animate(to: city)
               CATransaction.commit()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.1, execute: {
                
                self.VehInfoSetUp(marker: ArrayMarkers[0].marker, modeloInfo: ArrayMarkers[0].modelomarker)
                
            })
            
            }
        
        return true
        
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        
        if loadingView != nil {
        loadingView!.removeFromSuperview()
        loadingView = nil
        markerSeleccionado = nil
        }
        
    }
    
    
    func VehInfoSetUp(marker: GMSMarker, modeloInfo: UbicacionVehModel.Datas) {
        
        if loadingView != nil {
            loadingView?.removeFromSuperview()
        }
        
        loadingView = (Bundle.main.loadNibNamed("VehDetail", owner: self, options: nil)?.first as? VehDetail)!
        let fotoURL = URL(string: modeloInfo.front_photo!)
        
        loadingView!.NumPlaca.text = modeloInfo.placa
        loadingView!.DriverName.text = modeloInfo.driver_name
        loadingView!.NumPlacaVeh.text = modeloInfo.placa_trailer
        loadingView!.VehImage.sd_setImage(with: fotoURL)
        loadingView!.VehStatus.text = modeloInfo.vehicle_thirdstate
        loadingView!.NumVehMark.text = modeloInfo.car_mark
        loadingView!.VehType.text = modeloInfo.cartype
        loadingView!.layer.cornerRadius = 8
        
        
        loadingView!.center = CGPoint(x: self.ViewMap.projection.point(for: marker.position).x, y: self.ViewMap.projection.point(for: marker.position).y - 190)
        markerSeleccionado = marker
        
        self.ViewMap.addSubview((loadingView!))
        
    }
    
    
    func BuscarVehDrop(ArrayBuscar: [(nombre1: String, nombre2: String, id1: String, id2: String, lat: String, Lng: String)]) {
        
        BuscarDropDown.optionArray = ArrayBuscar
        BuscarDropDown.isSearchEnable = true
        BuscarDropDown.LimitArrayHeight = 30
        BuscarDropDown.didSelect{ [self] numPlaca,nombre2,requestid,id2,lat,lng  in
            
        self.BuscarDropDown.text = "Selected: \(numPlaca)"
            
            let ArrayMarkers = ArrayMarker.filter ({$0.modelomarker.placa == numPlaca})
            
            if ArrayMarkers.indices.contains(0) {
                
             let centro = ArrayMarkers[0].marker.position
                CATransaction.begin()
                   CATransaction.setValue(1.0, forKey: kCATransactionAnimationDuration)
                   let city = GMSCameraPosition.camera(withLatitude: centro.latitude, longitude: centro.longitude, zoom: 20)
                
               
                
                self.ViewMap.animate(to: city)
                   CATransaction.commit()
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.1, execute: {
                    
                    self.VehInfoSetUp(marker: ArrayMarkers[0].marker, modeloInfo: ArrayMarkers[0].modelomarker)
                    
                })
                
                }
            
            }
    }
    
    func iconByCarConfig(carconfigId: Int, isOwn: Bool) -> UIImage {
        
        //para cambiar el icono depende de la configuracion del carro
        switch carconfigId {
            
        case 7:
            
            return UIImage.init(named: "ic_motorcycle")!
            
        case 8:
            
            return UIImage.init(named: "ic_van_car")!
            
        case 9, 14, 17:
            
            return UIImage.init(named: "ic_pickup")!
            
        case 11, 12:
            
            return isOwn ? UIImage.init(named: "ic_truck_turbo_transer")! : UIImage.init(named: "ic_truck_turbo")!
            
        case 1, 2, 13:
            
            return isOwn ? UIImage.init(named: "ic_truck_transer")! : UIImage.init(named: "ic_truck")!
            
        case 10, 3, 4, 5, 6:
            
            return isOwn ? UIImage.init(named: "ic_tractomula_transer")! : UIImage.init(named: "ic_tractomula")!
            
        default:
            
            return UIImage.init(named: "ic_truck")!
            
        }
        
    }
    
    func ObtenerInfo() {
        
        let defaults = UserDefaults.standard
        
        ViewModel.getUbicacion(parameters: ClientStruct.init(client: defaults.string(forKey: "bigcustomer_id") ?? "")) { Result in
            
            Result?.data?.forEach {
                
                Vehiculo in
                
                DispatchQueue.main.async {
                    
                    if Vehiculo.latitude != nil, Vehiculo.longitude != nil{
                        let position = CLLocationCoordinate2DMake(Vehiculo.latitude!, Vehiculo.longitude!)
                        self.ArrayPuntos.append(position)
                        let marker = GMSMarker(position: position)
                        marker.title = Vehiculo.placa!
                        marker.icon = self.iconByCarConfig(carconfigId: Vehiculo.carconfig_id!, isOwn: Vehiculo.is_owner!)
                        marker.rotation = Vehiculo.rotation ?? 0.0
                        marker.map = self.ViewMap
                        self.ArrayBuscador.append((nombre1: Vehiculo.placa!, nombre2: "", id1: "\(Vehiculo.request_id!)", id2: "", lat: "", Lng: ""))
                        self.ArrayMarker.append((marker: marker, modelomarker: Vehiculo))
                    }
                    
                }
                
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                
                let centro = self.getCenterCoord(self.ArrayPuntos)
                self.ViewMap.camera = GMSCameraPosition.camera(withLatitude: centro.latitude, longitude: centro.longitude, zoom: 5)
                
                self.BuscarVehDrop(ArrayBuscar: (self.ArrayBuscador) )
                
            }
            
            
        }
            
    }
    
    func getCenterCoord(_ LocationPoints: [CLLocationCoordinate2D]) -> CLLocationCoordinate2D{
        
            var x:Float = 0.0;
            var y:Float = 0.0;
            var z:Float = 0.0;
            for points in LocationPoints {
                let lat = GLKMathDegreesToRadians(Float(points.latitude));
                let long = GLKMathDegreesToRadians(Float(points.longitude));

                x += cos(lat) * cos(long);

                y += cos(lat) * sin(long);

                z += sin(lat);
            }
            x = x / Float(LocationPoints.count);
            y = y / Float(LocationPoints.count);
            z = z / Float(LocationPoints.count);
            let resultLong = atan2(y, x);
            let resultHyp = sqrt(x * x + y * y);
            let resultLat = atan2(z, resultHyp);
            let result = CLLocationCoordinate2D(latitude: CLLocationDegrees(GLKMathRadiansToDegrees(Float(resultLat))), longitude: CLLocationDegrees(GLKMathRadiansToDegrees(Float(resultLong))));
            return result;
        
        }
    
    func setUpUI() {
        ViewMap.delegate = self
        VistaAlejar.layer.cornerRadius = VistaAlejar.frame.size.width/2
        VistaAlejar.clipsToBounds = true
        VistaAlejar.layer.borderWidth = 5.0
        
        VistaAcercar.layer.cornerRadius = VistaAcercar.frame.size.width/2
        VistaAcercar.clipsToBounds = true
        VistaAcercar.layer.borderWidth = 5.0
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.Gesture(gesture:)))
        
        swipeUp.direction =  .up
        
        VistaAlertas.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.Gesture(gesture:)))
        
        swipeDown.direction =  .down
        
        VistaAlertas.addGestureRecognizer(swipeDown)
        
    }
    
    @objc func Gesture(gesture: UISwipeGestureRecognizer) -> Void{
        
        let MitadPantalla = self.view.frame.height / 2
                
        if gesture.direction == UISwipeGestureRecognizer.Direction.up{
            self.AlertasNS.constant = MitadPantalla
            
            UIView.animate(withDuration: 1) {
                self.view.layoutIfNeeded()
            }
            
            
        }else{
            self.AlertasNS.constant = 60
            
            UIView.animate(withDuration: 1) {
                self.view.layoutIfNeeded()
            }
        }
    }
}

extension CGPoint {
    static func -(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
}

func ConfigSideMenu(navigation: UINavigationController) {
    
    let storyBoard : UIStoryboard = UIStoryboard(name: "SideMenu", bundle:nil)
    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SideMenuNav") as! UINavigationController
    
    
        SideMenuManager.default.leftMenuNavigationController = nextViewController as? SideMenuNavigationController
    
    let presentationStyle = SideMenuPresentationStyle.menuSlideIn
    presentationStyle.menuStartAlpha = 0.0
    presentationStyle.presentingEndAlpha = 1.0
    var setting = SideMenuSettings()
    setting.presentationStyle = presentationStyle
    setting.presentingViewControllerUserInteractionEnabled = false
    setting.presentDuration = 1
    setting.dismissDuration = 1
    setting.menuWidth = 317
    setting.statusBarEndAlpha = 0.0
    SideMenuManager.default.leftMenuNavigationController?.settings = setting
    
    SideMenuManager.default.addPanGestureToPresent(toView: navigation.navigationBar)
    SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: navigation.view)
    SideMenuManager.default.rightMenuNavigationController = nil
    
}
