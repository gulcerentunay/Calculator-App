//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Gül Ceren Tunay on 22.06.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var operationLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var operation:String = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()

    }
    
    func clearAll(){
        operation = " "
        operationLabel.text = " "
        resultLabel.text = " "
    }

    @IBAction func ACButton(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        if(!operation.isEmpty){
            
            operation.removeLast()
            operationLabel.text = operation
        }
    }
    
    func addToOperation(value:String){
        operation = operation + value
        operationLabel.text = operation
    }
    
    @IBAction func persentageButton(_ sender: Any) {
        addToOperation(value: "%")
    }
    @IBAction func divisionButton(_ sender: Any) {
        addToOperation(value: "/")
    }
    @IBAction func oneButton(_ sender: Any) {
        addToOperation(value: "1")
    }
    @IBAction func twoButton(_ sender: Any) {
        addToOperation(value: "2")
    }
    @IBAction func threeButton(_ sender: Any) {
        addToOperation(value: "3")
    }
    
    @IBAction func multiplicationButton(_ sender: Any) {
        addToOperation(value: "*")
    }
    @IBAction func fourButton(_ sender: Any) {
        addToOperation(value: "4")
    }
    @IBAction func fiveButton(_ sender: Any) {
        addToOperation(value: "5")
    }
    @IBAction func sixButton(_ sender: Any) {
        addToOperation(value: "6")
    }
    @IBAction func minusButton(_ sender: Any) {
        addToOperation(value: "-")
    }
    @IBAction func sevenButton(_ sender: Any) {
        addToOperation(value: "7")
    }
    @IBAction func eightButton(_ sender: Any) {
        addToOperation(value: "8")
    }
    @IBAction func nineButton(_ sender: Any) {
        addToOperation(value: "9")
    }
    @IBAction func additionButton(_ sender: Any) {
        addToOperation(value: "+")
    }
    @IBAction func zeroButton(_ sender: Any) {
        addToOperation(value: "0")
    }
    @IBAction func commaButton(_ sender: Any) {
        addToOperation(value: ",")
    }
    @IBAction func equalButton(_ sender: Any) {
        
        if(validInput()){
            
        let checkedOperationsForPercent = operation.replacingOccurrences(of: "%", with: "*0.01")
        let expression = NSExpression(format: checkedOperationsForPercent)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        let resultString = formatResult(result: result)
        resultLabel.text = resultString
            
        } else {
            let alert = UIAlertController(title: "Invalid Input", message: "Calculator unable to do math based on input", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validInput() -> Bool {
        
        var count = 0
        var funcCharIndex = [Int]()
        
        for char in operation{
            if specialCharacter(char: char){
                funcCharIndex.append(count)
            }
            count += 1
        }
        
        var previous:Int = -1
        
        for index in funcCharIndex{
            if index == 0 {
                return false
            }
            if index == operation.count - 1 {
                return false
            }
            
            if previous != -1 {
                if index - previous == 1 {
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    func specialCharacter(char: Character) -> Bool{
        if char == "*" {
            return true
        }
        if char == "/" {
            return true
        }
        if char == "+" {
            return true
        }
        return false
    }
    
    func formatResult(result:Double) -> String{
        if(result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", result)
        }
        else {
            return String(format: "%.2f", result)
        }
    }
}

