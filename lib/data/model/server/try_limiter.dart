import '../../../providers.dart';
import '../../store/setting.dart';

class TryLimiter {
  final Map<String, int> _triedTimes = {};

  bool shouldTry(String id) {
    final maxCount = settingStore.maxRetryCount.fetch()!;
    if (maxCount <= 0) {
      return true;
    }
    final times = _triedTimes[id] ?? 0;
    if (times >= maxCount) {
      return false;
    }
    _triedTimes[id] = times + 1;
    return true;
  }

  void resetTryTimes(String id) {
    _triedTimes[id] = 0;
  }

  void clear() {
    _triedTimes.clear();
  }
}
