import UIKit

public extension Container where Host: UIDatePicker {

  func pick(_ action: @escaping DateAction) {
    let target = DatePickerTarget(host: host, action: action)
    targets.append(target)
  }
}

class DatePickerTarget: NSObject {
  var action: DateAction?

  init(host: UIDatePicker, action: @escaping DateAction) {
    super.init()

    self.action = action
    host.addTarget(self, action: #selector(handleChange(_:)), for: .valueChanged)
  }

  // MARK: - Action

  @objc func handleChange(_ picker: UIDatePicker) {
    action?(picker.date)
  }
}
