//
//  ViewController.swift
//  EMA01_Hello_World
//
//  Created by Moritz Müller on 13.04.17.
//  Copyright © 2017 Moritz Müller. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var helloWorld: UILabel!
    @IBOutlet weak var changeTextSize: UISlider!
    @IBOutlet weak var colorPicker: UIPickerView!
    @IBOutlet weak var pressToSayHello: UIButton!
    
    
    
    var username = "Moritz"
    var helloWorldWasPressed = false
    
    
   

    let colors:[(name: String, color: UIColor)] = [("Black", .black), ("Red", .red), ("Blue", .blue),
                                                   ("Green", .green), ("Gray", .gray), ("Purple", .purple)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        colorPicker.dataSource = self
        colorPicker.delegate = self
        pressToSayHello.layer.cornerRadius = 3
        pressToSayHello.layer.borderWidth = 1
        pressToSayHello.backgroundColor = .gray
        pressToSayHello.layer.borderColor = UIColor.gray.cgColor
        pressToSayHello.setTitleColor(.white, for: .normal)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func pressHelloWorld(_ sender: UIButton) {
        // just wanted to realise the function with guards
        guard helloWorldWasPressed == false else {
            guard helloWorldWasPressed == true else {
                return
            }
            
            helloWorld.text = "Hello..."
            helloWorldWasPressed = false
            return
        }
        
        helloWorld.text?.append(username)
        helloWorldWasPressed = true
        
        
    }
    //changing the fontsize for the label
    @IBAction func sliderMoved(_ sender: UISlider) {
        
        let currentValue = CGFloat(sender.value)
        helloWorld.font = UIFont(name: helloWorld.font.fontName, size: currentValue)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        helloWorld.textColor = colors[row].color
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row].name
    }
    
}

