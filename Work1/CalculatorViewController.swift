//
//  CalculatorViewController.swift
//  Work1
//
//  Created by stanley on 2016. 10. 25..
//  Copyright © 2016년 KAKAO. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var numberDisplayLabel: UILabel!
    
    @IBOutlet var numButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberDisplayLabel.text = "0"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        let num = sender.tag
        let lastNum = numberDisplayLabel.text ?? ""
        //TODO: 첫 숫자가 0인 경우 처리 로직.
        numberDisplayLabel.text = lastNum + String(num)
        print("\(num) pressed")
    }
    
    @IBAction func opButtonPressed(_ sender: UIButton) {
        let op = sender.title(for: .normal)
        print("\(op) pressed")
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
