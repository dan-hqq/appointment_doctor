import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

class HospitalModel {
  final String? id;
  final String? namaRS;
  final String? telepon;
  final String? alamat;
  // final String? latitude;
  // final String? longitude;
  final GeoFirePoint? position;
  final String? imageUrl;
  final DateTime? dateAdded;

  const HospitalModel({
    this.id,
    this.namaRS,
    this.telepon,
    this.alamat,
    // this.latitude,
    // this.longitude,
    this.position,
    this.imageUrl,
    this.dateAdded
  });

  static HospitalModel empty() => HospitalModel(
    id: '',
    namaRS: '',
    telepon: '',
    alamat: '',
    // latitude: '',
    // longitude: '',
    position: GeoFlutterFire().point(latitude: 0, longitude: 0),
    imageUrl: '',
    dateAdded: DateTime.now()
  );

  Map<String, dynamic> toJson() {
    return {
      'namaRS': namaRS,
      'telepon': telepon,
      'alamat': alamat,
      // 'latitude': latitude,
      // 'longitude': longitude,
      'position': position?.data,
      'imageUrl': imageUrl,
      'dateAdded': DateTime.now()
    };
  }

  factory HospitalModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    final data = documentSnapshot.data() as Map<String, dynamic>;
    return HospitalModel(
      id: documentSnapshot.id,
      namaRS: data['namaRS'],
      telepon: data['telepon'],
      alamat: data['alamat'],
      // latitude: data['latitude'],
      // longitude: data['longitude'],
      position: GeoFirePoint(data['position']['geopoint'].latitude, data['position']['geopoint'].longitude),
      imageUrl: data['imageUrl'],
      dateAdded: (data['dateAdded'] as Timestamp).toDate()
    );
  }

  static Future<void> createHospitalInDatabase(HospitalModel hospital) async {
    try {
      await FirebaseFirestore.instance.collection("hospitals").doc(hospital.id).set(hospital.toJson());
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
      print(e);
      throw 'Something went wrong. Please try again $e';
    }
  }

  static Future<HospitalModel> getHospitalDetails() async {
    try {
      final documentSnapshot = await FirebaseFirestore.instance.collection("hospitals").doc(FirebaseAuth.instance.currentUser?.uid).get();
      if (documentSnapshot.exists) {
        return HospitalModel.fromSnapshot(documentSnapshot);
      } 
      else {
        throw HospitalModel.empty();
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

  static Future<List<HospitalModel>> getAllHospital() async {
    List<HospitalModel> hospitals = [];

    try {
    
      final querySnapshot = await FirebaseFirestore.instance
        .collection("hospitals")
        .orderBy('dateAdded', descending: true) // Urutkan berdasarkan dateAdded dengan urutan menurun (terbaru ke terlama)
        .get();

      hospitals = querySnapshot.docs.map((doc) => HospitalModel.fromSnapshot(doc)).toList();
    } 
    catch (e) {
      print(e);
      throw 'Gagal mengambil data rumah sakit';
    }

    return hospitals;
  }
}