import 'package:firebase_auth/firebase_auth.dart';
import 'package:first/bre_crew/model/user.dart';
import '';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserUid? _userFromFirebase(User? user) {
    return user != null ? UserUid(uid: user.uid) : null;
  }

  Stream<UserUid?> get user {
    return _auth.authStateChanges().map((User? user) => _userFromFirebase(user!));
  }

  Future signOut() async{
    try{

      return _auth.signOut();

    }catch(e){
      print("Logout $e");
    }
  }

  Future signInAnonymously() async {
    try {
      final result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebase(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
