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
    
    var storedNum: String?
    var storedOp: String?
    var resultNum: String?
    
    
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
        let num: Int = sender.tag
        var curNum = numberDisplayLabel.text ?? "0"
        //TODO: 첫 숫자가 0인 경우 처리 로직.
        if curNum == "0" {
            curNum = ""
        }
        
        if let storedNum = storedNum, storedNum == curNum {
            curNum = ""
        }
        
        numberDisplayLabel.text = curNum + String(num)
        print("\(num) pressed")
    }
    
    @IBAction func opButtonPressed(_ sender: UIButton) {
        let op = sender.title(for: .normal)
        print("\(op) pressed")
        //더하기 연산
        let curNum = numberDisplayLabel.text ?? "0"
        if let storedNum = storedNum, let storedOp = storedOp {
            if storedOp == "+" {
                numberDisplayLabel.text = String(Int(storedNum)! + Int(curNum)!)
            }
        }
        storedOp = op
        storedNum = numberDisplayLabel.text
    }
    
    @IBAction func minusButtonPressed(_ sender: UIButton) {
        let minus = sender.title(for: .normal)
        print("\(minus)pressed")
        //빼기 연산
        let curNum = numberDisplayLabel.text ?? "0"
        if let storedNum = storedNum, let storedOp = storedOp {
            if storedOp == "-" {
                numberDisplayLabel.text = String(Int(storedNum)! - Int(curNum)!)
            }
        }
        storedOp = minus
        storedNum = numberDisplayLabel.text
    }
    
    @IBAction func multiButtonPressed(_ sender: UIButton) {
        let multi = sender.title(for: .normal)
        print ("\(multi)pressed")
        //곱하기 연산
        let curNum = numberDisplayLabel.text ?? "0"
        if let storedNum = storedNum, let storedOp = storedOp {
            if storedOp == "*" {
                numberDisplayLabel.text = String(Int(storedNum)! * Int(curNum)!)
            }
        }
        storedOp = multi
        storedNum = numberDisplayLabel.text
    }
    
    @IBAction func divButtonPressed(_ sender: UIButton) {
        let div = sender.title(for: .normal)
        print("\(div)pressed")
        //나누기 연산
        let curNum = numberDisplayLabel.text ?? "0"
        if let storedNum = storedNum, let storedOp = storedOp {
            if storedOp == "/" {
                numberDisplayLabel.text = String(Int(storedNum)! / Int(curNum)!)

                }
            }
        storedOp = div
        storedNum = numberDisplayLabel.text
    }
    
    @IBAction func equalButtonPressed(_ sender: UIButton) {
        numberDisplayLabel.text = resultNum
        let equal = sender.title(for: .normal)
        print("\(equal)pressed")
        //= 로직
    }
    
    @IBAction func acButtonPressed(_ sender: UIButton) {
        numberDisplayLabel.text = "0"
        storedNum = nil
        storedOp = nil
        let ac = sender.title(for: .normal)
        print("\(ac) pressed")
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
