//
//  DetailViewController.swift
//  Hub
//
//  Created by Panneerselvam, Rajkumar on 3/18/15.
//  Copyright (c) 2015 Panneerselvam, Rajkumar. All rights reserved.
//

import UIKit

class Profiles {
    var name : String?
    var requiresAuthentication : Bool?
    var environmentVariables : NSMutableDictionary?
    var launchImage : String?
}

class DetailViewController: UIViewController,UIPickerViewDelegate {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var flow1Button: UIButton!

    var textField: UITextField!
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        
        
        let dic = NSProcessInfo.processInfo().environment
        if dic["ShowProfile"] != nil {
            self.loadandShowProfiles()
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func flow1ButtonCliked(sender : AnyObject) {
       NSLog("Test")
    }
    
    //MARK: - Profile loading
    
    var validProfiles: NSMutableArray = ["Default"]
    var selectedProfile = "Default"
    
    func loadandShowProfiles(){
        if let path = NSBundle.mainBundle().pathForResource("Navigation", ofType: "plist") {
            if let dict = NSDictionary(contentsOfFile: path) as? Dictionary<String, AnyObject> {
                
                let profiles = dict["Profiles"] as Array <String>
                NSLog("Profile in plist %@", profiles)
                
                for profileNames in profiles{
                        if let profilePath = NSBundle.mainBundle().pathForResource(profileNames, ofType: "plist"){
                        validProfiles.addObject(profileNames)
                    }
                }
                
                NSLog("Valid profiles %@", validProfiles)
                
            }
        }
        
        self.addEnvironmentPicker()
    }
    
//    MARK: - Picker delegates
    
    func addEnvironmentPicker(){
        
        textField = UITextField(frame: CGRectMake(20, 250, view.frame.size.width - 40, 30))
        textField.backgroundColor = UIColor.redColor()
        view.addSubview(textField)
        
        var environmentPicker = UIPickerView(frame: CGRectMake(0, 200, view.frame.size.width, 300))
        environmentPicker.backgroundColor = UIColor.whiteColor()
        environmentPicker.showsSelectionIndicator = true
        environmentPicker.delegate = self
        
        
        
        var environmenttoolBar = UIToolbar()
        environmenttoolBar.barStyle = UIBarStyle.Default
        environmenttoolBar.translucent = true
        environmenttoolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        environmenttoolBar.sizeToFit()
        
        
        var doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Bordered, target: self, action: "donePicker")
        var spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        var cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Bordered, target: self, action: "canclePicker")
        
        environmenttoolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        environmenttoolBar.userInteractionEnabled = true
        
        textField.inputView = environmentPicker
        textField.inputAccessoryView = environmenttoolBar
    }
    
    func donePicker() {
        NSLog("Done clicked")
        self.view.endEditing(true)
        flow1Button.setTitle(selectedProfile, forState: UIControlState.Normal)

    }
    
    func canclePicker() {
        NSLog("Cancel clicked")
        self.view.endEditing(true)
    }
    
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return validProfiles.count
    }
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String{
        return validProfiles[row] as String
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        selectedProfile = validProfiles[row] as String
    }
    

}

