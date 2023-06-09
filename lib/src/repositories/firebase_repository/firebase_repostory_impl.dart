import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportify/src/repositories/firebase_repository/firebase_repository.dart';

final firebaseRepository =
    Provider<FirebaseRepository>((_) => FirebaseRepositoryImpl());

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  // final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  // set without merge will overwrite a document or create it if it doesn't exist yet
  // set with merge will update fields in the document or create it if it doesn't exists//
  // update will update fields but will fail if the document doesn't exist
  // create will create the document but fail if the document already exists
  @override
  Future<T> setData<T>({
    required String path,
    required Map<String, dynamic> data,
    required T Function(dynamic data) builder,
    bool merge = false,
  }) async {
    try {
      final reference = _firebaseFirestore.doc(path);
      await reference.set(data, SetOptions(merge: merge));
      return builder(true);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<T> updateData<T>({
    required String path,
    required Map<String, dynamic> data,
    required T Function(dynamic data) builder,
  }) async {
    try {
      final reference = _firebaseFirestore.doc(path);
      await reference.update(data);
      return builder(true);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> deleteData({required String path}) async {
    final reference = _firebaseFirestore.doc(path);
    log('delete: $path');
    await reference.delete();
  }

  @override
  Future<String> addDataToCollection({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = _firebaseFirestore.collection(path);
    log('$path: $data');
    return await reference.add(data).then((value) => value.id);
  }

  @override
  Future<T> getData<T>({
    required String path,
    required T Function(dynamic data, String? documentId) builder,
  }) async {
    try {
      final reference = _firebaseFirestore.doc(path);
      final value = await reference.get();
      return builder(value.data(), value.id);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<T> getCollectionData<T>({
    required String path,
    required Future<T> Function(
            List<QueryDocumentSnapshot<Map<String, dynamic>>>? data)
        builder,
    Query<Map<String, dynamic>>? Function(Query<Map<String, dynamic>> query)?
        queryBuilder,
  }) async {
    Query<Map<String, dynamic>> query = _firebaseFirestore.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    final value = await query.get();
    if (value.size > 0) {
      return builder(value.docs);
    }
    return builder(null);
  }

  @override
  Future deleteAllCollectionData<T>({
    required String path,
  }) async {
    final WriteBatch batch = FirebaseFirestore.instance.batch();
    const int batchSize = 100;
    bool lastBatch = false;

    Query<Map<String, dynamic>> query =
        _firebaseFirestore.collection(path).limit(batchSize);
    await query.get().then((snapshot) {
      if (snapshot.size < batchSize) {
        lastBatch = true;
      }
      for (DocumentSnapshot document in snapshot.docs) {
        batch.delete(document.reference);
      }
    });

    await batch.commit();
    if (!lastBatch) {
      await deleteAllCollectionData(path: path);
    }
    return batch.commit();
  }

  @override
  Stream<List<T>> collectionStream<T>({
    required String path,
    required T Function(DocumentSnapshot? doc) builder,
    Query<Map<String, dynamic>>? Function(Query<Map<String, dynamic>> query)?
        queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) {
    Query<Map<String, dynamic>> query = _firebaseFirestore.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }

    final Stream<QuerySnapshot<Map<String, dynamic>>> snapshots =
        query.snapshots();

    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map((snapshot) => builder(snapshot))
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  @override
  Stream<T> documentStream<T>({
    required String path,
    required T Function(DocumentSnapshot? data) builder,
  }) {
    final DocumentReference<Map<String, dynamic>> reference =
        _firebaseFirestore.doc(path);
    final Stream<DocumentSnapshot<Map<String, dynamic>>> snapshots =
        reference.snapshots();
    return snapshots.map((snapshot) => builder(snapshot));
  }

  /// FireBaseStorage
  // @override
  // Future<T> uploadImage<T>({
  //   required String path,
  //   required File file,
  //   required T Function(dynamic data) builder,
  // }) async {
  //   try {
  //     UploadTask _uploadTask = _firebaseStorage.ref().child(path).putFile(file);
  //     final _downloadURL = await (await _uploadTask).ref.getDownloadURL();
  //     return builder(_downloadURL);
  //   } catch (e) {
  //     log(e.toString());
  //     final _failure = ServerFailure(
  //       message: Exceptions.errorMessage(e),
  //       statusCode: Exceptions.statusCode(e),
  //     );
  //     return builder(_failure);
  //   }
  // }

  // @override
  // Future deleteImage({required String path}) async {
  //   return await _firebaseStorage.ref().child(path).delete();
  // }

  // @override
  // Future deleteAllFolderImages({required String path}) async {
  //   return await _firebaseStorage.ref().child(path).listAll().then((result) {
  //     for (final file in result.items) {
  //       file.delete();
  //     }
  //   });
  // }
}
