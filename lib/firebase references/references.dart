import 'package:cloud_firestore/cloud_firestore.dart';

// Instantiating fireStore
final fireStore = FirebaseFirestore.instance;

// Creating a user reference for a FireBase Collection
final userRef = fireStore.collection("users");