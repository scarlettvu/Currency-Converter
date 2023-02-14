//
//  ViewController.swift
//  Currency Converter
//
//  Created by Scarlett  on 2/14/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usdInput: UITextField!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var errorMessage: UILabel!
    
    var currencyValue: Int?
    var currencyLogic = CurrencyLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        errorMessage.isHidden = true
    }
    
    // Sets the IBAction for all of the switches, referring them to what happens when it is turned on
    @IBAction func eurSwitch(_ sender: UISwitch) {
        currencyLogic.makeEurSwitch(sender.isOn)
    }
    
    @IBAction func mxnSwitch(_ sender: UISwitch) {
        currencyLogic.makeMxnSwitch(sender.isOn)
    }
    
    @IBAction func gbpSwitch(_ sender: UISwitch) {
        currencyLogic.makeGbpSwitch(sender.isOn)
    }
    
    @IBAction func audSwitch(_ sender: UISwitch) {
        currencyLogic.makeAudSwitch(sender.isOn)
    }
    
    @IBAction func convertButton(_ sender: UIButton) {
       // let currencyAmountViewController = CurrencyAmountViewController()
        currencyValue = Int(usdInput.text!)
        currencyLogic.makeAmount(currencyValue!)
        self.performSegue(withIdentifier: "toCurrencyAmount", sender: self)
    }
    
    
    // Checks for user input. Print the amount input if it is valid.
    @IBAction func userInput(_ sender: UITextField) {
        errorMessage.isHidden = true
        do {
        let userAmount = try checkInt(sender.text!) // Refers to checkInt function below
            print(userAmount)
        }
        catch InputError.VoidInput(let throwError) {
            errorMessage.isHidden = false
            errorMessage.text = throwError
        } catch {
        }
    }
    
    // Checks if it is integer or throws error.
    func checkInt(_ intString: String) throws -> Bool {
        guard Int(intString) != nil else {
            throw InputError.VoidInput(throwError: "Cannot process input. Invalid value.")
        }
        return Int(intString) != nil
    }
        enum InputError: Error {
            case VoidInput(throwError: String)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toCurrencyAmount" {
            let destination = segue.destination as! CurrencyAmountViewController
            destination.currencyLogic = currencyLogic
        }
    }
                                          
}

