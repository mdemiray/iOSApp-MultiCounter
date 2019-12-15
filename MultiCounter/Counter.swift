//
//  Counter.swift
//  Counter
//
//  Created by Muharrem Demiray on 2017-02-06.
//  Copyright © 2017 Muharrem Demiray. All rights reserved.
//

import Foundation
import UIKit

class Counter: NSObject, NSCoding
{
    
    private var id = 0
    private var name = "Counter Name"
    private var counter  = 0  // this variable will be updated whenever increment or decrement button is pressed.
    private var incDecStepSize = 1   // its by default set to 1, but user can change the incremental step size
    private var resetValue = 0
    private var upperLimit = 9999
    private var isUserLefthanded = false
    private var incDecButtonConfig = 2  // 1: +    , 2: +-      , 3: -
    private var isVibrationOff = true
    private var backgroundColor = UIColor("#123456")
    private var isSoundOff = false
    
//    init(name: String,
//         value: Int,
//         stepSize: Int,
//         resetValue: Int,
//         upperLimit: Int,
//         userLeftHanded: Bool,
//         buttonConfig: UserSettings.IncDecButtonConfigEnum,
//         vibrationOff: Bool,
//         backgroundColor: UIColor,
//         soundOff: Bool){
//        
//        self.name = name
//        self.counter = value
//        self.incDecStepSize = stepSize
//        self.resetValue = resetValue
//        self.upperLimit = upperLimit
//        self.isUserLefthanded = userLeftHanded
//        self.incDecButtonConfig = buttonConfig
//        self.isVibrationOff = vibrationOff
//        self.backgroundColor = backgroundColor
//        self.isSoundOff = soundOff
//        
//    }
    
    
    override init()
    {
        super.init()
    }
    
    // Failable initializer: required convenince init?()
    required convenience init?(coder decoder: NSCoder){
        
        self.init()
        
        if let decodedName = decoder.decodeObject(forKey: "name") as? String
        {
            self.name = decodedName
        }
        
        self.id = decoder.decodeInteger(forKey: "id")
        self.counter = decoder.decodeInteger(forKey: "value")
        self.incDecStepSize = decoder.decodeInteger(forKey: "stepSize")
        self.resetValue = decoder.decodeInteger(forKey: "resetValue")
        self.upperLimit = decoder.decodeInteger(forKey: "upperLimit")
        self.isUserLefthanded = decoder.decodeBool(forKey: "userLeftHanded")
        self.incDecButtonConfig = decoder.decodeInteger(forKey: "buttonConfig")
        
        self.isVibrationOff = decoder.decodeBool(forKey: "vibrationOff")
        
        if let decodedBackgroundColor = decoder.decodeObject(forKey: "backgroundColor") as? UIColor
        {
            self.backgroundColor = decodedBackgroundColor
        }
        
        self.isSoundOff = decoder.decodeBool(forKey: "soundOff")
        
        
        
//        guard let name = decoder.decodeObject(forKey: "name") as? String,
//        let buttonConfig = decoder.decodeObject(forKey: "buttonConfig") as? UserSettings.IncDecButtonConfigEnum,
//        let backgroundColor = decoder.decodeObject(forKey: "backgroundColor") as? UIColor
//        else
//        {
//            return nil
//        }
//        
//        self.init(name: name,
//                  value: decoder.decodeInteger(forKey: "value"),
//                  stepSize: decoder.decodeInteger(forKey: "stepSize"),
//                  resetValue: decoder.decodeInteger(forKey: "resetValue"),
//                  upperLimit: decoder.decodeInteger(forKey: "upperLimit"),
//                  userLeftHanded: decoder.decodeBool(forKey: "userLeftHanded"),
//                  buttonConfig: buttonConfig,
//                  vibrationOff: decoder.decodeBool(forKey: "vibrationOff"),
//                  backgroundColor: backgroundColor,
//                  soundOff: decoder.decodeBool(forKey: "soundOff")
//                  )
//        
        
    }
    
    
    func encode(with coder: NSCoder) {
        coder.encode(self.id, forKey: "id")
        coder.encode(self.name, forKey: "name")
        coder.encode(self.counter, forKey: "value")
        coder.encode(self.incDecStepSize, forKey: "stepSize")
        coder.encode(self.resetValue, forKey: "resetValue")
        coder.encode(self.upperLimit, forKey: "upperLimit")
        coder.encode(self.isUserLefthanded, forKey: "userLeftHanded")
        coder.encode(self.incDecButtonConfig, forKey: "buttonConfig")
        coder.encode(self.isVibrationOff, forKey: "vibrationOff")
        coder.encode(self.backgroundColor, forKey: "backgroundColor")
        coder.encode(self.isSoundOff, forKey: "soundOff")
    }
    
    
    
    
    
//    required convenience init(coder decoder: NSCoder) {
//        self.init()
//        
//        if let restoredCounterName = decoder.decodeObject(forKey: "CounterName") as? String {
//            Name = restoredCounterName
//        }
//        
//       
//        counterGetSet = decoder.decodeInteger(forKey: "CounterValue")
//            
//        
//        
//        IncDecStepSize = decoder.decodeInteger(forKey: "StepSize")
//        
//        
//        //        restoredCounterName = coder.decodeObject(forKey: "CounterName") as! String
//        //        restoredCounterValue = Int(coder.decodeCInt(forKey: "CounterValue"))
//        //        restoredStepSize = Int(coder.decodeCInt(forKey: "StepSize"))
//        //        restoredResetValue = Int(coder.decodeCInt(forKey: "ResetValue"))
//        //        restoredUpperLimit = Int(coder.decodeCInt(forKey: "UpperLimit"))
//        //        restoredUserLeftHanded = coder.decodeBool(forKey: "UserLeftHanded")
//        //        restoredIncDecButtonConfig = coder.decodeObject(forKey: "IncDecButtonConfig") as! UserSettings.IncDecButtonConfigEnum
//        //        restoredVibrationOnOff = coder.decodeBool(forKey: "VibrationOnOff")
//        //        restoredBackgroundColor = coder.decodeObject(forKey: "BackgroundColor") as! UIColor
//        //        restoredSoundOnOff = coder.decodeBool(forKey: "SoundOnOff")
//        
//        
//        
//    }
    
    
    // TODO: what happens if counter hits the upper limit?
    
    
    public var ID: Int {
        get{return id}
        set{id = newValue}
    }
    
    public var SoundOnOff: Bool{
        get{return isSoundOff}
        set{isSoundOff = newValue}
    }
    
    public var BackgroundColor: UIColor {
        get{ return backgroundColor}
        set{backgroundColor = newValue}
    }
    
    
    public var Name: String{
        get{return name}
        set{name = newValue}
    }
    
    
    
    
    public var VibrationOnOff: Bool {
    get{return isVibrationOff}
    set{isVibrationOff = newValue}
    }
    
    
    public var IncDecButtonConfig: Int {
        get{ return incDecButtonConfig}
        set{incDecButtonConfig = newValue }
    }
    
    public var UserLeftHanded: Bool{
        get{return isUserLefthanded}
        set{ isUserLefthanded = newValue}
    }
    
    public var UpperLimit: Int{
        
        get{return upperLimit}
        set{upperLimit = newValue}
    }
    
    
    public var counterGetSet: Int
        {
            get{ return counter}

            set{ counter = newValue}
            
        }
    
    public var IncDecStepSize: Int
        {
        
        get{return incDecStepSize}
        set{incDecStepSize = newValue}
    }
    
    
    public var ResetValue: Int {
        
        get{ return resetValue}
        set{resetValue = newValue}
    }
    
    
    
    public func incrementCounter()
    {
        //counter += incDecStepSize
        counterGetSet = counterGetSet + incDecStepSize
        
    }
    
    public func decrementCounter()
    {
        //counter -= incDecStepSize
        counterGetSet = counterGetSet - incDecStepSize
    }
    
    
    public func resetCounterToValue(resetToValue: Int)
    {
        counterGetSet = resetToValue
    }
    
    
    
    
    
    
}


