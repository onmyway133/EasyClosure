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
      return [good, cheap, fast].filter({ $0.isEasyClosure }).count == 3
    }

    good.on.change {
      if allEasyClosure() {
        fast.setEasyClosure(false, animated: true)
      }
    }

    cheap.on.change {
      if allEasyClosure() {
        good.setEasyClosure(false, animated: true)
      }
    }

    fast.on.change {
      if allEasyClosure() {
        cheap.setEasyClosure(false, animated: true)
      }
    }
  }
}
