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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberDisplayLabel.text = "0"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getDisplayedNumber() -> String {
        return numberDisplayLabel.text ?? "0"
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        let num: Int = sender.tag
        var curNum = getDisplayedNumber()
        //첫 숫자가 0인 경우 처리 로직.
        if curNum == "0"{
            curNum = ""
        }
        if let storedNum = storedNum, storedNum == curNum {
            curNum = ""
            // 버그 해결 (with) 연산자 바로 다음 입력받은 num을 위해 curNum을 빈 스트링으로 바꾼다.
        }
        
        numberDisplayLabel.text = curNum + String(num)
        print("\(num) pressed")
        }
    
    func calculate() -> String {
        let curNum = getDisplayedNumber()
        var calNum = curNum
        
        if let storedNum = storedNum, let storedOp = storedOp {
            if storedOp == "+" {
                calNum = String(Int(storedNum)! + Int(curNum)!)
            }
            else if storedOp == "-" {
                calNum = String(Int(storedNum)! - Int(curNum)!)
            }
            else if storedOp == "*" {
                calNum = String(Int(storedNum)! * Int(curNum)!)
            }
            else if storedOp == "/" {
                calNum = String(Int(storedNum)! / Int(curNum)!)
            }
        }
        return calNum
    }
    
    @IBAction func opButtonPressed(_ sender: UIButton){
        let op = sender.title(for: .normal)
        print("\(op) pressed")
        // 사칙연산
        numberDisplayLabel.text = calculate()
        storedOp = op
        storedNum = numberDisplayLabel.text
    }
    
    @IBAction func equalButtonPressed(_ sender: UIButton) {
        let equal = sender.title(for: .normal)
        print("\(equal)pressed")
        //= 로직
        numberDisplayLabel.text = calculate()
        storedOp = nil
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
