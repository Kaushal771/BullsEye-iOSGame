//
//  ViewController.swift
//  BullsEye
//
//  Created by Kaushal Desai on 2019-02-09.
//  Copyright © 2019 Kaushal Desai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var roundNumber = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startOver()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    
    @IBAction func showAlert()
    {
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        score += points
        
        
        let title: String
        if (difference == 0)
        {
            title = "Perfect!"
            points += 100
        }
        else if (difference < 5)
        {
            title = "Almost had it!"
            if difference == 1 {points += 50}
        }
        else if (difference < 10) {title = "Pretty Good!"}
        else {title = "Not even close...."}
        
        
        let message = "You scored: \(points) points!"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK!", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider)
    {
        let roundedValue = slider.value.rounded()
        currentValue = Int(slider.value)
    }
    
    func startNewRound()
    {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        roundNumber += 1
        updateLabels()
    }

    func updateLabels()
    {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(roundNumber)
    }
    
    @IBAction func startOver()
    {
        score = 0
        roundNumber = 0
        startNewRound()
        
    }
    
    
    
}

