import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:my_music_app/app/models/userdata.dart';
import 'package:my_music_app/app/repositories/user_repository.dart';

part 'signin_controller.g.dart';

class SigninController = _SigninBase with _$SigninController;

abstract class _SigninBase with Store {
  _SigninBase(this._userRepository);

  UserRepository _userRepository;
  final userBox = Hive.box('user');
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @observable
  bool isSignedIn = false;

  @observable
  bool showErrorDialog = false;

  @observable
  int currentPageViewIndex = 0;

  @action
  void setIsSignedIn(val) {
    isSignedIn = val;
  }

  @action
  void toggleShowErrorDialog() => showErrorDialog = !showErrorDialog;

  @action
  doLogout() async {
    try {
      print("saindo, from 'signin_controller'");
      await _googleSignIn.signOut();
      userBox.put('isLogged', false);
    } catch (e) {
      throw e;
    }
  }

  @action
  doLogin() async {
    print('begin sign method');
    try {
      bool isL = await _googleSignIn.isSignedIn();
      if (isL) {
        await doLogout();
      }

      final res = await _googleSignIn.signIn();
      print(res);
      Response response = await _userRepository.getUserData(res);
      UserData user = UserData(
        email: response.data['user']['email'],
        username: response.data['user']['username'],
        googleId: response.data['user']['google_id'],
        token: response.data['token'],
      );
      bool result = _saveUserData(user);
      return result;
    } catch (error) {
      print(error);
    }
  }

  bool _saveUserData(UserData user) {
    print(user);
    userBox.put('user', user);
    userBox.put('isLogged', true);
    return true;
  }
}
