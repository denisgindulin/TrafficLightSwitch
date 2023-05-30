//
//  ViewController.swift
//  TrafficLightSwitch
//
//  Created by Денис Гиндулин on 30.05.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redLightView: UIView!
    @IBOutlet weak var yellowLightView: UIView!
    @IBOutlet weak var greenLightView: UIView!
    @IBOutlet weak var switchButton: UIButton!
    
    var tapSwitchButtonCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLightView.alpha = 0.3
        yellowLightView.alpha = 0.3
        greenLightView.alpha = 0.3
        
        redLightView.layer.cornerRadius = redLightView.frame.width / 2
        yellowLightView.layer.cornerRadius = yellowLightView.frame.width / 2
        greenLightView.layer.cornerRadius = greenLightView.frame.width / 2

        switchButton.layer.cornerRadius = 10
    }
    
    @IBAction func switchButtonDidTapped(_ sender: Any) {
        print("switchButton did tapped")
        print("счетчик нажатий на кнопку до нажатия - \(tapSwitchButtonCounter)")
        tapSwitchButtonCounter += 1
        print("счетчик нажатий на кнопку после нажатия - \(tapSwitchButtonCounter)")

        switchButton.setTitle("NEXT", for: .normal)
        
        if tapSwitchButtonCounter % 3 == 1 {
            redLightView.alpha = 1
            yellowLightView.alpha = 0.3
            greenLightView.alpha = 0.3
            
            print("должен гореть красный")
        }
        
        if tapSwitchButtonCounter % 3 == 2 {
            redLightView.alpha = 0.3
            yellowLightView.alpha = 1
            greenLightView.alpha = 0.3
            
            print("должен гореть желтый")
        }
        
        if tapSwitchButtonCounter % 3 == 0 {
            redLightView.alpha = 0.3
            yellowLightView.alpha = 0.3
            greenLightView.alpha = 1
            
            print("должен гореть зеленый")
        }
    }
}

