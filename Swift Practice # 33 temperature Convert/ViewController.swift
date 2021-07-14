//
//  ViewController.swift
//  Swift Practice # 33 temperature Convert
//
//  Created by CHEN PEIHAO on 2021/7/14.
//

import UIKit

class ViewController: UIViewController {
    
    //滑桿攝氏溫度@IBOutlet
    @IBOutlet weak var CelsiusNumber: UILabel!
    //滑桿華氏溫度@IBOutlet
    @IBOutlet weak var FahrenheitNumber: UILabel!
    //滑桿@IBOutlet
    @IBOutlet weak var CelsiusToFahrenheit: UISlider!
    
    //體溫@IBOutlet
    @IBOutlet weak var bodyTemperature: UILabel!
    
    //UITextField@IBOutlet
    @IBOutlet weak var inputTemperAtureTextField: UITextField!
    
    //Button的@IBOutlet
    @IBOutlet weak var changeuttonUIbutton: UIButton!
    
    //button顯示結果的Label@IBOutlet
    @IBOutlet weak var tempConvertUILabel: UILabel!
    
    
    //點選任何位置收鍵盤的function
    func hideKeyboardWhenTappedAround() {
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
    view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
    view.endEditing(true)
    }
    
    
    
    //最早就有的override
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    
    // slider移動的變化寫程式的位置
    @IBAction func temperatureChange(_ sender: Any) {
        
        //攝氏溫度顯示的變化，依照slider數值決定
        CelsiusNumber.text = "目前攝氏體溫 \((CelsiusToFahrenheit.value)) 度"
        
        
        //華氏溫度顯示的變化，依照slider數值決定
        FahrenheitNumber.text = "目前華氏體溫 \(( (CelsiusToFahrenheit.value)/5*9) + 32 ) 度"
        
        
        //體溫顯示內容的判斷式，依照不同slider數值決定不同的顯示的內容
        if CelsiusToFahrenheit.value < 30 {
            bodyTemperature.text = "注意體溫過低"
            bodyTemperature.textColor = UIColor.blue
            
        } else if CelsiusToFahrenheit.value > 60  {
            bodyTemperature.text = "要烤肉啦"
            bodyTemperature.textColor = UIColor.red
        }else if CelsiusToFahrenheit.value > 37.5 {
            bodyTemperature.text = "注意體溫過高"
            bodyTemperature.textColor = UIColor.red
        }else{
            bodyTemperature.text = "體溫正常"
            bodyTemperature.textColor = UIColor.black
        }
        
    }//slider移動的變化寫程式的位置結束的地方
    
    
    
    //按下Button後溫度計算到給Label的程式碼
    @IBAction func temperatureChangeButton(_ sender: Any) {
        
        inputTemperAtureTextField.resignFirstResponder()
        

        tempConvertUILabel.text = "換算華氏 " + String(Int(inputTemperAtureTextField.text!)!/5*9+32) + " 度"
    
        
    }//按下Button後溫度計算到給Label的程式碼結束的地方
    
    
}

