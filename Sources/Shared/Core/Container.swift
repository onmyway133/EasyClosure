import Foundation

public class Container<Host: AnyObject>: NSObject {
  unowned let host: Host

  init(host: Host) {
    self.host = host
  }

  /// All the UI targets in this container
  var targets: [Any] = []

  var timerTarget: TimerTarget?
  let keyPathTarget = KeyPathTarget()
  let notificationTarget = NotificationTarget()
}
