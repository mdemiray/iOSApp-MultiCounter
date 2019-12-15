//
//  CounterManager.swift
//  Counter
//
//  Created by Muharrem Demiray on 2017-03-15.
//  Copyright © 2017 Muharrem Demiray. All rights reserved.
//

import Foundation
import UIKit

class CounterManager : NSObject, UIPageViewControllerDataSource
{
    static let sharedManager = CounterManager()
    
    // MARK: MODEL
    //var multiCounterArray: [Counter]    //(repeating: nil, count: 10)
    var multiCounterArray = [Counter?](repeating: nil, count: 10)
    
    
    
    override init()
    {
        super.init()
        
        for index in 0...9
        {
            multiCounterArray[index] = Counter()
            multiCounterArray[index]!.ID = index     // i.e. [Counter0, Counter1, Counter2...... Counter9]
            multiCounterArray[index]!.Name = "Counter " + String(index + 1)
        }
        
        
        
        unarchiveCounter()
        
        
    }
    
    
    
    private var currentIDofTheCounter = 0
    
    public var CurrentIDofTheCounter : Int{
        get{return currentIDofTheCounter}
        set{currentIDofTheCounter = newValue}
    }
    
    
    
    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> CounterViewController? {
        
        if (multiCounterArray.count == 0) || (index >= multiCounterArray.count)
        {
            return nil
        }
        
        // Create a new view controller
        let newCounterViewController = storyboard.instantiateViewController(withIdentifier: "CounterViewController") as! CounterViewController
        
        
        // pass suitable data to newly created viewcontroller
        newCounterViewController.ID = index
        newCounterViewController.view.tag = index
        
        
//        newCounterViewController.Name = multiCounterArray[index].Name
//        newCounterViewController.CounterValue = multiCounterArray[index].counterGetSet
//        newCounterViewController.StepSize = multiCounterArray[index].IncDecStepSize
//        newCounterViewController.ResetValue = multiCounterArray[index].ResetValue
//        newCounterViewController.UpperLimit = multiCounterArray[index].UpperLimit
//        newCounterViewController.BackgroundColor = multiCounterArray[index].BackgroundColor
//        newCounterViewController.UserLeftHanded = multiCounterArray[index].UserLeftHanded
//        newCounterViewController.SoundOnOff = multiCounterArray[index].SoundOnOff
//        newCounterViewController.VibrationOnOff = multiCounterArray[index].VibrationOnOff
//        newCounterViewController.IncDecButtonConfig = multiCounterArray[index].IncDecButtonConfig
        
        return newCounterViewController
        
    }
    
    
    
    
    func indexOfViewController(_ viewController: CounterViewController) -> Int
    {
        
       //return multiCounterArray[currentIDofTheCounter]!.ID       // maybe  +1
        return viewController.ID
        
//        for index in 0...multiCounterArray.count
//        {
//            if(index == currentIDofTheCounter)
//            {
//                
//            }
//        }
        
        // return pageData.index(of: viewController.dataObject) ?? NSNotFound
    }
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        var index = self.indexOfViewController(viewController as! CounterViewController)
        
        if (index == 0)
        {
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        var index = self.indexOfViewController(viewController as! CounterViewController)
        
//        if index == NSNotFound {
//            return nil
//        }
        
        index += 1
        
        //currentIDofTheCounter = index
        
        
        if index == multiCounterArray.count
        {
            return nil
        }
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    
    
        
    
    // to be able to display page indicator which is bottom by default.
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return multiCounterArray.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return self.CurrentIDofTheCounter
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // archieving file name...this name must differentiate from the previous app.
    let fileName = "MultiCounterArchievedCounterValues"
    
    func archieveCounter()
    {
        let dirPath = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0] as String
        let pathArray = [dirPath, fileName]
        let fileURL =  NSURL.fileURL(withPathComponents: pathArray)!
        
        NSKeyedArchiver.archiveRootObject(self.multiCounterArray, toFile: fileURL.path)
    }
    
    
    
    func unarchiveCounter()
    {
        let dirPath = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0] as String
        let pathArray = [dirPath, fileName]
        let fileURL =  NSURL.fileURL(withPathComponents: pathArray)!
        
        let path = fileURL.path
        let unarchievedCounter = NSKeyedUnarchiver.unarchiveObject(withFile: path)
        
        if unarchievedCounter != nil
        {
            self.multiCounterArray = unarchievedCounter as! [Counter]
        }
    }
    
}
