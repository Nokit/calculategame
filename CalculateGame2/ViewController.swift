//
//  ViewController.swift
//  CalculateGame2
//
//  Created by Naoki Toyosato on 2015/09/15.
//  Copyright © 2015年 Naoki Toyosato. All rights reserved.
//


// DO NOT edit unless you know what you are doing
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var shuffler: UIButton!
    @IBOutlet weak var num1: UILabel!
    @IBOutlet weak var num2: UILabel!
    @IBOutlet weak var num3: UILabel!
    @IBOutlet weak var num4: UILabel!
    @IBOutlet weak var op1: UIButton!
    @IBOutlet weak var op2: UIButton!
    @IBOutlet weak var op3: UIButton!
    @IBOutlet weak var Answer: UIButton!
    @IBOutlet weak var congratulator: UILabel!
    @IBOutlet weak var counter: UILabel!
    
    @IBAction func op1(sender: UIButton) {
        whichOp = 1
    }
    @IBAction func op2(sender: UIButton) {
        whichOp = 2
    }
    @IBAction func op3(sender: UIButton) {
        whichOp = 3
    }
    @IBAction func Answer(sender: UIButton) {
        theOrder()
        calculate()
        Answer.setTitle("\(anAnswer)", forState:.Normal)
        if anAnswer == 10 {
            congratulator.text = "Great job!"
            countern += 1
            counter.text = "\(countern)"
            
        }
    }
    
    @IBAction func shuffling(sender: AnyObject) {
        shuffleAndShow()
        isItOk()
        while isItOk() == false {
            shuffleAndShow()
            isItOk()
        }
        congratulator.text = " "

    }
    
    @IBAction func plus(sender: UIButton) {
        if whichOp == 1 {
            op1.setTitle("＋", forState:.Normal)
        } else if whichOp == 2 {
            op2.setTitle("＋", forState:.Normal)
        } else {
            op3.setTitle("＋", forState:.Normal)
        }
        
    }
    @IBAction func minus(sender: UIButton) {
        if whichOp == 1 {
            op1.setTitle("ー", forState:.Normal)
        } else if whichOp == 2 {
            op2.setTitle("ー", forState:.Normal)
        } else {
            op3.setTitle("ー", forState:.Normal)
        }

        
    }
    @IBAction func multiple(sender: UIButton) {
        if whichOp == 1 {
            op1.setTitle("×", forState:.Normal)
        } else if whichOp == 2 {
            op2.setTitle("×", forState:.Normal)
        } else {
            op3.setTitle("×", forState:.Normal)
        }
    }
    @IBAction func division(sender: UIButton) {
        if whichOp == 1 {
            op1.setTitle("÷", forState:.Normal)
        } else if whichOp == 2 {
            op2.setTitle("÷", forState:.Normal)
        } else {
            op3.setTitle("÷", forState:.Normal)
        }
    }
    var random:[Int] = [0,0,0,0]
    var numbers:[Int] = [0,0,0,0]
    var whichOp = 1
    var orderOfOp1 = 1
    var orderOfOp2 = 2
    var orderOfOp3 = 3
    var anAnswer:Int = 0
    var depo:Int = 0
    var d = 0
    var operators:[String] = ["＋", "ー","÷","×"]
    var TestOp1 = " "
    var TestOp2 = " "
    var TestOp3 = " "
    var how = 0
    var countern = 0
    
    func shuffleAndShow() {
      repeat {
            for i in 0...3{
                random[i] = (Int)(arc4random_uniform(10))
                num1.text = "\(random[0])"
                num2.text = "\(random[1])"
                num3.text = "\(random[2])"
                num4.text = "\(random[3])"
                for i in 0...3{
                    numbers[i] = random[i]
                 }
            }
        } while random[0] * random[1] * random[2] * random[3] == 0
    }
    
    @IBAction func replacer(sender: UISwipeGestureRecognizer) {
        var h = 0
        h = numbers[0]
        numbers[0] = numbers[1]
        numbers[1] = h
        print ("success")
    }
    @IBAction func replacer2(sender: UISwipeGestureRecognizer) {
        var h = 0
        h = numbers[1]
        numbers[1] = numbers[2]
        numbers[2] = h
    }
    
    @IBAction func replacer3(sender: UISwipeGestureRecognizer) {
        var h = 0
        h = numbers[2]
        numbers[2] = numbers[3]
        numbers[3] = h
    }
    @IBAction func replacer4(sender: UISwipeGestureRecognizer) {
        var h = 0
        h = numbers[3]
        numbers[3] = numbers[0]
        numbers[0] = h
    }
    
    func theOrder(){
        if op1.currentTitle == "×" || op1.currentTitle == "÷"{
            orderOfOp1 = 1
            if  op2.currentTitle == "×" || op2.currentTitle == "÷"{
                orderOfOp2 = 2
                orderOfOp3 = 3
            } else if op3.currentTitle == "×" || op3.currentTitle == "÷" {
                orderOfOp2 = 3
                orderOfOp3 = 2
            }
        }else if op2.currentTitle == "×" || op2.currentTitle == "÷" {
            orderOfOp2 = 1
            if op3.currentTitle == "×" || op3.currentTitle == "÷"{
                orderOfOp3 = 2
                orderOfOp1 = 3
            } else{
                orderOfOp1 = 2
                orderOfOp3 = 3
            }
        }else if op3.currentTitle == "×" || op3.currentTitle == "÷" {
            orderOfOp3 = 1
            orderOfOp1 = 2
            orderOfOp2 = 3
        }
    }
    
    func calculate(){
        if orderOfOp1 == 1 {
            if op1.currentTitle == "×" {
                anAnswer = random[0] * random[1]
            } else if op1.currentTitle == "÷"{
                anAnswer = random[0] / random[1]
            } else if op1.currentTitle == "＋"{
                anAnswer = random[0] + random[1]
            } else if op1.currentTitle == "ー"{
                anAnswer = random[0] - random[1]
            }
                if orderOfOp3 == 2{
                    if op3.currentTitle == "×"{
                        depo = random[0] * random[1]
                    }else if op1.currentTitle == "÷"{
                        depo = random[0] / random[1]
                    }
                    if op2.currentTitle == "×" {
                        anAnswer = anAnswer * depo
                    } else if op2.currentTitle == "÷"{
                        anAnswer =  anAnswer / depo
                    } else if op2.currentTitle == "＋"{
                        anAnswer =  anAnswer + depo
                    } else if op2.currentTitle == "ー"{
                        anAnswer =  anAnswer - depo
                    }
                }
                if orderOfOp2 == 2 {
                    if op2.currentTitle == "×" {
                        anAnswer = anAnswer * random[2]
                    } else if op2.currentTitle == "÷"{
                        anAnswer = anAnswer / random[2]
                    } else if op2.currentTitle == "＋"{
                        anAnswer = anAnswer + random[2]
                    } else if op2.currentTitle == "ー"{
                        anAnswer = anAnswer - random[2]
                    }
                    if op3.currentTitle == "＋"{
                        anAnswer = anAnswer + random[3]
                    } else if op3.currentTitle == "ー"{
                        anAnswer = anAnswer - random[3]
                    }
                }
        } else if orderOfOp2 == 1{
            if op2.currentTitle == "×" {
                anAnswer = random[1] * random[2]
            } else if op2.currentTitle == "÷"{
                anAnswer = random[1] / random[2]
            } else if op2.currentTitle == "＋"{
                anAnswer = random[1] + random[2]
            } else if op2.currentTitle == "ー"{
                anAnswer = random[1] - random[2]
            }
                if orderOfOp3 == 2 {
                    if op3.currentTitle == "×" {
                        anAnswer = anAnswer * random[3]
                    } else if op3.currentTitle == "÷"{
                        anAnswer = anAnswer / random[3]
                    }
                    if  op1.currentTitle == "＋"{
                        anAnswer = random[0] + anAnswer
                    } else if op1.currentTitle == "ー"{
                        anAnswer = random[0] - anAnswer
                    }
                } else if orderOfOp1 == 2 {
                    if op1.currentTitle == "＋"{
                        anAnswer = random[0] + anAnswer
                    } else if op1.currentTitle == "ー"{
                        anAnswer = random[0] - anAnswer
                    }
                    if op3.currentTitle == "＋"{
                        anAnswer = random[3] + anAnswer
                    } else if op3.currentTitle == "ー"{
                        anAnswer = random[3] - anAnswer
                    }
            }
        } else if  orderOfOp3 == 1{
            if op3.currentTitle == "×" {
                anAnswer = random[2] * random[3]
            } else if op3.currentTitle == "÷"{
                anAnswer = random[2] / random[3]
            } else if op3.currentTitle == "＋"{
                anAnswer = random[2] + random[3]
            } else if op3.currentTitle == "ー"{
                anAnswer = random[2] - random[3]
            }
            if op1.currentTitle == "＋"{
                depo = random[0] + random[1]
                } else if op1.currentTitle == "ー"{
                depo = random[0] - random[1]
            }
            if op2.currentTitle == "＋"{
                anAnswer =  anAnswer + depo
            } else if op2.currentTitle == "ー"{
                anAnswer =  anAnswer - depo
            }
        }
    }
    
    func isItOk()-> Bool{
        for i in 1...3 {
            orderOfOp1 = i
            for h in 1...2 {
                orderOfOp2 = orderOfOp1 + 1
                if orderOfOp2 == 4 {
                    orderOfOp2 = orderOfOp2 - 3
                }
                orderOfOp3 = orderOfOp1 + 2
                if orderOfOp3 >= 4 {
                    orderOfOp3 = orderOfOp3 - 3
                }
                if h == 2 {
                    d = orderOfOp2
                    orderOfOp2 = orderOfOp3
                    orderOfOp3 = d
                }
                // 　ここで符号を全パターン検証
                for a in 0...3 {
                    TestOp1 = operators[a]
                    for b in 0...3{
                        TestOp2 = operators[b]
                        for c in 0...3{
                            TestOp3 = operators[c]
                            calculateTest()
                            if how == 10 {
                                return true
                            }
                            if i == 3 && h == 2 && a == 3 && b == 3 && c == 3 && how != 10{
                                return false
                            }
                        }
                    }
                }
                
            }
        }
        return true
    }
    
    func calculateTest(){
        if orderOfOp1 == 1 {
            if TestOp1 == "×" {
                how = random[0] * random[1]
            } else if TestOp1 == "÷"{
                how = random[0] / random[1]
            } else if TestOp1 == "＋"{
                how = random[0] + random[1]
            } else if TestOp1 == "ー"{
                how = random[0] - random[1]
            }
            if orderOfOp3 == 2{
                if TestOp1 == "×"{
                    depo = random[0] * random[1]
                }else if TestOp1 == "÷"{
                    depo = random[0] / random[1]
                }
                if TestOp2 == "×" {
                    how = how * depo
                } else if TestOp2 == "÷"{
                    if depo == 0 {
                        depo = 999
                    }
                    how =  how / depo
                } else if TestOp2 == "＋"{
                    how =  how + depo
                } else if TestOp2 == "ー"{
                    how =  how - depo
                }
            }
            if orderOfOp2 == 2 {
                if TestOp2 == "×" {
                    how = how * random[2]
                } else if TestOp2 == "÷"{
                    how = how / random[2]
                } else if TestOp2 == "＋"{
                    how = how + random[2]
                } else if TestOp2 == "ー"{
                    how = how - random[2]
                }
                if TestOp3 == "＋"{
                    how = how + random[3]
                } else if TestOp3 == "ー"{
                    how = how - random[3]
                }
            }
        } else if orderOfOp2 == 1{
            if TestOp2 == "×" {
                how = random[1] * random[2]
            } else if TestOp2 == "÷"{
                how = random[1] / random[2]
            } else if TestOp2 == "＋"{
                how = random[1] + random[2]
            } else if TestOp2 == "ー"{
                how = random[1] - random[2]
            }
            if orderOfOp3 == 2 {
                if TestOp3 == "×" {
                    how = how * random[3]
                } else if TestOp3 == "÷"{
                    how = how / random[3]
                }
                if  TestOp1 == "＋"{
                    how = random[0] + how
                } else if TestOp1 == "ー"{
                    how = random[0] - how
                }
            } else if orderOfOp1 == 2 {
                if TestOp1 == "＋"{
                    how = random[0] + how
                } else if TestOp1 == "ー"{
                    how = random[0] - how
                }
                if TestOp3 == "＋"{
                    how = random[3] + how
                } else if TestOp3 == "ー"{
                    how = random[3] - how
                }
            }
        } else if  orderOfOp3 == 1{
            if TestOp3 == "×" {
                how = random[2] * random[3]
            } else if TestOp3 == "÷"{
                how = random[2] / random[3]
            } else if TestOp3 == "＋"{
                how = random[2] + random[3]
            } else if TestOp3 == "ー"{
                how = random[2] - random[3]
            }
            if TestOp1 == "＋"{
                depo = random[0] + random[1]
            } else if TestOp1 == "ー"{
                depo = random[0] - random[1]
            }
            if TestOp2 == "＋"{
                how =  how + depo
            } else if TestOp2 == "ー"{
                how =  how - depo
            }
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        shuffleAndShow()
        isItOk()
        while isItOk() == false {
            shuffleAndShow()
            isItOk()
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

