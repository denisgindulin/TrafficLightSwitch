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
    
    private var switchButtonTapCounter = 0
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLightView.alpha = lightIsOff
        yellowLightView.alpha = lightIsOff
        greenLightView.alpha = lightIsOff

        switchButton.layer.cornerRadius = 10
    }
    
    override func viewWillLayoutSubviews() {
        redLightView.layer.cornerRadius = redLightView.frame.width / 2
        yellowLightView.layer.cornerRadius = yellowLightView.frame.width / 2
        greenLightView.layer.cornerRadius = greenLightView.frame.width / 2
    }
    
    @IBAction func switchButtonDidTapped(_ sender: Any) {
        switchButtonTapCounter += 1

        if switchButton.currentTitle == "START" {
            switchButton.setTitle("NEXT", for: .normal)
        }
        
        // To switch the traffic light signal sequentially, i change the status of only the current signal and the previous signal because the third signal is already off.
        if switchButtonTapCounter % 3 == 1 {
            redLightView.alpha = lightIsOn
            greenLightView.alpha = lightIsOff
        } else if switchButtonTapCounter % 3 == 2 {
            redLightView.alpha = lightIsOff
            yellowLightView.alpha = lightIsOn
        } else if switchButtonTapCounter % 3 == 0 {
            yellowLightView.alpha = lightIsOff
            greenLightView.alpha = lightIsOn
        }
    }
}

