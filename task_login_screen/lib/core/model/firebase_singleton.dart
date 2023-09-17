//This class contains all Firestore operations 
// ignore: depend_on_referenced_packages
// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreSingleton {
  static final FirestoreSingleton _instance = FirestoreSingleton._internal();
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  WriteBatch? _batchdata;

  factory FirestoreSingleton() {
    return _instance;
  }

  FirestoreSingleton._internal();

  ///Gets the Firebase Document
  Future<DocumentSnapshot<Map<String, dynamic>>> getDocument(
      String documentPath) async {
    try {
      return await _firestore.doc(documentPath).get();
    } catch (e) {
      throw AssertionError(e);
    }
  }

  ///Gets the Firebase Collection
  Future<QuerySnapshot<Map<String, dynamic>>> getCollection(
      String collectionPath) async {
    try {
      return await _firestore.collection(collectionPath).get();
    } on FirebaseException catch (e) {
      print(e.message);
      throw AssertionError(e);
    } catch (e) {
      throw AssertionError(e);
    }
  }

  /// Returns Map<String, dynamic> from collection
  Future<Map<String, dynamic>> getMapFromCollection(
      String collectionPath) async {
    try {
      QuerySnapshot<Map<String, dynamic>> qs =
          await getCollection(collectionPath);

      List<QueryDocumentSnapshot<Map<String, dynamic>>> docs = qs.docs;
      Iterable<MapEntry<String, dynamic>> mapEntries =
          docs.map((e) => MapEntry<String, dynamic>(e.id, e.data()));

      return Map<String, dynamic>.fromEntries(mapEntries);
    } on FirebaseException catch (e) {
      throw AssertionError(e);
    }
  }

//Adds a Firebase Document
  Future<DocumentReference<Map<String, dynamic>>> addDocumenttoCollection(
      String collectionPath, Map<String, dynamic> data) async {
    try {
      return await _firestore.collection(collectionPath).add(data);
    } on FirebaseException catch (e) {
      print(e.message);
      throw AssertionError(e);
    }
  }

  Future addDocumenttoCollectionSpecId(
      String collectionPath, String docName, var data) async {
    _firestore.collection(collectionPath).doc(docName).set(
        {'messages': FieldValue.arrayUnion(data)}, SetOptions(merge: true));
    try {} catch (e) {
      print(e);
    }
  }

  Future addCollectiontoDocumentSpecId(
      String docPath, String collectionPath, Map<String, dynamic> data) async {
    try {
      return await _firestore.doc(docPath).collection(collectionPath).add(data);
    } catch (e) {
      print(e);
      throw AssertionError(e);
    }
  }

  ///Adds a Firebase Collection
  Future<String> addCollectiontoDocument(
      String collectionPath, Map<String, dynamic> data,
      {String? id}) async {
    try {
      id ??= _firestore.collection(collectionPath).doc().id;
      String documentPath = "$collectionPath/$id";
      data["id"] = id;
      await _firestore.doc(documentPath).set(data);
      return id;
    } catch (e) {
      throw AssertionError(e);
    }
  }

  ///Adds a Firebase Collection
  Future<String> addCollectiontoDocumentWithID(
      String collectionPath, Map<String, dynamic> data, String? id) async {
    try {
      return _firestore.collection(collectionPath).doc().id;
    } catch (e) {
      throw AssertionError(e);
    }
  }

  ///Sets the Firebase Document
  Future<void> setDocument(String documentPath, Map<String, dynamic> data,
      {bool merge = true}) async {
    try {
      return await _firestore
          .doc(documentPath)
          .set(data, SetOptions(merge: merge));
    } catch (e) {
      throw AssertionError(e);
    }
  }

  ///Starts the Firebase Batch
  WriteBatch get _batchStart => _batchdata ??= _firestore.batch();

  ///Sets the Firebase Batch
  void batchSetDocument(String documentPath, Map<String, dynamic> data,
      {bool merge = true}) async {
    try {
      DocumentReference docRef = _firestore.doc(documentPath);
      _batchStart.set(docRef, data, SetOptions(merge: merge));
    } catch (e) {
      throw AssertionError(e);
    }
  }

  ///updates fields, to  fields in nested objects; use '.' between two field
  void updateField(String docPath, String fieldPath, data) {
    try {
      _firestore.doc(docPath).update({fieldPath: data});
    } catch (e) {
      throw AssertionError(e);
    }
  }

    void setField(String docPath, String fieldPath, data) {
    try {
      _firestore.doc(docPath).set({fieldPath: data},SetOptions(merge: true));
    } catch (e) {
      throw AssertionError(e);
    }
  }


  void increaseFieldValue(String docPath,String fieldName){
    try{
      _firestore.doc(docPath).set({fieldName:FieldValue.increment(1)},SetOptions(merge: true));
    }catch(e){}
  }

  ///Updates the Firebase Batch
  void batchUpdateDocument(
      String documentPath, Map<String, dynamic> data) async {
    try {
      DocumentReference docRef = _firestore.doc(documentPath);
      _batchStart.update(docRef, data);
    } catch (e) {
      throw AssertionError(e);
    }
  }

  ///Deletes the Firebase Batch
  void batchDeleteDocument(String documentPath) async {
    try {
      DocumentReference docRef = _firestore.doc(documentPath);
      _batchStart.delete(docRef);
    } catch (e) {
      throw AssertionError(e);
    }
  }

  ///Commits the Firebase Batch
  Future<void> batchCommit() async {
    try {
      _batchStart.commit();
      _batchdata = null;
    } catch (e) {
      throw AssertionError(e);
    }
  }

  ///Updates the Firebase Document
  Future<void> updateDocument(
      String documentPath, Map<String, dynamic> data) async {
    try {
      await _firestore.doc(documentPath).update(data);
    } catch (e) {
      throw AssertionError(e);
    }
  }

  ///Deletes the Fireabase Document
  Future deleteDocument(String documentPath) async {
    try {
      await _firestore.doc(documentPath).delete();
    } catch (e) {
      throw AssertionError(e);
    }
  }

  Future deleteDocumentField(String documentPath, String field) async {
    try {
      await _firestore.doc(documentPath).update({field: FieldValue.delete()});
    } catch (e) {
      throw AssertionError(e);
    }
  }
  

  Future addDocumentField(

      String documentPath, Map<String, dynamic> field) async {
    try {
      
      await _firestore.doc(documentPath).set(field, SetOptions(merge: true));
    } catch (e) {
      throw AssertionError(e);
    }
  }
}
