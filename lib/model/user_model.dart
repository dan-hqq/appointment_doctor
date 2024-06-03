import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class UserModel {
  final String? id;
  String? fullName;
  String? email;
  int? role;

  UserModel({
    this.id,
    this.fullName,
    this.email,
    this.role
  });

  static UserModel empty() => UserModel(
    id: '', 
    fullName: '', 
    email: '',
    role: 0
  );

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName!,
      'email': email!,
      'role': role!
    };
  }

  /// Factory method to create a UserModel from a DocumentSnapshot
  factory UserModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    final data = documentSnapshot.data() as Map<String, dynamic>;
    return UserModel(
      id: documentSnapshot.id,
      fullName: data['fullName'],
      email: data['email'],
      role: data['role']
    );
  }

  /// Function to save user data to Firestore
  Future<void> createUserInDatabase(UserModel user) async {
    
    final database = FirebaseFirestore.instance;

    try {
      await database.collection("users").doc(user.id).set(user.toJson());
    } 
    on FirebaseException catch (e) {
      throw e.code;
    } 
    on FormatException catch (_) {
      throw 'Format exeption error';
    } 
    on PlatformException catch (e) {
      throw e.code;
    }
    catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  static Future<UserModel> getUserDetails() async {
    try {
      final documentSnapshot = await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } 
      else {
        throw UserModel.empty();
      }
    } 
    on FirebaseException catch (e) {
      throw e.code;
    } 
    on FormatException catch (_) {
      throw 'Format exeption error';
    } 
    on PlatformException catch (e) {
      throw e.code;
    } 
    catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
