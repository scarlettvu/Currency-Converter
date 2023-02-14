//
//  CurrencyAmountViewController.swift
//  Currency Converter
//
//  Created by Scarlett  on 2/16/23.
//

import UIKit

class CurrencyAmountViewController: UIViewController {
    
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var eurAmountLabel: UILabel!
    @IBOutlet weak var mxnAmountLabel: UILabel!
    @IBOutlet weak var gbpAmountLabel: UILabel!
    @IBOutlet weak var audAmountLabel: UILabel!
    
    var currencyLogic = CurrencyLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print(currencyLogic.currencyValue)
        usdLabel.text = "$" + String(currencyLogic.currencyValue) + ".00"
        if (currencyLogic.retrieveEurSwitch()) {
            let convertedAmount = currencyLogic.usdAmountConvert(type: "eur")
            eurAmountLabel.text = "\(convertedAmount) euros"
        }
        if (currencyLogic.retrieveMxnSwitch()) {
            let convertedAmount = currencyLogic.usdAmountConvert(type: "mxn")
            mxnAmountLabel.text = "\(convertedAmount) pesos"
        }
        if (currencyLogic.retrieveGbpSwitch()) {
            let convertedAmount = currencyLogic.usdAmountConvert(type: "gbp")
            gbpAmountLabel.text = "\(convertedAmount) pounds"
        }
        if (currencyLogic.retrieveAudSwitch()) {
            let convertedAmount = currencyLogic.usdAmountConvert(type: "aud")
            audAmountLabel.text = "\(convertedAmount) dollars"
        }
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
