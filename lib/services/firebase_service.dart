import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  late FirebaseAuth _firebaseAuth;
  late FirebaseFirestore _firebaseFirestore;

  FirebaseService() {
    _firebaseAuth = FirebaseAuth.instance;
    _firebaseFirestore = FirebaseFirestore.instance;
  }

  FirebaseAuth get firebaseAuth => _firebaseAuth;
  FirebaseFirestore get firebaseFirestore => _firebaseFirestore;
}
