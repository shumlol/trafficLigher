//
//  ViewController.swift
//  trafficLighter
//
//  Created by Вадим Ахматханов on 10.04.2023.
//

import UIKit

enum CurrentLight { //
    case red, yellow, green //
} //del for if else

class ViewController: UIViewController {
    
    @IBOutlet var redLight: UIView!
    @IBOutlet var yellowLight: UIView!
    @IBOutlet var greenLight: UIView!
    
    @IBOutlet var switcherLigher: UIButton!
    
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    private var currentLight = CurrentLight.red //del for if else
    
    override func viewDidLoad() {
        super.viewDidLoad()

        switcherLigher.layer.cornerRadius = 10
        
        redLight.alpha = lightIsOff
        yellowLight.alpha = lightIsOff
        greenLight.alpha = lightIsOff
        
        print("Размер стороны, доступный в методе viewDidLoad: \(redLight.frame.height)")
    }

    override func viewWillLayoutSubviews() {
        redLight.layer.cornerRadius = redLight.frame.width / 2
        yellowLight.layer.cornerRadius = yellowLight.frame.width / 2
        greenLight.layer.cornerRadius = greenLight.frame.width / 2
        
        print("Размер стороны, доступный в методе viewWillLayoutSubviews: \(redLight.frame.height)")

    }
    @IBAction func switcherLighterPressed() {
        if switcherLigher.currentTitle == "START" {
            switcherLigher.setTitle("NEXT", for: .normal)
        }
        
        switch currentLight {
        case .red:
            greenLight.alpha = lightIsOff
            redLight.alpha = lightIsOn
            currentLight = .yellow
        case .yellow:
            redLight.alpha = lightIsOff
            yellowLight.alpha = lightIsOn
            currentLight = .green
        case .green:
            yellowLight.alpha = lightIsOff
            greenLight.alpha = lightIsOn
            currentLight = .red
        }
        
//        if redLight.alpha == 1 {
//            redLight.alpha = 0.3
//            yellowLight.alpha = 1
//        } else if yellowLight.alpha == 1 {
//            yellowLight.alpha = 0.3
//            greenLight.alpha = 1
//        }  else if greenLight.alpha == 1 {
//            greenLight.alpha = 0.3
//            redLight.alpha = 1
//        } else {
//            redLight.alpha = 1
//        }
    }
}

//commit
