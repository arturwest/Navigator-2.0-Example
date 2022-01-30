import 'package:rxdart/rxdart.dart';

class PrefsDataSource {
  final PublishSubject<bool> _loggedInStateSubject = PublishSubject();

  PrefsDataSource() {
    _loggedInStateSubject.add(false);
  }

  Stream<bool> getLoggedInStateStream() {
    return _loggedInStateSubject.stream;
  }

  void setLoggedInState(bool loggedInState) {
    _loggedInStateSubject.add(loggedInState);
  }
}
