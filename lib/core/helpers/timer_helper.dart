import 'dart:async';
import 'dart:ui';

class TimerHelper {
  int _resendTimer = 60;
  bool _isResendEnabled = false;
  bool _isTimerRunning = false;
  Timer? _timer;
  VoidCallback? onTimerUpdate;

  int get resendTimer => _resendTimer;
  bool get isResendEnabled => _isResendEnabled;
  bool get isTimerRunning => _isTimerRunning;

  void startResendTimer() {
    _isResendEnabled = false;
    _resendTimer = 60;
    _isTimerRunning = true;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_resendTimer > 0) {
        _resendTimer--;
        onTimerUpdate?.call();
      } else {
        _isResendEnabled = true;
        _isTimerRunning = false;
        timer.cancel();
        onTimerUpdate?.call();
      }
    });
  }

  void dispose() {
    _timer?.cancel();
  }
}