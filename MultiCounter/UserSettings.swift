//
//  UserSettings.swift
//  Counter
//
//  Created by Muharrem Demiray on 2017-02-07.
//  Copyright © 2017 Muharrem Demiray. All rights reserved.
//

import Foundation
import UIKit


class UserSettings
{
    
    private var stepSize = 1
    private var counter = 0
    private var resetValue = 0
    private var upperLimit = 9999
    private var isUserLefthanded = false
    private var incDecButtonConfig = 2
    private var name = "My Counter"
    private var isVibrationOff = true
    private var backgroundColor = UIColor.darkGray
    private var isSoundOff = false
    
    
    public enum IncDecButtonConfigEnum{
        
        case onlyIncButton
        case onlyDecButton
        case bothIncAndDecButton
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
 
    
    
    
    
    
}
