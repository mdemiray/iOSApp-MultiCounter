//
//  RootViewController.swift
//  MultiCounter
//
//  Created by Muharrem Demiray on 2017-03-19.
//  Copyright © 2017 Muharrem Demiray. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UIPageViewControllerDelegate {
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageViewController!.delegate = self
        
        // Do any additional setup after loading the view.
        
        
        
        pageViewController?.view.backgroundColor = CounterManager.sharedManager.multiCounterArray[id]!.BackgroundColor
        
        
        let startingViewController = CounterManager.sharedManager.viewControllerAtIndex(id, storyboard: self.storyboard!)!
        // customize startingviewcontroller here...
        
        //let currentViewController = CounterManager.sharedManager.viewControllerAtIndex(id, storyboard: self.storyboard!)!
        
        
        //UIPageControl.updateCurrentPageDisplay(<#T##UIPageControl#>)
        
        
        let viewControllers = [startingViewController]
        //let viewControllers2 = [currentViewController]
        //self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: false, completion: {done in})
        self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: true, completion: nil)
        
        //self.pageViewController!.setViewControllers(viewControllers2, direction: .forward, animated: false, completion: {done in})
        self.pageViewController!.dataSource = CounterManager.sharedManager
        self.addChildViewController(self.pageViewController!)
        self.view.addSubview(self.pageViewController!.view)
        
        self.pageViewController!.didMove(toParentViewController: self)
        
        
        
    }
    
    
    // MARK: Keep track of current pages here.
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        
            
            
            let index = pageViewController.viewControllers?.first?.view.tag
            CounterManager.sharedManager.CurrentIDofTheCounter = index!
            
            pageViewController.view.backgroundColor = CounterManager.sharedManager.multiCounterArray[CounterManager.sharedManager.CurrentIDofTheCounter]!.BackgroundColor
            
        
        
    }
    
    
    
    
    
    
    
    var pageViewController: UIPageViewController?
    
    
    
    private var id = 0
    
    public var ID: Int{
        get{return id}
        set{
            id = newValue
            CounterManager.sharedManager.CurrentIDofTheCounter = newValue
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

    
    private var backgroundColorOfRootController = UIColor.black
    
    public var BackgroundColorOfRootController: UIColor{
        get{return backgroundColorOfRootController}
        set{backgroundColorOfRootController = newValue}
    }
    
    //var startingViewController: CounterViewController? = nil
    

    
    
    
   
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
