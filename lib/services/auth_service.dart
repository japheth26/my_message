import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:my_message/app/app.locator.dart';
import 'package:my_message/domain/vo/login_vo.dart';
import 'package:my_message/domain/vo/sign_up_vo.dart';

import 'package:my_message/services/firebase_service.dart';

class AuthService {
  late FirebaseService _firebaseService;
  late FirebaseAuth _firebaseAuth;

  AuthService() {
    _firebaseService = locator<FirebaseService>();
    _firebaseAuth = _firebaseService.firebaseAuth;
  }

  Future<User> signUp(SignUpVo vo) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: vo.email, password: vo.password);

      final User? user = userCredential.user;

      if (user == null) throw Exception('Failed to register user');

      await user.updateProfile(
          displayName: vo.fullName,
          photoURL: vo.colorValue != null ? 'color_${vo.colorValue}' : null);

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      } else {
        throw Exception(e.message);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<User> login(LoginVo vo) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: vo.email, password: vo.password);
      final User? user = userCredential.user;

      if (user == null) throw Exception('Failed to login');

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      } else {
        throw Exception(e.message);
      }
    } catch (e) {
      throw e is Exception ? e : Exception(e.toString());
    }
  }

  Future<Unit> logout() async {
    try {
      await _firebaseAuth.signOut();
      return unit;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  User? getLoggedInUser() {
    return _firebaseAuth.currentUser;
  }
}
