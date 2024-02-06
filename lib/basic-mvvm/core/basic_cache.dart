abstract class BasicCacheInterface {
  bool saveString(String value);
}

class BasicCache implements BasicCacheInterface {
  @override
  bool saveString(String value) {
    return true;
  }
}
