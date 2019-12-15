//
//  SettingsTableViewController.swift
//  
//
//  Created by Muharrem Demiray on 2017-02-28.
//
//

import UIKit
import MessageUI

class SettingsTableViewController: UITableViewController, UITextFieldDelegate, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if ShouldBeClosed == true
        {
            performSegue(withIdentifier: "BackToCounterSegue2", sender: nil)
        }


       
        updateCurrentVIEW()
        
        // Update height of the Nav bars
        var navBarBounds = TopNavigationBarOutlet.bounds
        TopNavigationBarOutlet.frame = CGRect(x: 0, y: 0, width: navBarBounds.width, height: navBarBounds.height + 30)
        navBarBounds = bottomNavBarOutlet.bounds
        bottomNavBarOutlet.frame = CGRect(x: 0, y: 0, width: navBarBounds.width, height: navBarBounds.height + 15)
        
        TopNavigationBarOutlet.backgroundColor = self.BackgroundColor   //CounterManager.sharedManager.multiCounterArray[CounterManager.sharedManager.CurrentIDofTheCounter]!.BackgroundColor
        bottomNavBarOutlet.backgroundColor = self.BackgroundColor   //CounterManager.sharedManager.multiCounterArray[CounterManager.sharedManager.CurrentIDofTheCounter]!.BackgroundColor
        
        
        //textFieldCounterValueOutlet.keyboardType = .numberPad
        // I am (SettingsTableViewController) the delegate of all text fields inside my viewcontroller
        textFieldCounterNameOutlet.delegate = self
        textFieldCounterValueOutlet.delegate = self
        textFieldStepSizeOutlet.delegate = self
        textFieldResetValueOutlet.delegate = self
        textFieldUpperLimitOutlet.delegate = self
        
        
        
        
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if ShouldBeClosed == true
        {
            performSegue(withIdentifier: "BackToCounterSegue2", sender: nil)
        }
        
    }
    

    
    private func updateCurrentVIEW()
    {
        //self.navigationController?.isToolbarHidden = false
        //self.navigationController?.navigationBar.isHidden = false
        
        self.textFieldCounterNameOutlet.text = userSettings.Name
        self.textFieldCounterValueOutlet.text = String(userSettings.Counter)
        self.textFieldStepSizeOutlet.text = String(userSettings.StepSize)
        self.textFieldResetValueOutlet.text = String(userSettings.ResetValue)
        self.textFieldUpperLimitOutlet.text = String(userSettings.UpperLimit)
        //dynamicButtonSettingsOutlet.setStyle(DynamicButtonStyle.circleClose, animated: true)
        backgroundColorButtonOutlet.backgroundColor = self.BackgroundColor
        
        
        if userSettings.VibrationOnOff == true
        {
            self.vibrationOnOffOutlet.setOn(false, animated: true)
        }
        else
        {
            self.vibrationOnOffOutlet.setOn(true, animated: true)
        }
        
        
        // TODO:  Update new views
        
        if userSettings.UserLeftHanded
        {
            self.leftHandedSwitchOutlet.setOn(true, animated: true)
            
        }
        else
        {
            self.leftHandedSwitchOutlet.setOn(false, animated: true)
            
        }
        
        
        if userSettings.SoundOnOff
        {
            self.soundsOnOffSwitchOutlet.setOn(false, animated: true)
        }
        else
        {
            self.soundsOnOffSwitchOutlet.setOn(true, animated: true)
        }
        
        
        if userSettings.incDecButtonConfigGetSet == 2
        {
            //            self.counterConfigSegmentOutlet.setEnabled(false, forSegmentAt: 0)
            //            self.counterConfigSegmentOutlet.setEnabled(true, forSegmentAt: 1)
            //            self.counterConfigSegmentOutlet.setEnabled(false, forSegmentAt: 2)
            
            self.counterConfigSegmentOutlet.selectedSegmentIndex = 1
        }
        else if userSettings.incDecButtonConfigGetSet == 1
        {
            
            
            self.counterConfigSegmentOutlet.selectedSegmentIndex = 0
        }
        else if userSettings.incDecButtonConfigGetSet == 3
        {
            self.counterConfigSegmentOutlet.selectedSegmentIndex = 2
        }
        
        
        
    }


   private var shouldBeClosed = false
    
    public var ShouldBeClosed: Bool{
        get{return shouldBeClosed}
        set{shouldBeClosed = newValue}
    }
    
    
    // this is the ID of which settings are configured.
    var id = 0
    
    public var ID: Int{
        get{return id}
        set{id = newValue}
    }
   
    var ResetValue: Int{
        get{return userSettings.ResetValue}
        set{userSettings.ResetValue = newValue
        
        }
    }
    
    var StepSize: Int{
        get{ return userSettings.StepSize }
        set{userSettings.StepSize = newValue}
    }
    
    var Counter: Int{
        get{ return userSettings.Counter}
        set{userSettings.Counter = newValue}
    }
    
    
    var UpperLimit: Int{
        get{return userSettings.UpperLimit}
        set{ userSettings.UpperLimit = newValue}
    }
    
    
    var UserLeftHanded: Bool {
        get{return userSettings.UserLeftHanded}
        set{userSettings.UserLeftHanded = newValue}
    }
    
    var IncDecButtonConfig: Int {
        get{return userSettings.incDecButtonConfigGetSet}
        set{userSettings.incDecButtonConfigGetSet = newValue}
    }
    
    var Name: String{
        get{return userSettings.Name}
        set{userSettings.Name = newValue}
    }
    
    var VibrationOnOff: Bool {
        get{return userSettings.VibrationOnOff}
        set{ userSettings.VibrationOnOff = newValue}
    }
    
    var BackgroundColor: UIColor{
        get{return userSettings.BackgroundColor}
        set{userSettings.BackgroundColor = newValue}
    }
    
    var SoundOnOff: Bool {
        get{return userSettings.SoundOnOff}
        set{userSettings.SoundOnOff = newValue}
    }
    
    // MARK: MODEL
    var userSettings = UserSettings()
    
    
    
    @IBOutlet weak var textFieldCounterNameOutlet: UITextField!
    
    
    @IBOutlet weak var textFieldCounterValueOutlet: UITextField!
    
    
    
    @IBOutlet weak var textFieldStepSizeOutlet: UITextField!
    
    
    @IBOutlet weak var textFieldResetValueOutlet: UITextField!
    
    @IBOutlet weak var textFieldUpperLimitOutlet: UITextField!
    
    
    @IBAction func textFieldCounterNameAction(_ sender: UITextField) {
        
        if let inputText = sender.text
        {
            self.userSettings.Name = inputText
        }
    }
    
    @IBAction func textFieldResetValueAction(_ sender: UITextField) {
        
        if let inputText = Int(sender.text!)
        {
            self.userSettings.ResetValue = inputText
        }
    }
    
    
    
    @IBAction func textFieldStepSizeAction(_ sender: UITextField) {
        
        if let inputText = Int(sender.text!)
        {
            self.userSettings.StepSize = inputText
        }
    }
    
    
    @IBAction func textFieldUpperLimitaction(_ sender: UITextField) {
        
        if let inputText = Int(sender.text!)
        {
            self.userSettings.UpperLimit = inputText
        }
    }
    
    
    @IBAction func textFieldCounterAction(_ sender: UITextField) {
        
        if let inputText = Int(sender.text!)
        {
            self.userSettings.Counter = inputText
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func soundsOnOffSwitchAction(_ sender: UISwitch) {
        
        if sender.isOn
        {
            self.SoundOnOff = false
        }
        else
        {
            self.SoundOnOff = true
        }
    }
    
    
    
    @IBAction func vibrationOnOffSwitchAction(_ sender: UISwitch) {
        
        if sender.isOn
        {
            self.VibrationOnOff = false
        }
        else
        {
            self.VibrationOnOff = true
        }
    }
    
    
    
    @IBAction func leftHandedSwitchAction(_ sender: UISwitch) {
        
        if    sender.isOn
        {
            UserLeftHanded = true
        }
        else
        {
            UserLeftHanded = false
        }
        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //self.view.endEditing(true)
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
        self.tableView.endEditing(true)
    }
    
    
    
    
    
    
    
    @IBAction func counterConfigSegmentAction(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex
        {
        case 0: userSettings.incDecButtonConfigGetSet = 1
        case 1: userSettings.incDecButtonConfigGetSet = 2
        case 2: userSettings.incDecButtonConfigGetSet = 3
        default: break
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBOutlet weak var vibrationOnOffOutlet: UISwitch!
    
    
    @IBOutlet weak var soundsOnOffSwitchOutlet: UISwitch!
    
    
    @IBOutlet weak var leftHandedSwitchOutlet: UISwitch!
    
    
    @IBOutlet weak var counterConfigSegmentOutlet: UISegmentedControl!
    
    
    @IBOutlet weak var backgroundColorButtonOutlet: UIButton!
    
    @IBAction func supportPageButton(_ sender: UIButton) {
                
        if let url = NSURL(string: "http://muharremdemiray.blogspot.ca/2017/03/ios-app-support-multiple-counter-pro.html")
        {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
        
    }
    
    
    
    
    @IBOutlet weak var TopNavigationBarOutlet: UINavigationBar!
    
    @IBOutlet weak var bottomNavBarOutlet: UINavigationBar!
    
    
    @IBAction func rateButton(_ sender: UIButton) {
        // find and copy here iTunes URL of your own app.
        if let url = NSURL(string: "https://appsto.re/ca/wh3Nib.i")
        {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
    
    
    @IBAction func feedbackBUtton(_ sender: UIButton) {
        
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients(["muharrem.demiray@icloud.com"])
        mailComposerVC.setSubject("iOS Application: \"Multi Counter\" - Version: \(versionLabelOutlet.text!)")
        mailComposerVC.setMessageBody("Message body goes here...", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        
        //show the alert
        let alert = UIAlertController(title: "Could Not Send Email",
                                      message: "Your device could not send e-mail.  Please check e-mail configuration and try again.",
                                      preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    // MARK: MFMailComposeViewControllerDelegate
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBOutlet weak var versionLabelOutlet: UILabel!
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "BackToCounterSegue"
        {
            
            let destinationViewController = segue.destination as? RootViewController
            
            if destinationViewController != nil
            {
                
                destinationViewController?.ID = self.ID
                
                
                destinationViewController?.CounterValue = self.userSettings.Counter
                destinationViewController?.Name = self.userSettings.Name
                destinationViewController?.ResetValue = self.userSettings.ResetValue
                destinationViewController?.StepSize = self.userSettings.StepSize
                destinationViewController?.UpperLimit = self.userSettings.UpperLimit
                destinationViewController?.UserLeftHanded = self.userSettings.UserLeftHanded
                destinationViewController?.IncDecButtonConfig = self.userSettings.incDecButtonConfigGetSet
                
                destinationViewController?.VibrationOnOff = self.userSettings.VibrationOnOff
                destinationViewController?.BackgroundColor = self.userSettings.BackgroundColor
                destinationViewController?.SoundOnOff = self.SoundOnOff
                
                destinationViewController?.BackgroundColorOfRootController = self.BackgroundColor

                
            }
            
            
        }
        else if segue.identifier == "SetBackgroundColorSegue"
            
        {
            if let destination = segue.destination as? BackgroundColorViewController
            {
                destination.Color = self.userSettings.BackgroundColor
                destination.ID = self.ID
                
                //send other settings to the other MVC so that we can load it back
                destination.Name = self.Name
                destination.Counter = self.Counter
                destination.StepSize = self.StepSize
                destination.ResetValue = self.ResetValue
                destination.UpperLimit = self.UpperLimit
                destination.UserLeftHanded = self.UserLeftHanded
                destination.SoundOnOff = self.SoundOnOff
                destination.VibrationOnOff = self.VibrationOnOff
                destination.incDecButtonConfigGetSet = self.IncDecButtonConfig
                
            }
            
            
        }

    }
    

}
