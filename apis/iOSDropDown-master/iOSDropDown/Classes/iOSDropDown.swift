
//
//  iOSDropDown.swift
//
//
//  Created by Jishnu Raj T on 26/04/18.
//  Copyright © 2018 JRiOSdev. All rights reserved.
//
import UIKit

@objc(JRDropDown)
open class DropDown : UITextField{
    
    public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if actionwhenendediting != nil{
            
            actionwhenendediting?()
            
        }
        return true
    }
    
    
    public var vistaprincipal: UIViewController?
    
    public var isSearchinternetenable = false
    public var animationwhenhide = true
    public var hidekeyboard: Bool?
    
    public var starlookingservice: (()->())?
    public var actionwhenendediting: (()->())?
    
    public var table : UITableView!
    
    public var Cantidaddenombres: Int?
    public var selectedIndex: Int?
    public var LimitArrayHeight: Int?
    
    var loading :ProgressView!
    var arrow : Arrow!
    
    var loadingview : UIView!
    var shadow : UIView!
    
    public var isreadyshow = false
    
    public var waittime = 0.0
    
    //MARK: IBInspectable
    
    @IBInspectable public var rowBackgroundColor: UIColor = .white
    @IBInspectable public var selectedRowColor: UIColor = .cyan
    
    @IBInspectable public var hideOptionsWhenSelect = true
    
    @IBInspectable public var rowHeight: CGFloat = 30
    
    @IBInspectable  public var isSearchEnable: Bool = true {
        
        didSet{
            
            addGesture()
            
        }
        
    }
    
    @IBInspectable public var borderColor: UIColor =  UIColor.lightGray {
        
        didSet {
            
            layer.borderColor = borderColor.cgColor
            
        }
        
    }
    
    @IBInspectable public var listHeight: CGFloat = 150{
        
        didSet {
            
        }
        
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0.0 {
        
        didSet {
            
            layer.borderWidth = borderWidth
            
        }
        
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 5.0 {
        
        didSet {
            
            layer.cornerRadius = cornerRadius
            
        }
        
    }
    
    //Variables
    
    public var dataArray = [(nombre1:String,nombre2:String, id1:String, id2:String,lat:String,Lng:String)]()
    fileprivate  var pointToParent = CGPoint(x: 0, y: 0)
    fileprivate  var parentController:UIViewController?
    fileprivate  var tableheightX: CGFloat = 100
    fileprivate var keyboardHeight:CGFloat = 0
    fileprivate var backgroundView = UIView()
    fileprivate  var imageArray = [String]()
    
    public func showloading(){
        
        loading.isHidden = false
        arrow.isHidden = true
        
    }
    
    public func hideloading(){
        
        loading.isHidden = true
        arrow.isHidden = false
        self.reSizeTable()
        self.selectedIndex = nil
        showList()
        
        if self.table != nil{
            
            self.table.reloadData()
            
        }
        
    }
    
    @objc func getdirections() {
        
         if self.text?.length != nil{
              
              if self.text!.length >= 3{
                
                self.starlookingservice?()
                   
              }
              
         }
         
    }
    
    @objc func myTextFieldDidChange(_ textField: UITextField) {
        
        if textField.text == "" {
            
            self.dataArray = self.optionArray
            if table != nil{
                
                table.reloadData()
                
            }
            
        }else{
            
            let a = self.dataArray.filter {
                return $0.nombre1.range(of: textField.text!, options: [.caseInsensitive,.diacriticInsensitive]) != nil
            }
            
            if a.count == 0{
                
                self.dataArray = self.optionArray
                
            }else{
                
                self.dataArray = self.optionArray.filter {
                    return $0.nombre1.range(of: textField.text!, options: [.caseInsensitive,.diacriticInsensitive]) != nil
                    
                }
                
            }
            
        }
        
        self.reSizeTable()
        self.selectedIndex = nil
        
        if self.table != nil{
            
            self.table.reloadData()
            
        }
        
    }
    
    public var optionArray = [(nombre1:String,nombre2:String, id1:String, id2:String,lat:String,Lng:String)]() {
        
        didSet{
            
            self.dataArray = self.optionArray
            
        }
        
    }
    
    public var optionImageArray = [String]() {
        
        didSet{
            
            self.imageArray = self.optionImageArray
            
        }
        
    }
    
    public var optionIds : [Int]?
    
    @IBInspectable public var arrowSize: CGFloat = 15 {
        
        didSet{
            
            let center =  arrow.superview!.center
            arrow.frame = CGRect(x: center.x - arrowSize/2, y: center.y - arrowSize/2, width: arrowSize, height: arrowSize)
            
        }
        
    }
    
    @IBInspectable public var arrowColor: UIColor = .black {
        
        didSet{
            
            arrow.arrowColor = arrowColor
            
        }
        
    }
    
    @IBInspectable public var checkMarkEnabled: Bool = true {
        
        didSet{
            
        }
        
    }
    
    @IBInspectable public var handleKeyboard: Bool = true {
        
        didSet{
            
        }
        
    }
    
    // Init
    public override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupUI()
        self.delegate = self
        
    }
    
    public required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)!
        setupUI()
        self.delegate = self
        
    }
    
    //MARK: Closures
    fileprivate var didSelectCompletion: (String, String ,String,String,String,String) -> () = {Nombre1, Nombre2 , id1,id2,lat,lng  in }
    fileprivate var TableWillAppearCompletion: () -> () = { }
    fileprivate var TableDidAppearCompletion: () -> () = { }
    fileprivate var TableWillDisappearCompletion: () -> () = { }
    fileprivate var TableDidDisappearCompletion: () -> () = { }
    fileprivate var emptyarray: () -> () = { }
    
    @IBAction func tapLabel(gesture: UITapGestureRecognizer) {
        
        self.showList()
        
    }
    
    func setupUI () {
        
        let size = self.frame.height
        let rightView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: size, height: size))
        self.rightView = rightView
        if #available(iOS 9.0, *) {
            self.rightView!.widthAnchor.constraint(equalToConstant: size).isActive = true
        } else {
            // Fallback on earlier versions
        }
        self.rightViewMode = .always
        let arrowContainerView = UIView(frame: rightView.frame)
        self.rightView?.addSubview(arrowContainerView)
        let center = arrowContainerView.center
        arrow = Arrow(origin: CGPoint(x: center.x - arrowSize/2,y: center.y - arrowSize/2),size: arrowSize)
        
        arrowContainerView.addSubview(arrow)
        arrow.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(tapLabel(gesture:))))
        let loadingIndicator: ProgressView = {
            let progress = ProgressView(colors: [.systemBlue], lineWidth: 3)
            progress.translatesAutoresizingMaskIntoConstraints = false
            return progress
        }()
        
        
        loadingIndicator.isAnimating = true
        arrowContainerView.addSubview(loadingIndicator)
        
        if #available(iOS 9.0, *) {
            
            NSLayoutConstraint.activate([
                
                loadingIndicator.centerXAnchor.constraint(equalTo: ( self.rightView!.centerXAnchor)),
                loadingIndicator.centerYAnchor.constraint(equalTo: (self.rightView!.centerYAnchor)),
                loadingIndicator.widthAnchor.constraint(equalToConstant: 20),
                loadingIndicator.heightAnchor
                    .constraint(equalToConstant: 20)
                
            ])
            
        } else {
            
            // Fallback on earlier versions
            
        }
        
        loading = loadingIndicator
        loading.isHidden = true
        
        self.backgroundView = UIView(frame: .zero)
        self.backgroundView.backgroundColor = .clear
        addGesture()
        
        if isSearchEnable && handleKeyboard{
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) {
                
                (notification) in
                
                if self.isFirstResponder{
                    
                    let userInfo:NSDictionary = notification.userInfo! as NSDictionary
                    let keyboardFrame:NSValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
                    let keyboardRectangle = keyboardFrame.cgRectValue
                    self.keyboardHeight = keyboardRectangle.height
                    
                    if !self.isSelected{
                        
                        self.showList()
                        
                    }
                    
                }
                
            }
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) {
                
                (notification) in
                
                if self.isFirstResponder{
                    
                    self.keyboardHeight = 0
                    
                }
                
            }
            
        }
        
    }
    
    deinit {
        
        NotificationCenter.default.removeObserver(self)
        
    }
    
    
    fileprivate func addGesture (){
        
        let gesture =  UITapGestureRecognizer(target: self, action:  #selector(touchAction))
        let gesture2 =  UITapGestureRecognizer(target: self, action:  #selector(touchAction2))
        
        if isSearchEnable{
            
            self.rightView?.addGestureRecognizer(gesture2)
            
        }else{
            
            self.addGestureRecognizer(gesture)
            
        }
        
        //let gesture2 =  UITapGestureRecognizer(target: self, action:  #selector(touchAction))
        //self.backgroundView.addGestureRecognizer(gesture2)
        
    }
    
    @objc public func touchAction2() {
        
        if self.isFirstResponder == false{
            
            self.becomeFirstResponder()
            
        }
        
    }
    
    func getConvertedPoint(_ targetView: UIView, baseView: UIView?)->CGPoint{
        
        var pnt = targetView.frame.origin
        
        if nil == targetView.superview{
            
            return pnt
            
        }
        
        var superView = targetView.superview
        
        while superView != baseView{
            
            pnt = superView!.convert(pnt, to: superView!.superview)
            
            if nil == superView!.superview{
                
                break
                
            }else{
                
                superView = superView!.superview
                
            }
            
        }
        
        return superView!.convert(pnt, to: baseView)
        
    }
    
    public func showList() {
        
        self.delegate = self
        
        if self.text!.length <= 2 && self.isSearchinternetenable == true{
            self.isSelected = true
            return
            
            
        }
        
                if self.isSearchinternetenable == false{
                    
                    self.addTarget(self, action: #selector(self.myTextFieldDidChange), for: .editingChanged)
                    
                }
                
                if self.hidekeyboard == true{
                    
                    self.vistaprincipal?.view.endEditing(true)
                    
                }
                
                if self.dataArray.count == 0 && self.isSearchinternetenable == false{
                    
                    print("dataArray \(self.dataArray.count)")
                    
                    self.vistaprincipal?.view.endEditing(true)
                    self.emptyarray()
                    
                }else{
                    
                    if self.isreadyshow == false{
                        
                        self.isreadyshow = true
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + self.waittime) {
                            
                            if self.parentController == nil{
                                
                                self.parentController = self.parentViewController
                                
                            }
                            
                            self.backgroundView.frame = self.parentController?.view.frame ?? self.backgroundView.frame
                            self.pointToParent = self.getConvertedPoint(self, baseView: self.parentController?.view)
                            self.parentController?.view.insertSubview(self.backgroundView, aboveSubview: self)
                            self.TableWillAppearCompletion()
                            
                            if self.listHeight > self.rowHeight * CGFloat( self.dataArray.count) {
                                
                                self.tableheightX = self.rowHeight * CGFloat(self.dataArray.count)
                                
                            }else{
                                
                                self.tableheightX = self.listHeight
                                
                            }
                            
                            self.table = UITableView(frame: CGRect(x: self.pointToParent.x,
                                                                   y: self.pointToParent.y + self.frame.height ,
                                                                   width: self.frame.width,
                                                                   height: self.frame.height))
                            
                            self.shadow = UIView(frame: self.table.frame)
                            self.shadow.backgroundColor = .clear
                            self.table.dataSource = self
                            self.table.delegate = self
                            self.table.alpha = 0
                            self.table.separatorStyle = .none
                            self.table.layer.cornerRadius = 3
                            self.table.backgroundColor = self.rowBackgroundColor
                            self.table.rowHeight = self.rowHeight
                            self.parentController?.view.addSubview(self.shadow)
                            self.parentController?.view.addSubview(self.table)
                            self.isSelected = true
                            let height = (self.parentController?.view.frame.height ?? 0) - (self.pointToParent.y + self.frame.height + 5)
                            var y = self.pointToParent.y+self.frame.height+5
                            
                            if height < (self.keyboardHeight+self.tableheightX){
                                
                                y = self.pointToParent.y - self.tableheightX
                                
                            }
                            
                            UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {
                                
                                () -> Void in
                                self.table.frame = CGRect(x: self.pointToParent.x, y: y, width: self.frame.width,  height: self.tableheightX)
                                self.table.alpha = 1
                                self.shadow.frame = self.table.frame
                                self.shadow.dropShadow()
                                self.arrow.position = .up
                                
                                
                            },
                            completion: { (finish) -> Void in
                                
                                self.layoutIfNeeded()
                                
                                if self.isFirstResponder == false && self.hidekeyboard == false{
                                    
                                    self.becomeFirstResponder()
                                    
                                }
                                
                            })
                            
                        }
                        
                    }
                    
                }
                
    }
    
    public func hideList() {
        
        isreadyshow = false
        TableWillDisappearCompletion()
        self.vistaprincipal?.view.endEditing(true)
        
        if animationwhenhide == true{
            
            UIView.animate(withDuration: 0.3, delay: 0.4, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {
                
                () -> Void in
                if self.table != nil{
                    
                    self.table.frame = CGRect(x: self.pointToParent.x,y: self.pointToParent.y+self.frame.height,width: self.frame.width,height: 0)
                    self.shadow.alpha = 0
                    self.shadow.frame = self.table.frame
                    self.arrow.position = .down
                    
                }
                
            },
            
            completion: { (didFinish) -> Void in
                
                if self.table != nil{
                    
                self.shadow.removeFromSuperview()
                self.table.removeFromSuperview()
                self.backgroundView.removeFromSuperview()
                self.isSelected = false
                self.TableDidDisappearCompletion()
                    
                }
                
            })
            
        }else{
            
            if self.table != nil{
            
            self.shadow.removeFromSuperview()
            self.table.removeFromSuperview()
            self.backgroundView.removeFromSuperview()
            self.isSelected = false
            self.TableDidDisappearCompletion()
                
            }
            
        }
        
    }
    
    @objc public func touchAction() {
        
        isSelected ?  hideList() : showList()
        
    }
    
    public func reSizeTable() {
        
        var multiplicador:CGFloat = 0.0
        
        if LimitArrayHeight != nil{
            
            multiplicador = CGFloat(dataArray.count > LimitArrayHeight! ? LimitArrayHeight! : dataArray.count)
            
        }else{
            
            multiplicador = 30
            
        }
        
        print("multiplicador \(multiplicador)")
        
        if listHeight > rowHeight * CGFloat( dataArray.count) {
            
            self.tableheightX = rowHeight * CGFloat(multiplicador)
            
        }else{
            
            self.tableheightX = LimitArrayHeight != nil ? (rowHeight * CGFloat(multiplicador)) : listHeight
            
        }
        
        let height = (self.parentController?.view.frame.height ?? 0) - (self.pointToParent.y + self.frame.height + 5)
        var y = self.pointToParent.y+self.frame.height+5
        
        if height < (keyboardHeight+tableheightX){
            
            y = self.pointToParent.y - tableheightX
            
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.1, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.1, options: .curveEaseInOut,animations: {
            
            () -> Void in
            if self.table != nil{
                
                self.table.frame = CGRect(x: self.pointToParent.x,y: y, width: self.frame.width,height: self.tableheightX)
                self.shadow.frame = self.table.frame
                self.shadow.dropShadow()
                
            }
            
        },
        
        completion: { (didFinish) -> Void in
            
            self.layoutIfNeeded()
            
        })
        
    }
    
    //MARK: Actions Methods
    public func didSelect(completion: @escaping (_ Nombre1: String,_ Nombre2: String, _ id1: String , _ id2:String, _ lat:String, _ lng:String ) -> ()) {
        
        didSelectCompletion = completion
        
    }
    
    public func listWillAppear(completion: @escaping () -> ()) {
        
        TableWillAppearCompletion = completion
        
    }
    
    public func listDidAppear(completion: @escaping () -> ()) {
        
        TableDidAppearCompletion = completion
        
    }
    
    public func listWillDisappear(completion: @escaping () -> ()) {
        
        TableWillDisappearCompletion = completion
        
    }
    
    public func listDidDisappear(completion: @escaping () -> ()) {
        
        TableDidDisappearCompletion = completion
        
    }
    
    public func empty(completion: @escaping () -> ()) {
        
        emptyarray = completion
        
    }
    
}

//MARK: UITextFieldDelegate
extension DropDown : UITextFieldDelegate {
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        superview?.endEditing(true)
        return false
        
    }
    
    public func  textFieldDidBeginEditing(_ textField: UITextField) {
        
        textField.text = ""
        self.dataArray = self.optionArray
        touchAction()
        
    }
    
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        return isSearchEnable
        
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        if isSearchinternetenable == true{
            
          print("entre aqui")
            NSObject.cancelPreviousPerformRequests(
                 withTarget: self,
                 selector: #selector(getdirections),
                 object: textField)
            self.perform(
                 #selector(getdirections),
                 with: textField,
                 afterDelay: 0.5)
            
        }
        
         return true
         
    }
    
}
///MARK: UITableViewDataSource
extension DropDown: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return rowHeight
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "DropDownCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        if cell == nil {
            
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
            
        }
        
        if indexPath.row != selectedIndex{
            
            cell!.backgroundColor = rowBackgroundColor
            
        }else {
            
            cell?.backgroundColor = selectedRowColor
            
        }
        
        if self.imageArray.count > indexPath.row {
            
            cell!.imageView!.image = UIImage(named: imageArray[indexPath.row])
            
        }
        
        if Cantidaddenombres == 1 || dataArray[indexPath.row].nombre2 == "" {
            
            cell!.textLabel!.text = "\(dataArray[indexPath.row].nombre1)"
            
        }else{
            
            cell!.textLabel!.text = "\(dataArray[indexPath.row].nombre1) - \(dataArray[indexPath.row].nombre2)"
            
        }
        
        cell!.accessoryType = (indexPath.row == selectedIndex) && checkMarkEnabled  ? .checkmark : .none
        cell!.selectionStyle = .none
        cell?.textLabel?.font = self.font
        cell?.textLabel?.textAlignment = self.textAlignment
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.lineBreakMode = .byWordWrapping
        
        if #available(iOS 11.0, *) {
            
            cell?.textLabel?.textColor = UIColor(named: "Colorlabelscomunes")
            
        } else {
            
            // Fallback on earlier versions
            
        }
        
        return cell!
        
    }
    
}

//MARK: UITableViewDelegate
extension DropDown: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = (indexPath as NSIndexPath).row
        
        let selectedText = self.dataArray[self.selectedIndex!]
        
        if hideOptionsWhenSelect {
            
            touchAction()
            self.endEditing(true)
            
        }
        
        if optionArray.firstIndex(where: {$0 == selectedText}) != nil {
            
            didSelectCompletion(selectedText.nombre1, selectedText.nombre2 , selectedText.id1, selectedText.id2,selectedText.lat,selectedText.Lng)
        }
        
    }
    
}

//MARK: Arrow
enum Position {
    
    case left
    case down
    case right
    case up
    
}

class Arrow: UIView {
    
    let shapeLayer = CAShapeLayer()
    
    var arrowColor:UIColor = .black {
        
        didSet{
            
            shapeLayer.fillColor = arrowColor.cgColor
            
        }
        
    }
    
    var position: Position = .down {
        
        didSet{
            
            switch position {
            
            case .left:
                self.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
                break
                
            case .down:
                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi*2)
                break
                
            case .right:
                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
                break
                
            case .up:
                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                break
                
            }
            
        }
        
    }
    
    init(origin: CGPoint, size: CGFloat ) {
        
        super.init(frame: CGRect(x: origin.x, y: origin.y, width: size, height: size))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func draw(_ rect: CGRect) {
        
        // Get size
        let size = self.layer.frame.width
        
        // Create path
        let bezierPath = UIBezierPath()
        
        // Draw points
        let qSize = size/4
        
        bezierPath.move(to: CGPoint(x: 0, y: qSize))
        bezierPath.addLine(to: CGPoint(x: size, y: qSize))
        bezierPath.addLine(to: CGPoint(x: size/2, y: qSize*3))
        bezierPath.addLine(to: CGPoint(x: 0, y: qSize))
        bezierPath.close()
        
        // Mask to path
        shapeLayer.path = bezierPath.cgPath
        //  shapeLayer.fillColor = arrowColor.cgColor
        
        if #available(iOS 12.0, *) {
            
            self.layer.addSublayer (shapeLayer)
            
        } else {
            
            self.layer.mask = shapeLayer
            
        }
        
    }
    
}

extension UIView {
    
    func dropShadow(scale: Bool = true) {
        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowRadius = 2
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        
    }
    
    func viewBorder(borderColor : UIColor, borderWidth : CGFloat?) {
        
        self.layer.borderColor = borderColor.cgColor
        
        if let borderWidth_ = borderWidth {
            
            self.layer.borderWidth = borderWidth_
            
        } else {
            
            self.layer.borderWidth = 1.0
            
        }
        
    }
    
    var parentViewController: UIViewController? {
        
        var parentResponder: UIResponder? = self
        
        while parentResponder != nil {
            
            parentResponder = parentResponder!.next
            
            if let viewController = parentResponder as? UIViewController {
                
                return viewController
                
            }
            
        }
        
        return nil
        
    }
    
}



extension String {
    
    var length: Int { return self.count }
    
}
