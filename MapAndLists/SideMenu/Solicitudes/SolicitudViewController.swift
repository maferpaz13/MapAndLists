//
//  SolicitudViewController.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 10/07/22.
//

import UIKit
import Charts

class SolicitudViewController: UIViewController, ChartViewDelegate {
    //MARK: - IBOutlets
    @IBOutlet weak var PieView: PieChartView!
    @IBOutlet weak var shadowView2: UIView!
    @IBOutlet weak var LabelSolicitud: UILabel!
    @IBOutlet weak var Viewss: UIView!
    @IBOutlet weak var fechaLabel: UILabel!
    @IBOutlet weak var fechaCargueLabel: UILabel!
    @IBOutlet weak var rutaLabel: UILabel!
    @IBOutlet weak var negociacionLabel: UILabel!
    @IBOutlet weak var cargaaLabel: UILabel!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var SinAsignarLabel: UILabel!
    @IBOutlet weak var AsignadosLabel: UILabel!
    @IBOutlet weak var EnServLabel: UILabel!
    
    //MARK: - IBActions
    @IBAction func Back(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    //MARK: - Properties
    var id: Int = 0
    var infoVeh: SolicitudesModel.Datas?
    var arrayPieChart: [(PieChartModelo)] = []
    var ViewModel = requestBookingViewModel()
    var vehsinasignar: Int = 0
    var vehasignado: Int = 0
    var vehenserv: Int = 0
    
    //MARK: - Constants
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PieView.delegate = self
        
        setUpUI()
        obtenerInfo()
        
    }
    
    func setUpUI() {
        
        LabelSolicitud.text = "Solicitud \(infoVeh?.id ?? 0)"
        fechaLabel.text = infoVeh?.created_at
        fechaCargueLabel.text = infoVeh?.estimated_loading_date
        rutaLabel.text = infoVeh?.route_name
        negociacionLabel.text = infoVeh?.negotiated
        
        var StringProduct: String = ""
        if let array = infoVeh?.products {
        for string2 in array {
            
            if StringProduct == "" {
                
                StringProduct = string2
                
            }else{
                
                StringProduct =  "\(StringProduct) \(string2)"
                
                }
            }
        }
        
        cargaaLabel.text = StringProduct
        Viewss.clipsToBounds = true
        Viewss.layer.cornerRadius = 20
        Viewss.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowRadius = 3
        shadowView.layer.shadowOpacity = 0.2
        
        shadowView2.layer.masksToBounds = false
        shadowView2.layer.shadowColor = UIColor.black.cgColor
        shadowView2.layer.shadowOffset = .zero
        shadowView2.layer.shadowRadius = 3
        shadowView2.layer.shadowOpacity = 0.2
        
        //
    }
    
    func setupcharts(drawHole:Bool,values:[(PieChartModelo)],Totalvalue:Int){
            
        PieView.legend.enabled = false
        PieView.usePercentValuesEnabled = true
        PieView.drawSlicesUnderHoleEnabled = false
        PieView.holeRadiusPercent = 0.58
        PieView.transparentCircleRadiusPercent = 0.61
        PieView.chartDescription!.enabled = false
        PieView.setExtraOffsets(left: 5, top: 5, right: 5, bottom: 5)
           
        PieView.drawHoleEnabled = true
        PieView.rotationAngle = 0
        PieView.rotationEnabled = true
        PieView.highlightPerTapEnabled = true
            
            var tertingvalues = [PieChartDataEntry]()
            
            var colors: [UIColor] = []
            
            for value in values{
                
                tertingvalues.append(PieChartDataEntry(value: Double(value.Value)))
                colors.append(value.color)
                
            }
            
            var set1: PieChartDataSet? = nil
            set1 = PieChartDataSet(entries: tertingvalues)
            set1?.highlightEnabled = false
            set1?.drawValuesEnabled = true
            set1?.colors = colors
        let data = PieChartData(dataSet: set1!)
            
            if drawHole == true{
                
                PieView.drawHoleEnabled = !PieView.drawHoleEnabled
                PieView.drawCenterTextEnabled = false
                
                let formatter = NumberFormatter()
                        formatter.numberStyle = .percent
                        formatter.maximumFractionDigits = 2
                        formatter.multiplier = 1.0
                        formatter.percentSymbol = "%"
                        formatter.zeroSymbol = ""
                data.setValueFormatter(DefaultValueFormatter(formatter: formatter))
                PieView.usePercentValuesEnabled = true
                
            }else{
                
                PieView.usePercentValuesEnabled = false
                PieView.drawCenterTextEnabled = true
                let centerText = NSMutableAttributedString(string: "\(Totalvalue)")
                PieView.centerAttributedText = centerText;
                
            }
            
            
        PieView.data = data
            
            
        PieView.animate(xAxisDuration: 1.4, easingOption: .easeOutBack)
            
        }
 
    
    func obtenerInfo() {
        
        showLoadingView(vista: self)
        
        ViewModel.getRequest(id: id) { (Result) in
            
            if let arrayresult = Result?.data{
                
                arrayresult.forEach({ result in
                    
                    print("entre aqui \(result.requeststatus_id)")
                    switch result.requeststatus_id{
                        
                        
                        //Esto es sin asignar
                    case 1, 2, 3, 4, 24:
                        
                        self.vehsinasignar += 1
                        
                        //Esto es asignados
                    case 5, 12, 19, 20:
                        
                        self.vehasignado += 1
                        
                        //en servicio
                    case 6, 8, 9, 14, 17, 18, 21, 22, 23, 25:
                        
                        self.vehenserv += 1
                        
                    default:
                        break
                    }
            })
                
                self.SinAsignarLabel.text = "\(self.vehsinasignar) Vehículos"
                self.AsignadosLabel.text = "\(self.vehasignado) Vehículos"
                self.EnServLabel.text = "\(self.vehenserv) Vehículos"
                
                
                var arraytesting: [(PieChartModelo)] = []
                arraytesting.append((PieChartModelo).init(color: .blue, Title: "Sin Asignar", Value: 3))
                arraytesting.append((PieChartModelo).init(color: .brown, Title: "Asignados", Value: 4))
                arraytesting.append((PieChartModelo).init(color: .green, Title: "En Servicio", Value: 3))
                
                self.setupcharts(drawHole: true, values: arraytesting, Totalvalue: 10)
                
                
            }
            
            HideLoadingView(vista: self)
            
                }
        
    }
    
}
