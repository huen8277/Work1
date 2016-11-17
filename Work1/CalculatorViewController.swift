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
    
    var firstCal: Bool = false // bool 타입 true, false 구분
    
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
        var curNum = getDisplayedNumber() // 화면에 디스플레이되던 값이 curNum으로 들어간다.
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
        //옵셔널 타입을 일반 String 타입으로 변환
        //storedNum이 nil일 경우 if문 조건에 부합하지 않아 해당 조건문을 실행 하지 않는다.
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
        storedNum = numberDisplayLabel.text // op를 누르면서 curNum이 storedNum으로 들어간다. 새로 입력 받을 예정인 Num이 curNum으로 들어갈 거시다. 흠...
        firstCal = true // 처음계산했다. true
    }
    
    @IBAction func equalButtonPressed(_ sender: UIButton) {
        let equal = sender.title(for: .normal)
        print("\(equal)pressed")
        //= 로직
        // 추가코드
        var tempNum: String?
        if firstCal {
            tempNum = getDisplayedNumber()
        }
        
        numberDisplayLabel.text = calculate()
        
        if let tempNum = tempNum {
            storedNum = tempNum
        }
        
        
        
        firstCal = false
        // = 을 누르면서 새로 입력받은 num에 있던 숫자와 storedNum이 더해지고 그거시 calNum으로 저장되어 출력될것이다.
        // 또 =을 누르면 calNum이 curNumd으로가고 젤 처음에 입력 되엇던 num이 storedNum이라 =을 계속 눌려도 뒤에 누른 num 값이 아닌 처음에 누른 num으로 계속 값이 더해진다.
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
