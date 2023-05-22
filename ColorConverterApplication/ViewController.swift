//
//  ViewController.swift
//  ColorConverterApplication
//
//  Created by Semih Ekmen on 4.02.2023.
//


//. SEGMENT CONTROLLER USAGE

import UIKit

class ViewController: UIViewController {
    /*
     These are objects that you can need some features of components.
     You can connect structures with 3 way. These are: Outlet,Action,Outlet Action
     NOTE: if you wanna remove an object, you should go to main.stroyboard and select the viewController and go to the connection
     inspecters section. you will see your object that you wants remove. Now, you can disconnet yopur object and remove code line from viewController.
     
     */
    @IBOutlet weak var redTextField: UITextField!  //Red TextField Object
    @IBOutlet weak var greenTextField: UITextField! //Green TextField Object
    @IBOutlet weak var blueTextField: UITextField!     // Blue TextField Object
    @IBOutlet weak var colorCodeSeem: UILabel!    // Label Which shows color code
    @IBOutlet weak var colorSeem: UILabel!        // label which shows color UI
    @IBOutlet weak var convertButton: UIButton!    // convert button
    var currentIndex:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /*
     Segment Component Controller Function:
     if you realize that function parameter there is an underscore chracter. That meaning is there is no required to parameters definition word.
     */
    @IBAction func segmentController(_ sender: UISegmentedControl) {
        currentIndex = sender.selectedSegmentIndex   // sender is object and comes from segmenController function. it gives us some datas about component.
        getDefault()
        if currentIndex == 0 {
            convertButton.setTitle("RGB to HEX", for: UIControl.State.normal)            
        }else{
            convertButton.setTitle("HEX to RGB", for: UIControl.State.normal)
        }
    }
    
    //Function made because of clear all config every section changed:
    func getDefault(){
        redTextField.text?.removeAll()
        greenTextField.text?.removeAll()
        blueTextField.text?.removeAll()
        colorCodeSeem.text?.removeAll()
        colorSeem.backgroundColor=UIColor.white
    }
    
    
    @IBAction func convertButtonOnAction(_ sender: UIButton) {
        print(currentIndex)
        if currentIndex == 0 {
        rgbToHex()// RGB to HEX
        }else{
        hexToRgb()// HEX to RGB
        }
    }
    // rgb to hext converter function with guard let usage
    func rgbToHex(){
        guard let redValue = UInt8(redTextField.text ?? "") else {return }          //guard let alternative usage of if let block. it is more short.
        guard let greenValue = UInt8(greenTextField.text ?? "") else {return}
        guard let blueValue = UInt8(blueTextField.text ?? "") else {return}
        print("check values \(redValue) \(blueValue) \(greenValue)")
        let redHexValue = String(format: "%2X", redValue)                                //These are color converter processing.
        let greenHexValue = String(format: "%2X", greenValue)
        let blueHexValue = String(format: "%2X", blueValue)
        colorCodeSeem.text = "HEX Code: # \(redHexValue) \(greenHexValue) \(blueHexValue)"
        colorSeem.backgroundColor =  UIColor(red: CGFloat(redValue)/256, green: CGFloat(greenValue)/256, blue: CGFloat(blueValue)/256, alpha: 1)
    }
    // hex to rgb converter function
    func hexToRgb(){
        guard let redValue = UInt8(redTextField.text ?? "",radix: 16) else {return}
        guard let greenValue = UInt8(greenTextField.text ?? "",radix: 16) else {return}
        guard let blueValue = UInt8(blueTextField.text ?? "",radix: 16) else {return}
        print("check colors \(redValue) \(greenValue) \(blueValue)")
        colorCodeSeem.text = "Red:\(redValue) Green:\(greenValue) Blue:\(blueValue)"
        colorSeem.backgroundColor=UIColor(red: CGFloat(redValue)/256, green: CGFloat(greenValue)/256, blue: CGFloat(blueValue)/256, alpha: 1)
    }
}


