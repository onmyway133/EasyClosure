import UIKit
import EasyClosure

class ViewController: UIViewController {

    @IBOutlet weak var goodSwitch: UISwitch!
    @IBOutlet weak var cheapSwitch: UISwitch!
    @IBOutlet weak var fastSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()

        let good = self.goodSwitch!
        let cheap = self.cheapSwitch!
        let fast = self.fastSwitch!

        func allEasyClosure() -> Bool {
            return [good, cheap, fast].filter({ $0.isOn }).count == 3
        }

        good.on.valueChanged {
            if allEasyClosure() {
                fast.setOn(false, animated: true)
            }
        }

        cheap.on.valueChanged {
            if allEasyClosure() {
                good.setOn(false, animated: true)
            }
        }

        fast.on.valueChanged {
            if allEasyClosure() {
                cheap.setOn(false, animated: true)
            }
        }
    }
}
