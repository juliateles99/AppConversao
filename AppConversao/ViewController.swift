//
//  ViewController.swift
//  AppConversao
//
//  Created by Julia Teles on 13/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btCelsius: UIButton!
    @IBOutlet weak var btFarenheint: UIButton!
    @IBOutlet weak var lbResult: UITextField!
    @IBOutlet weak var lbResultUnity: UILabel!
    @IBOutlet weak var lbUnit: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func showNext(_ sender: UIButton) {
        switch lbUnit.text!  {
        case "Temperatura":
            lbUnit.text = "Peso"
            btCelsius.setTitle("Kilograma", for: .normal)
            btFarenheint.setTitle("Libra", for: .normal)
        case "Peso":
            lbUnit.text = "Moeda"
            btCelsius.setTitle("Real", for: .normal)
            btFarenheint.setTitle("Dolar", for: .normal)
        case "Moeda":
            lbUnit.text = "Distancia"
            btCelsius.setTitle("Metro", for: .normal)
            btFarenheint.setTitle("Kilometro", for: .normal)
        default:
            lbUnit.text = "Temperatura"
            btCelsius.setTitle("Celsius", for: .normal)
            btFarenheint.setTitle("Farenheint", for: .normal)
        }
        convert(nil)
    }
    
    
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btCelsius {
                btFarenheint.alpha = 0.5
            } else {
                btCelsius.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        
        switch lbUnit.text!  {
        case "Temperatura":
           calcTemperature()
        case "Peso":
            calcWeight()
        case "Moeda":
           calcCurrency()
        default:
            calcDistance()
        }
        
        
    }
    
    func calcTemperature() {
        guard let temperature = Double(tfValue.text!) else {return}
        if btCelsius.alpha == 1.0 {
            lbResultUnity.text = "Farenheint"
            lbResult.text = String(temperature * 1.8 + 32.0)
        } else {
            lbResultUnity.text = "Celsius"
            lbResult.text = String((temperature - 32.0) / 1.8)
        }
    }
    
    func calcWeight() {
        guard let weight = Double(tfValue.text!) else {return}
        if btCelsius.alpha == 1.0 {
            lbResultUnity.text = "Libra"
            lbResult.text = String(weight / 2.2046)
        } else {
            lbResultUnity.text = "Kilograma"
            lbResult.text = String(weight * 2.2046)
        }
    }
    
    func calcCurrency() {
        guard let currency = Double(tfValue.text!) else {return}
        if btCelsius.alpha == 1.0 {
            lbResultUnity.text = "Dolar"
            lbResult.text = String(currency / 3.3)
        } else {
            lbResultUnity.text = "Real"
            lbResult.text = String(currency * 3.3)
        }
    }
    
    func calcDistance() {
        guard let distance = Double(tfValue.text!) else {return}
        if btCelsius.alpha == 1.0 {
            lbResultUnity.text = "Kilometro"
            lbResult.text = String(distance / 1000)
        } else {
            lbResultUnity.text = "Metro"
            lbResult.text = String(distance * 1000)
        }
    }
}

