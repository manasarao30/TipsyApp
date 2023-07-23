import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var stepperValue: UIStepper!
    var tipSelected = 0.10
    var billText: String = ""
    var totalTip=0.0
    var stepperMinimum=2

    var tipsy=tipsyBrain()

    @IBAction func insertTextField(_ sender: UITextField) {
        billText = billTextField.text!
    }
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected=false
        tenPctButton.isSelected=false
        twentyPctButton.isSelected=false
        sender.isSelected=true
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tipSelected = buttonTitleAsANumber / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
           splitNumberLabel.text = String(format: "%.0f", sender.value)
           stepperMinimum = Int(sender.value)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        tipsy.calculateTip(billText: billText, tipSelected: tipSelected, stepperMinimum: stepperMinimum)
        self.performSegue(withIdentifier: "goToResult", sender: self)

        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="goToResult"){
            let destinationVC=segue.destination as! ResultsViewController
            destinationVC.total=tipsy.getTotalTip()
            destinationVC.settings=tipsy.getSettingsText()
        }
    }
}

