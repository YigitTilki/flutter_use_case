import 'package:flutter_use_case/basic-mvvm/basic_model.dart';
import 'package:flutter_use_case/basic-mvvm/core/basic_cache.dart';

class BasicViewModel {
  BasicViewModel(this.cache);

  final BasicCache cache;
  Future<bool> controlToUserName(BasicModel model) async {
    await Future.delayed(const Duration(seconds: 2), () {});
    if (model.userName.length.isOdd) {
      return true;
    } else {
      return false;
    }
  }

  void saveUserNameToCache(String userName) {
    cache.saveString(userName);
  }
}
