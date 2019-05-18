import UIKit

public extension Container where Host: UISearchBar {

  func text(_ action: @escaping StringAction) {
    let target = SearchBarTarget(host: host, action: action)
    targets.append(target)
  }
}

class SearchBarTarget: NSObject, UISearchBarDelegate {
  var action: StringAction?

  init(host: UISearchBar, action: @escaping StringAction) {
    super.init()

    self.action = action
    host.delegate = self
  }

  // MARK: - UISearchBarDelegate

  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    action?(searchText)
  }
}
