//
//  BackgroundColorViewController.swift
//  Counter
//
//  Created by Muharrem Demiray on 2017-02-12.
//  Copyright © 2017 Muharrem Demiray. All rights reserved.
//

import UIKit
import DynamicButton
import UIColor_Hex_Swift

class BackgroundColorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()

        
    }
    
    private var id = 0
    private var name = "My Counter"
    private var counter = 0
    
    private var stepSize = 1
    
    private var resetValue = 0
    private var upperLimit = 9999
    private var isUserLefthanded = false
    private var incDecButtonConfig = 2
    
    private var isVibrationOff = true
    private var backgroundColor = UIColor.darkGray
    private var isSoundOff = false
    
    
    public var ID: Int {
        get{return id}
        set{id = newValue}
    }
    
    public var SoundOnOff: Bool {
        get{return isSoundOff}
        set{isSoundOff = newValue}
    }
    
    public var BackgroundColor: UIColor{
        get{return backgroundColor}
        set{backgroundColor = newValue}
    }
    
    public var VibrationOnOff: Bool {
        get{return isVibrationOff}
        set{isVibrationOff = newValue}
    }
    
    
    public var Name: String {
        get{ return name}
        set{name = newValue}
    }
    
    
    public var incDecButtonConfigGetSet: Int {
        get{ return incDecButtonConfig}
        set{incDecButtonConfig = newValue}
    }
    
    
    
    
    
    public var UserLeftHanded: Bool {
        get{return isUserLefthanded}
        set{isUserLefthanded = newValue}
    }
    
    
    
    
    public var UpperLimit:Int{
        get{return upperLimit}
        set{upperLimit = newValue}
    }
    
    public var StepSize: Int
        {
        get{return stepSize}
        set{stepSize = newValue}
    }
    
    public var Counter: Int {
        get{return counter}
        set{counter = newValue}
    }
    
    public var ResetValue: Int{
        get{return resetValue}
        set{resetValue = newValue}
    }
    

    
    
    
    
    
    
    // MARK: MODEL
    private var color = UIColor.black
    
    public var Color:UIColor{
        get{return color}
        set{color = newValue}
    }
    
    @IBOutlet weak var dynamicButtonClose: DynamicButton!
    
    private func updateView()
    {
        dynamicButtonClose.setStyle(DynamicButtonStyle.circleClose, animated: true)
        
        Color_1_1_Outlet.backgroundColor = myColorsStruct.color_1_1
        Color_1_2_Outlet.backgroundColor = myColorsStruct.color_1_2
        Color_1_3_Outlet.backgroundColor = myColorsStruct.color_1_3
        Color_1_4_Outlet.backgroundColor = myColorsStruct.color_1_4
        Color_2_1_Outlet.backgroundColor = myColorsStruct.color_2_1
        Color_2_2_Outlet.backgroundColor = myColorsStruct.color_2_2
        Color_2_3_Outlet.backgroundColor = myColorsStruct.color_2_3
        Color_2_4_Outlet.backgroundColor = myColorsStruct.color_2_4
        Color_3_1_Outlet.backgroundColor = myColorsStruct.color_3_1
        Color_3_2_Outlet.backgroundColor = myColorsStruct.color_3_2
        Color_3_3_Outlet.backgroundColor = myColorsStruct.color_3_3
        Color_3_4_Outlet.backgroundColor = myColorsStruct.color_3_4
        Color_4_1_Outlet.backgroundColor = myColorsStruct.color_4_1
        Color_4_2_Outlet.backgroundColor = myColorsStruct.color_4_2
        Color_4_3_Outlet.backgroundColor = myColorsStruct.color_4_3
        Color_4_4_Outlet.backgroundColor = myColorsStruct.color_4_4
        Color_5_1_Outlet.backgroundColor = myColorsStruct.color_5_1
        Color_5_2_Outlet.backgroundColor = myColorsStruct.color_5_2
        Color_5_3_Outlet.backgroundColor = myColorsStruct.color_5_3
        Color_5_4_Outlet.backgroundColor = myColorsStruct.color_5_4
        
    }
    
    // create instance of this struct, like a creating an instance of a class
    let myColorsStruct = MyColors()
    
    public  struct MyColors {
         var color_1_1 = UIColor.black  // OK
         var color_1_2 = UIColor("#C125A0")  //OK
         var color_1_3 = UIColor.brown  // OK
         var color_1_4 = UIColor("#937FF0") //OK
         var color_2_1 = UIColor("#56789A") // OK
         var color_2_2 = UIColor("#A123E4") // OK
         var color_2_3 = UIColor("#52BCA1") //OK
         var color_2_4 = UIColor("#123456") // OK
         var color_3_1 = UIColor("#69ADCC") //OK
         var color_3_2 = UIColor("#FFA500")  // OK
         var color_3_3 = UIColor.lightGray // OK
         var color_3_4 = UIColor.gray // OK
         var color_4_1 = UIColor.orange // OK
         var color_4_2 = UIColor.magenta  // OK
         var color_4_3 = UIColor.darkGray // OK
         var color_4_4 = UIColor("#B125B1") //OK
         var color_5_1 = UIColor("#FD43AB")  // OK
         var color_5_2 = UIColor("#BB0AF1") //OK
         var color_5_3 = UIColor("#78CE96") // OK
         var color_5_4 = UIColor("#45DDEF") // OK
    }
    
    
    
    
    
    

    // MARK: ACTIONS
    @IBAction func Color_1_1(_ sender: UIButton) {
        self.Color = myColorsStruct.color_1_1
    }
    
    
    @IBAction func Color_1_2(_ sender: UIButton) {
        self.Color = myColorsStruct.color_1_2
    }
    
    
    @IBAction func Color_1_3(_ sender: UIButton) {
        self.Color = myColorsStruct.color_1_3
    }
    
    
    
    @IBAction func Color_1_4(_ sender: UIButton) {
        self.Color = myColorsStruct.color_1_4
    }
    
    
    
    @IBAction func Color_2_1(_ sender: UIButton) {
        self.Color = myColorsStruct.color_2_1
    }
    
    
    
    @IBAction func Color_2_2(_ sender: UIButton) {
        self.Color = myColorsStruct.color_2_2
    }
    
    
    @IBAction func Color_2_3(_ sender: UIButton) {
        self.Color = myColorsStruct.color_2_3
    }
    
    
    
    @IBAction func Color_2_4(_ sender: UIButton) {
        self.Color =  myColorsStruct.color_2_4
    }
    
    
    
    
    @IBAction func Color_3_1(_ sender: UIButton) {
        self.Color = myColorsStruct.color_3_1
    }
    
    @IBAction func Color_3_2(_ sender: UIButton) {
        self.Color = myColorsStruct.color_3_2
    }
    
    
    @IBAction func Color_3_3(_ sender: UIButton) {
        self.Color = myColorsStruct.color_3_3
    }
    
    
    @IBAction func Color_3_4(_ sender: UIButton) {
        self.Color = myColorsStruct.color_3_4
    }
    
    
    @IBAction func Color_4_1(_ sender: UIButton) {
        self.Color = myColorsStruct.color_4_1
    }
    
    
    @IBAction func Color_4_2(_ sender: UIButton) {
        self.Color = myColorsStruct.color_4_2
    }
    
    
    @IBAction func Color_4_3(_ sender: UIButton) {
        self.Color = myColorsStruct.color_4_3
    }
    
    
    @IBAction func Color_4_4(_ sender: UIButton) {
        self.Color = myColorsStruct.color_4_4
    }
    
    
   
    
    
    
    @IBAction func Color_5_1(_ sender: UIButton) {
        self.Color = myColorsStruct.color_5_1
    }
    
    
    
    @IBAction func Color_5_2(_ sender: UIButton) {
        self.Color = myColorsStruct.color_5_2
    }
    
    
    @IBAction func Color_5_3(_ sender: UIButton) {
        self.Color = myColorsStruct.color_5_3
    }
    
    
    @IBAction func Color_5_4(_ sender: UIButton) {
        self.Color = myColorsStruct.color_5_4
    }
    
    
    // MARK: OUTLETS
    
    @IBOutlet weak var Color_1_1_Outlet: UIButton!
    
    
    
    @IBOutlet weak var Color_1_2_Outlet: UIButton!
    
    
    
    @IBOutlet weak var Color_1_3_Outlet: UIButton!
    
    
    @IBOutlet weak var Color_1_4_Outlet: UIButton!
    
    
    
    @IBOutlet weak var Color_2_1_Outlet: UIButton!
    
    
    
    
    @IBOutlet weak var Color_2_2_Outlet: UIButton!
    
    
    @IBOutlet weak var Color_2_3_Outlet: UIButton!
    
    
    
    @IBOutlet weak var Color_2_4_Outlet: UIButton!
    
    
    @IBOutlet weak var Color_3_1_Outlet: UIButton!
    
    
    
    @IBOutlet weak var Color_3_2_Outlet: UIButton!
    
    
    
    @IBOutlet weak var Color_3_3_Outlet: UIButton!
    
    
    
    @IBOutlet weak var Color_3_4_Outlet: UIButton!
    
    
    
    @IBOutlet weak var Color_4_1_Outlet: UIButton!
    
    
    
    @IBOutlet weak var Color_4_2_Outlet: UIButton!
    
    
    
    @IBOutlet weak var Color_4_3_Outlet: UIButton!
    
    
    @IBOutlet weak var Color_4_4_Outlet: UIButton!
    
    
    @IBOutlet weak var Color_5_1_Outlet: UIButton!
    
    
    
    @IBOutlet weak var Color_5_2_Outlet: UIButton!
    
    
    
    @IBOutlet weak var Color_5_3_Outlet: UIButton!
    
    
    
    @IBOutlet weak var Color_5_4_Outlet: UIButton!
    
    
    
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "BackToSettingsSegue"
        {
            
            
            if let destinationViewController = segue.destination as? SettingsTableViewController
            {
                destinationViewController.ID = self.ID
                
                destinationViewController.BackgroundColor = self.Color
                
                // load back the other settings
                destinationViewController.Name = self.Name
                destinationViewController.Counter = self.Counter
                destinationViewController.StepSize = self.StepSize
                destinationViewController.ResetValue = self.ResetValue
                destinationViewController.UpperLimit = self.UpperLimit
                destinationViewController.UserLeftHanded = self.UserLeftHanded
                destinationViewController.SoundOnOff = self.SoundOnOff
                destinationViewController.VibrationOnOff = self.VibrationOnOff
                destinationViewController.IncDecButtonConfig = self.incDecButtonConfigGetSet
                
                
            }
        }
    }
    
 

}
