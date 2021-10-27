import Foundation
import Combine

class CalculateLogic: ObservableObject {
    
    @Published var displayLabel: String = "0" {
        didSet {
            print(displayLabel)
        }
    }
    
    private var number: Double?
    private var intermediateCalculation: (num1: Double, calcMethod: String)?
    private var isFinishedTypingNumber: Bool = true
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
            if String(newValue) == "inf" {
                displayLabel = "Not a number"
            } else if floor(newValue) == newValue {
                displayLabel = String(Int(newValue))
            } else {
                displayLabel = String(newValue)
            }
        }
    }
    
    func calcButtonPressed(buttonName: String) {
        if buttonName == "." {
            let isInt = floor(displayValue) == displayValue
            if !isInt {
                return
            }
            displayLabel.append(buttonName)
            return
        }
        isFinishedTypingNumber = true
        setNumber(displayValue)
        if let number = calculate(symbol: buttonName) {
            displayValue = number
        }
    }
    
    func numButtonPressed(buttonName: String) {
        if isFinishedTypingNumber {
            displayLabel = buttonName
            if displayLabel == "0" {
                return
            }
            isFinishedTypingNumber.toggle()
        } else {
            displayLabel = "\(displayLabel)\(buttonName)"
        }
    }
    
    func setNumber(_ number: Double) {
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "%":
                return n / 100
            case "AC":
                return 0
            case "=":
                if intermediateCalculation == nil {
                    return 0
                } else {
                    return performTwoNumCalculation(n2: n)!
                }
            default:
                intermediateCalculation = (num1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.num1,
           let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "*":
                return n1 * n2
            case "/":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        return nil
    }
}
