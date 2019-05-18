import UIKit

public extension Container where Host: UISlider {

  func value(_ action: @escaping FloatAction) {
    let target = SliderTarget(host: host, action: action)
    targets.append(target)
  }
}

class SliderTarget: NSObject {
  var action: FloatAction?

  init(host: UISlider, action: @escaping FloatAction) {
    super.init()

    self.action = action
    host.addTarget(self, action: #selector(handleChange(_:)), for: .valueChanged)
  }

  // MARK: - Action

  @objc func handleChange(_ slider: UISlider) {
    action?(slider.value)
  }
}
