import 'package:flutter_shop/authentication/authenticatble.dart';
import 'package:flutter_shop/user/user.dart';

class AnotherWayOfAuth implements Authenticatable{
  @override
  Future<bool> login(String email, String password) {
    // TODO: implement login
    return null;
  }

  @override
  Future<User> register(String email, String password) {
    // TODO: implement register
    return null;
  }

  @override
  Future<bool> resetPassword(String email) {
    // TODO: implement resetPassword
    return null;
  }

  @override
  Future<User> updateProfile(User user) {
    // TODO: implement updateProfile
    return null;
  }

}