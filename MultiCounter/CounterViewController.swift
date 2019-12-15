//
//  ViewController.swift
//  Counter
//
//  Created by Muharrem Demiray on 2017-02-06.
//  Copyright © 2017 Muharrem Demiray. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation
import AudioToolbox
import DynamicButton
// import GoogleMobileAds


func color(_ rgbColor: Int) -> UIColor{
    return UIColor(
        red:   CGFloat((rgbColor & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbColor & 0x00FF00) >> 8 ) / 255.0,
        blue:  CGFloat((rgbColor & 0x0000FF) >> 0 ) / 255.0,
        alpha: CGFloat(1.0)
    )
}


class CounterViewController: UIViewController {
    
    
    // ID of the current counter
    private var id = 0
    
    public var ID: Int{
        get{return id}
        set{
            id = newValue
            //CounterManager.sharedManager.CurrentIDofTheCounter = newValue
        }
    }
    
    public var CounterValue: Int{
        get{return CounterManager.sharedManager.multiCounterArray[id]!.counterGetSet}
        set{CounterManager.sharedManager.multiCounterArray[id]!.counterGetSet = newValue}
    }
    
    public var StepSize: Int{
        get{return CounterManager.sharedManager.multiCounterArray[id]!.IncDecStepSize}
        set{CounterManager.sharedManager.multiCounterArray[id]!.IncDecStepSize = newValue}
    }
    
    public var ResetValue: Int {
        get{return CounterManager.sharedManager.multiCounterArray[id]!.ResetValue}
        set{CounterManager.sharedManager.multiCounterArray[id]!.ResetValue = newValue}
    }
    
    public var UpperLimit: Int{
        get{return CounterManager.sharedManager.multiCounterArray[id]!.UpperLimit}
        set{ CounterManager.sharedManager.multiCounterArray[id]!.UpperLimit = newValue}
    }
    
    
    
    public var SoundOnOff: Bool {
        get{return CounterManager.sharedManager.multiCounterArray[id]!.SoundOnOff}
        set{CounterManager.sharedManager.multiCounterArray[id]!.SoundOnOff = newValue}
    }
    
    public var UserLeftHanded: Bool {
        get{ return CounterManager.sharedManager.multiCounterArray[id]!.UserLeftHanded}
        set{CounterManager.sharedManager.multiCounterArray[id]!.UserLeftHanded = newValue}
    }
    
    
    public var IncDecButtonConfig: Int {
        get{return CounterManager.sharedManager.multiCounterArray[id]!.IncDecButtonConfig}
        set{CounterManager.sharedManager.multiCounterArray[id]!.IncDecButtonConfig = newValue }
    }
    
    public var Name: String{
        get{return CounterManager.sharedManager.multiCounterArray[id]!.Name}
        set{CounterManager.sharedManager.multiCounterArray[id]!.Name = newValue}
    }
    
    
    public var VibrationOnOff: Bool {
        get{return CounterManager.sharedManager.multiCounterArray[id]!.VibrationOnOff}
        set{CounterManager.sharedManager.multiCounterArray[id]!.VibrationOnOff = newValue}
    }
    
    
    public var BackgroundColor: UIColor{
        get{return CounterManager.sharedManager.multiCounterArray[id]!.BackgroundColor}
        set{CounterManager.sharedManager.multiCounterArray[id]!.BackgroundColor = newValue}
    }

    
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = CounterManager.sharedManager.multiCounterArray[id]!.BackgroundColor
        //self.navigationController?.navigationBar.backgroundColor = UIColor.red //counter.BackgroundColor
        //self.navigationController?.navigationBar.isOpaque = true
        self.navigationController?.navigationBar.barTintColor = CounterManager.sharedManager.multiCounterArray[id]!.BackgroundColor
        
      
        
        updateVIEW()
        
        
        
        
        createIncButton()
        createDecButton()
        createResetButton()
        
        addMobStuff()
        
        
    }
    
    

    
    
    
    private func addMobStuff()
    {
        
        
        //print("Google Mobile Ads SDK version: " + GADRequest.sdkVersion())
//        bannerView.adUnitID = "ca-app-pub-4099788405286074/6407375548"
//        bannerView.rootViewController = self
//        bannerView.load(GADRequest())
        
        // MARK: For test purposes
//        let request: GADRequest = GADRequest()
//        request.testDevices = ["51296f8a02a18cd4264de49fde27cfb1", kGADSimulatorID]
//        bannerView.load(request)
    }
    
  
    
    private func updateVIEW()
    {
        DisplayValue = CounterManager.sharedManager.multiCounterArray[id]!.counterGetSet
        counterDisplay.backgroundColor = CounterManager.sharedManager.multiCounterArray[id]!.BackgroundColor
        
        
        StepSizeDisplay = CounterManager.sharedManager.multiCounterArray[id]!.IncDecStepSize
        NameOfTheCounter = CounterManager.sharedManager.multiCounterArray[id]!.Name
        nameOfTheCounterLabel.textColor = UIColor.white
        
       
        
        
    }
    
    
    
    @IBAction func dynamicButtonResetAction(_ sender: DynamicButton) {
        
        
        //show the alert
        let alert = UIAlertController(title: "RESET Counter", message: "Do you want to RESET?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: {action in
            
            // Update MODEL
            CounterManager.sharedManager.multiCounterArray[self.id]!.resetCounterToValue(resetToValue: CounterManager.sharedManager.multiCounterArray[self.id]!.ResetValue )
            
            
            // Update VIEW
            self.DisplayValue = CounterManager.sharedManager.multiCounterArray[self.id]!.counterGetSet
            
        }))
        
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var dynamicButtonSettings: DynamicButton!
    

    @IBOutlet weak var dynamicButtonIncrement: DynamicButton!
    
    @IBOutlet weak var dynamicButtonDecrement: DynamicButton!
    
    @IBOutlet weak var dynamicButtonReset: DynamicButton!
    
    
    
    
 
    
    var decButtonYcoordinate = 0
    var decButtonXcoordinate = 0
    var widthOfTheDecButton = 0
    var heightOfTheDecButton = 0
    
    private func createDecButton()
    {
        
        
        if CounterManager.sharedManager.multiCounterArray[id]!.IncDecButtonConfig == 2 || CounterManager.sharedManager.multiCounterArray[id]!.IncDecButtonConfig == 3
        {
            
            // y-coordinate of the button is always fixed
            self.decButtonYcoordinate = Int(self.view.bounds.height * (0.5 + (1/16)))
            self.decButtonXcoordinate = Int(self.view.bounds.width * 0.3) // this will later be overriden
            
            
//            if counter.IncDecButtonConfig == .onlyDecButton
//            {
//                // single button, position in the middle of the screen
//                decButtonXcoordinate = Int(self.view.bounds.width * 0.3)
//                
//            }
//            else
            
            if CounterManager.sharedManager.multiCounterArray[id]!.IncDecButtonConfig == 2 ||
                CounterManager.sharedManager.multiCounterArray[id]!.IncDecButtonConfig == 3
            {
                // two button config.. Lets check whether left-handed or not.
                if UserLeftHanded
                {
                    decButtonXcoordinate = Int(self.view.bounds.width * (11/16))
                }
                else
                {
                    decButtonXcoordinate = Int(self.view.bounds.width * (1/8))
                }
            }
            
             widthOfTheDecButton = Int(self.view.bounds.width * (3/16))
             heightOfTheDecButton = widthOfTheDecButton
            
            
            
            //let button = UIButton(frame: CGRect(x: decButtonXcoordinate, y: decButtonYcoordinate, width: 100, height: 100 ))
            let button = DynamicButton(frame: CGRect(x: decButtonXcoordinate,
                                                     y: decButtonYcoordinate,
                                                     width: widthOfTheDecButton ,
                                                     height: heightOfTheDecButton )
            )
//            button.backgroundColor = UIColor.black
//            button.setTitle("-", for: .highlighted )
//            button.setTitle("-", for: .normal )
//            button.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: UIControlState.highlighted)
//            button.setTitleColor(UIColor.white.withAlphaComponent(1.0), for: UIControlState.normal)
//            button.titleLabel?.font = UIFont(name: "System", size: 80.0)
            
            
            button.setStyle(DynamicButtonStyle.horizontalLine, animated: true)
            button.backgroundColor = CounterManager.sharedManager.multiCounterArray[id]!.BackgroundColor
            button.strokeColor = UIColor.white
            
            button.addTarget(self, action: #selector(self.buttonDecClicked), for:  UIControlEvents.touchUpInside)
            
            
            
            
            
            
            //button.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControlEvents#>)
            self.view.addSubview(button)
            
        }
        
        
        
        
        
    }
    
    var incButtonYcoordinate = 0
    var incButtonXcoordinate = 0
    var widthOfTheIncButton = 0
    var heightOfTheIncButton = 0
    
    private func createIncButton()
    {
        
        if CounterManager.sharedManager.multiCounterArray[id]!.IncDecButtonConfig == 2 ||
            CounterManager.sharedManager.multiCounterArray[id]!.IncDecButtonConfig == 1
        {
            
            // y-coordinate of the button is always fixed
            self.incButtonYcoordinate = Int(self.view.bounds.height * 0.5)
            self.incButtonXcoordinate = Int(self.view.bounds.width * 0.3)
            
            
//            if counter.IncDecButtonConfig == .onlyIncButton
//            {
//                // single button, position in the middle of the screen
//                incButtonXcoordinate = Int(self.view.bounds.width * 0.3)
//            }
//            else
            
            
            if CounterManager.sharedManager.multiCounterArray[id]!.IncDecButtonConfig == 2 ||
                CounterManager.sharedManager.multiCounterArray[id]!.IncDecButtonConfig == 1
            {
                // two button config.. Lets check whether left-handed or not.
                if UserLeftHanded
                {
                    incButtonXcoordinate = Int(self.view.bounds.width * (1/8))
                    
                }
                else
                {
                    incButtonXcoordinate = Int(self.view.bounds.width * (4/8))
                }
                
            }
            
            
             widthOfTheIncButton = Int(self.view.bounds.width * (3/8))
             heightOfTheIncButton = widthOfTheIncButton
            
            
            //let button = UIButton(frame: CGRect(x: incButtonXcoordinate, y: incButtonYcoordinate, width: 100, height: 100 ))
            let button = DynamicButton(frame: CGRect(x: incButtonXcoordinate,
                                                     y: incButtonYcoordinate,
                                                     width: widthOfTheIncButton,
                                                     height: heightOfTheIncButton )
            )
//            button.backgroundColor = UIColor.black
//            button.setTitle("", for: .normal)
////            button.setTitle("+", for: .normal)
//            button.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: UIControlState.highlighted)
//          button.setTitleColor(UIColor.white.withAlphaComponent(1.0), for: UIControlState.normal)
//            button.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 100.0)
            
            button.setStyle(DynamicButtonStyle.circlePlus, animated: true)
            button.backgroundColor = CounterManager.sharedManager.multiCounterArray[id]!.BackgroundColor
            button.strokeColor = UIColor.white
            
            
            
            button.addTarget(self, action: #selector(self.buttonIncClicked), for:  UIControlEvents.touchUpInside)
            button.isUserInteractionEnabled = true
            
            
            
            
            
            //button.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControlEvents#>)
            self.view.addSubview(button)
            
        }
        
        
        
        
    }
    
    private func createResetButton()
    {
        
        // y-coordinate of the button is always fixed
        let resetButtonYcoordinate = Int(self.view.bounds.height * (0.8))
        var resetButtonXcoordinate = Int(self.view.bounds.width * 0.4)
        let widthOfTheButton = Int(self.view.bounds.width * (3/32))
        let heightOfTheButton = widthOfTheButton
        
        
        if CounterManager.sharedManager.multiCounterArray[id]!.IncDecButtonConfig == 2
        {
            if UserLeftHanded {
                resetButtonXcoordinate = Int((decButtonXcoordinate - incButtonXcoordinate - widthOfTheIncButton) / 2 + (incButtonXcoordinate + widthOfTheIncButton ))
                
                
            }
            else {
                resetButtonXcoordinate = Int((incButtonXcoordinate - decButtonXcoordinate - widthOfTheDecButton) / 2 + (decButtonXcoordinate + widthOfTheDecButton ))
                
            }
            
        } else if CounterManager.sharedManager.multiCounterArray[id]!.IncDecButtonConfig == 3 ||
            CounterManager.sharedManager.multiCounterArray[id]!.IncDecButtonConfig == 1
        {
            // in single button configuration, draw reset button just in the middle of x-axis
            resetButtonXcoordinate = Int(self.view.bounds.width * 0.5)
            
        }
        
        
        
        
        let button = DynamicButton(frame: CGRect(x: resetButtonXcoordinate,
                                                 y: resetButtonYcoordinate ,
                                                 width: widthOfTheButton,
                                                 height: heightOfTheButton )
            )
        
        
            button.setStyle(DynamicButtonStyle.reload , animated: true)
            button.backgroundColor = CounterManager.sharedManager.multiCounterArray[id]!.BackgroundColor
            button.strokeColor = UIColor.white
            
            
            
            button.addTarget(self, action: #selector(self.buttonResetClicked), for:  UIControlEvents.touchUpInside)
            button.isUserInteractionEnabled = true
            
            self.view.addSubview(button)
    }
    
    @objc private func buttonResetClicked()
    {
        //show the alert
        let alert = UIAlertController(title: "RESET Counter", message: "Do you want to RESET?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: {action in
            
            // Update MODEL
            CounterManager.sharedManager.multiCounterArray[self.id]!.resetCounterToValue(resetToValue: CounterManager.sharedManager.multiCounterArray[self.id]!.ResetValue )
            
            
            // Update VIEW
            self.DisplayValue = CounterManager.sharedManager.multiCounterArray[self.id]!.counterGetSet
            
        }))
        
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
   
    @objc private func buttonDecClicked()
    {
        if CounterManager.sharedManager.multiCounterArray[id]!.counterGetSet >= CounterManager.sharedManager.multiCounterArray[id]!.IncDecStepSize
        {
            // Update MODEL
            CounterManager.sharedManager.multiCounterArray[id]!.decrementCounter()
            
            //Update VIEW.. give the current value of the counter model to the display
            DisplayValue = CounterManager.sharedManager.multiCounterArray[id]!.counterGetSet
            
            if CounterManager.sharedManager.multiCounterArray[id]!.VibrationOnOff == false
            {
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
                
            }
            
            if CounterManager.sharedManager.multiCounterArray[id]!.SoundOnOff == false
            {
                // 1104 iyi.
                AudioServicesPlaySystemSound(1104)
                
            }
            
            
            
            
        }
            
        else
        {
            // BEEP sound
            
            if CounterManager.sharedManager.multiCounterArray[id]!.SoundOnOff == false
            {
                //1200 kotu,
                AudioServicesPlaySystemSound(1112)
                
            }
            
            
            // vibration
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            //show the alert
            let alert = UIAlertController(title: "Lower Limit Reached!", message: "You've reached the Lower Limit!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }

        
    }
    
    @objc private func buttonIncClicked()
    {
        if CounterManager.sharedManager.multiCounterArray[id]!.counterGetSet <= CounterManager.sharedManager.multiCounterArray[id]!.UpperLimit - CounterManager.sharedManager.multiCounterArray[id]!.IncDecStepSize
        {
            // Update MODEL
            CounterManager.sharedManager.multiCounterArray[id]!.incrementCounter()
            
            //Update VIEW.. give the current value of the counter model to the display
            DisplayValue = CounterManager.sharedManager.multiCounterArray[id]!.counterGetSet
            
            //audioPlayer.play()
            
            
            if CounterManager.sharedManager.multiCounterArray[id]!.VibrationOnOff == false
            {
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
                
            }
            
            if CounterManager.sharedManager.multiCounterArray[id]!.SoundOnOff == false
            {
                AudioServicesPlaySystemSound(1105)
                
            }
            
           
            
            
        }
        else
        {
            // BEEP sound
            
            if CounterManager.sharedManager.multiCounterArray[id]!.SoundOnOff == false
            {
                // 1112 is OK
                AudioServicesPlaySystemSound(1112)
                
            }
            
            
            //show the alert
            let alert = UIAlertController(title: "Upper Limit Reached!", message: "You've reached the Upper Limit!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }

        
    }
    
    
    
    
    
    
    // MODEL
    //public var counter = Counter()
    
    
    @IBOutlet weak var nameOfTheCounterLabel: UILabel!
    
    private var NameOfTheCounter: String {
        get{ return nameOfTheCounterLabel.text! }
        set{nameOfTheCounterLabel.text = newValue}
    }
    
    
    @IBOutlet weak var counterDisplay: UILabel!
    
    private var  DisplayValue: Int
        {
        
        get
        {
            return Int(counterDisplay.text!)!
        }
        
        set{
            
            counterDisplay.text = String(newValue)
            
            
        }
    }
    
    
    
    @IBOutlet weak var stepSizeDisplay: UILabel!
    
    private var StepSizeDisplay: Int{
        
        get{
            return Int(stepSizeDisplay.text!)!
        }
        
        set{
            var stringValue = String(newValue)
            stringValue = "+".appending(stringValue)
            stepSizeDisplay.text = stringValue
        }
    }
    
    
    
    
    
    
    
    
    
    
    @IBAction func buttonReset(_ sender: UIButton) {
        
        
        
        //show the alert
        let alert = UIAlertController(title: "RESET Counter", message: "Do you want to RESET?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: {action in
        
            // Update MODEL
            CounterManager.sharedManager.multiCounterArray[self.id]!.resetCounterToValue(resetToValue: CounterManager.sharedManager.multiCounterArray[self.id]!.ResetValue )
            
            
            // Update VIEW
            self.DisplayValue = CounterManager.sharedManager.multiCounterArray[self.id]!.counterGetSet
        
        }))
        
        
        self.present(alert, animated: true, completion: nil)
        
        

    }
    
    
    
    @IBOutlet weak var incButtonLeftMargin: NSLayoutConstraint!
    
    
    @IBOutlet weak var incButtonRightMargin: NSLayoutConstraint!
    
    
    
    @IBOutlet weak var decButtonLeftMargin: NSLayoutConstraint!
    
    
    @IBOutlet weak var decButtonRightMargin: NSLayoutConstraint!
    
    
    //var positionOfIncButtonToRight = 0
    
    
    
    
    var positionOfIncButtonToRight: CGFloat = 0.0// = CGFloat(0)
    var positionOfIncButtonToLeft: CGFloat = 0.0//= CGFloat(0)
    var positionOfDecButtonToRight: CGFloat = 0.0// = CGFloat(0)
    var positionOfDecButtonToLeft: CGFloat = 0.0//= CGFloat(0)
    
    public var PositionOfIncButtonToTheRight: CGFloat {
        
        
        get{ return positionOfIncButtonToRight}
        set{ positionOfIncButtonToRight = newValue }
        
    }
    
    
    public var PositionOfIncButtonToTheLeft: CGFloat{
        get{ return positionOfIncButtonToLeft}
        set{positionOfIncButtonToLeft = newValue}
    }
    
    
    
    public var PositionOfDecButtonToTheRight: CGFloat {
        
        get{ return positionOfDecButtonToRight }
        set{ positionOfDecButtonToRight = newValue }
        
    }
    
    
    public var PositionOfDecButtonToTheLeft: CGFloat{
        get{ return positionOfDecButtonToLeft}
        set{positionOfDecButtonToLeft = newValue}
    }
    
    
    
    
    
    @IBAction func barButtonItemSettings(_ sender: Any)
    {
        
        
    }
    
    
    @IBOutlet weak var incrementButtonOutlet: UIButton!
    
    
    @IBOutlet weak var decrementButtonOutlet: UIButton!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        if (segue.identifier == "UserSettingsSegue")
        {
            
            
                // Pass current settings to the new controller
                let destinationViewController = segue.destination as? SettingsTableViewController
            
                destinationViewController?.ID = CounterManager.sharedManager.multiCounterArray[self.ID]!.ID
            
                destinationViewController?.ResetValue = CounterManager.sharedManager.multiCounterArray[self.ID]!.ResetValue
                destinationViewController?.Counter = CounterManager.sharedManager.multiCounterArray[self.ID]!.counterGetSet
                destinationViewController?.StepSize = CounterManager.sharedManager.multiCounterArray[self.ID]!.IncDecStepSize
                destinationViewController?.UpperLimit = CounterManager.sharedManager.multiCounterArray[self.ID]!.UpperLimit
                destinationViewController?.UserLeftHanded = CounterManager.sharedManager.multiCounterArray[self.ID]!.UserLeftHanded
                destinationViewController?.IncDecButtonConfig = CounterManager.sharedManager.multiCounterArray[self.ID]!.IncDecButtonConfig
                destinationViewController?.Name = CounterManager.sharedManager.multiCounterArray[self.ID]!.Name
                destinationViewController?.VibrationOnOff = CounterManager.sharedManager.multiCounterArray[self.ID]!.VibrationOnOff
                destinationViewController?.BackgroundColor = CounterManager.sharedManager.multiCounterArray[self.ID]!.BackgroundColor
                destinationViewController?.SoundOnOff = CounterManager.sharedManager.multiCounterArray[self.ID]!.SoundOnOff
                
            
            
        }
        
    }
    
    
    
    


}

