//
//  SecondViewController.swift
//  Weather-Man2.0
//
//  Created by Tanvi Daga on 4/13/19.
//  Copyright © 2019 Tanvi Daga. All rights reserved.
//

import UIKit

struct line {
    var textField : UITextField
    var switchButton : UISwitch
    var slider : UISlider
    var label : UILabel
}

struct clothing {
    var name : String
    var temperature : Float
    var precipitationType : [Precipitation]
}

enum Precipitation {
    case RAIN, SNOW, SLEET
}

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var shortsSwitch: UISwitch!
    @IBOutlet weak var shortsSlider: UISlider!
    
    
    @IBOutlet weak var tshirtSwitch: UISwitch!
    @IBOutlet weak var tshirtSlider: UISlider!
    
    
    @IBOutlet weak var pantsSwitch: UISwitch!
    @IBOutlet weak var pantsSlider: UISlider!
    
    
    @IBOutlet weak var skirtSwitch: UISwitch!
    @IBOutlet weak var skirtSlider: UISlider!
    
    @IBOutlet weak var longSleevesSwitch: UISwitch!
    @IBOutlet weak var longSleevesSlider: UISlider!
    
    
    @IBOutlet weak var caprisSwitch: UISwitch!
    @IBOutlet weak var caprisSlider: UISlider!
    
    
    @IBOutlet weak var jacketSwitch: UISwitch!
    @IBOutlet weak var jacketSlider: UISlider!
    
    @IBOutlet weak var raincoatSwitch: UISwitch!
    @IBOutlet weak var raincoatSlider: UISlider!
    
    @IBOutlet weak var hoodieSwitch: UISwitch!
    @IBOutlet weak var hoodieSlider: UISlider!
    
    @IBOutlet weak var otherTF1: UITextField!
    @IBOutlet weak var otherLabel1: UILabel!
    @IBOutlet weak var switchOther1: UISwitch!
    @IBOutlet weak var sliderOther1: UISlider!
    
    @IBOutlet weak var otherTF2: UITextField!
    @IBOutlet weak var otherLabel2: UILabel!
    @IBOutlet weak var switchOther2: UISwitch!
    @IBOutlet weak var sliderOther2: UISlider!
    
    
    @IBOutlet weak var otherTF3: UITextField!
    @IBOutlet weak var otherLabel3: UILabel!
    @IBOutlet weak var switchOther3: UISwitch!
    @IBOutlet weak var sliderOther3: UISlider!
    
    
    @IBOutlet weak var otherTF4: UITextField!
    @IBOutlet weak var otherLabel4: UILabel!
    @IBOutlet weak var switchOther4: UISwitch!
    @IBOutlet weak var sliderOther4: UISlider!
    
    
    @IBOutlet weak var tempVal: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: self.view.frame.width - 100, height: self.view.frame.height + 500);
        scrollView.isScrollEnabled = true
        // Do any additional setup after loading the view.
        let line1 = line.init(textField: otherTF1, switchButton: switchOther1, slider: sliderOther1, label: otherLabel1)
        let line2 = line.init(textField: otherTF2, switchButton: switchOther2, slider: sliderOther2, label: otherLabel2)
        let line3 = line.init(textField: otherTF3, switchButton: switchOther3, slider: sliderOther3, label: otherLabel3)
        let line4 = line.init(textField: otherTF4, switchButton: switchOther4, slider: sliderOther4, label: otherLabel4)
        var buttonList = [line1, line2, line3, line4]
        for num in 1...buttonList.count - 1 {
            buttonList[num].textField.isHidden = true
            buttonList[num].switchButton.isHidden = true
            buttonList[num].slider.isHidden = true
            buttonList[num].label.isHidden = true
        }
        let sliderList = [shortsSlider, tshirtSlider, pantsSlider, skirtSlider, longSleevesSlider, caprisSlider, jacketSlider, sliderOther1, sliderOther2, sliderOther3, sliderOther4]
        for slider in sliderList {
            slider?.maximumValue = 100
            slider?.minimumValue = 0
        }
    }
    
    
    @IBAction func shortsSliderChanged(_ sender: Any) {
        tempVal.text = String(shortsSlider.value.rounded())
    }
    
    @IBAction func tshirtSliderChanged(_ sender: Any) {
        tempVal.text = String(tshirtSlider.value.rounded())
    }
    
    @IBAction func pantsSliderChanged(_ sender: Any) {
        tempVal.text = String(pantsSlider.value.rounded())
    }
    
    
    @IBAction func skirtSliderChanged(_ sender: Any) {
        tempVal.text = String(skirtSlider.value.rounded())
    }
    
    
    @IBAction func longsleevesSliderChanged(_ sender: Any) {
        tempVal.text = String(longSleevesSlider.value.rounded())
    }
    
    
    @IBAction func caprisSliderChanged(_ sender: Any) {
        tempVal.text = String(caprisSlider.value.rounded())
    }
    
    
    @IBAction func jacketSliderChanged(_ sender: Any) {
    tempVal.text = String(jacketSlider.value.rounded())
    }
    
    
    @IBAction func sliderOther1Changed(_ sender: Any) {
    tempVal.text = String(sliderOther1.value.rounded())
    }
    
    
    @IBAction func sliderOther2Changed(_ sender: Any) {
    tempVal.text = String(sliderOther2.value.rounded())
    }
    
    
    @IBAction func sliderOther3Changed(_ sender: Any) {
    tempVal.text = String(sliderOther3.value.rounded())
    }
    
    @IBAction func sliderOther4Changed(_ sender: Any) {
    tempVal.text = String(sliderOther4.value.rounded())
    }
    
}

/*
super.viewDidLoad()
// Do any additional setup after loading the view.
var line1 = line.init(textField: otherTF1, switchButton: otherSwitch1, slider: otherSlider1, label: otherLabel1)
var line2 = line.init(textField: otherTF2, switchButton: otherSwitch2, slider: otherSlider2, label: otherLabel2)
var line3 = line.init(textField: otherTF3, switchButton: otherSwitch3, slider: otherSlider3, label: otherLabel3)
var line4 = line.init(textField: otherTF4, switchButton: otherSwitch4, slider: otherSlider4, label: otherLabel4)
var buttonList = [line1, line2, line3, line4]
for num in 1...buttonList.count {
    buttonList[num].textField.isHidden = true
    buttonList[num].switchButton.isHidden = true
    buttonList[num].slider.isHidden = true
    buttonList[num].label.isHidden = true
}

let val = shortsSlider.value
print(val)
}*/
