import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';


// Instantiating fireStore
final fireStore = FirebaseFirestore.instance;

// Creating a user reference for a FireBase Collection
final userRef = fireStore.collection("users");


// Creating a budgetItem reference for a FireBase Collection
final budgetItemRef = fireStore.collection("budget_items");

// Creating a hotels reference for a FireBase Collection
final hotelRef = fireStore.collection("hotels");

// Creating a flightData reference for a FireBase Collection
final flightDataRef = fireStore.collection("flight_planes");

// Creating a taxiDetail reference for a FireBase Collection
final taxiRef = fireStore.collection("taxi");


// Creating a vehicleLease reference for a FireBase Collection
final vehicleLeaseRef = fireStore.collection("vehicle_lease");





// FOR FIREBASE STORAGE
Reference get firebaseStorage => FirebaseStorage.instance.ref();