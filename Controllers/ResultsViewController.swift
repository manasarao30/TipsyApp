import UIKit

class ResultsViewController: UIViewController {

    var total: Float?
    var settings: String?
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text=String(format: "%.2f", total!)
        settingsLabel.text=settings
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
