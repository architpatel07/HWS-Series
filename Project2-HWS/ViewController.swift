//
//  ViewController.swift
//  Project2-HWS
//
//  Created by Archit Patel on 2021-06-22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var queAsked = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1

        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
       
        countries += ["estonia", "france", "germany", "ireland", "italy",
        "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion()
    }
    
    func askQuestion(action : UIAlertAction! = nil) {
        
        countries.shuffle()
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        
        title = "\(countries[correctAnswer].uppercased())  \(score)"
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title : String
        queAsked += 1
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        }else{
            
            title = "Wrong"
            score -= 1
        }
        
        
        if queAsked <= 9 {
            
            let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
            
        }else if queAsked == 10{
            
            let alert = UIAlertController(title: "Final Score", message: "Your score is \(score) out of 10", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (UIAlertAction) in
                debugPrint("OK")
                self.askQuestion()
                self.score = 0
            }))
            present(alert, animated: true)
            
            self.queAsked = 0
        }
        print(queAsked)
    }
    

}

