import 'package:appointment_doctor/model/doctor_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

final geo = GeoFlutterFire();

class HospitalModel {
  final String? id;
  final String? namaRS;
  final String? telepon;
  final String? alamat;
  final GeoFirePoint? position;
  final String? imageUrl;
  final DateTime? dateAdded;

  const HospitalModel({
    this.id,
    this.namaRS,
    this.telepon,
    this.alamat,
    this.position,
    this.imageUrl,
    this.dateAdded
  });

  static HospitalModel empty() => HospitalModel(
    id: '',
    namaRS: '',
    telepon: '',
    alamat: '',
    position: geo.point(latitude: 0, longitude: 0),
    imageUrl: '',
    dateAdded: DateTime.now()
  );

  Map<String, dynamic> toJson() {
    return {
      'namaRS': namaRS,
      'telepon': telepon,
      'alamat': alamat,
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

  static Future<HospitalModel> getHospitalDetailsWithId(String hospitalId) async {
    try {
      final documentSnapshot = await FirebaseFirestore.instance.collection("hospitals").doc(hospitalId).get();
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

  static Future<List<HospitalModel>> getNearestHospitals(double latitude, double longitude) async {
    try {
      GeoFirePoint center = geo.point(latitude: latitude, longitude: longitude);

      final stream = geo.collection(collectionRef: FirebaseFirestore.instance.collection('hospitals')).within(center: center, radius: 10, field: 'position');

      List<HospitalModel> hospitals = [];

      stream.listen((List<DocumentSnapshot> querySnapshot) {
        hospitals = querySnapshot.map((doc) => HospitalModel.fromSnapshot(doc)).toList();
      });
      return hospitals;
    } 
    catch (e) {
      print('Error retrieving hospital data: $e');
      return [];
    }
  }

  static Future<List<DoctorModel>> getDoctorsHospital(String hospitalId) async {
    try {
      
      DocumentSnapshot scheduleDoc = await FirebaseFirestore.instance
          .collection('schedules')
          .doc(hospitalId)
          .get();
          
      if (!scheduleDoc.exists) {
        throw 'No schedule found for the current hospital';
      }

      // Get the doctor IDs from the schedule
      Map<String, dynamic> scheduleData = scheduleDoc.data() as Map<String, dynamic>;
      List<String> doctorIds = scheduleData.keys.toList();

      // Fetch doctor details for each doctor ID
      List<DoctorModel> doctors = [];
      for (String doctorId in doctorIds) {
        DocumentSnapshot doctorDoc = await FirebaseFirestore.instance
            .collection('doctors')
            .doc(doctorId)
            .get();
        
        if (doctorDoc.exists) {
          doctors.add(DoctorModel.fromSnapshot(doctorDoc));
        }
      }

      return doctors;
    } 
    catch (e) {
      print('Error retrieving doctors for the hospital: $e');
      return [];
    }
  }
}