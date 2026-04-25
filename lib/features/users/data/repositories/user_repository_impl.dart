import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseFirestore _db;

  UserRepositoryImpl({FirebaseFirestore? db})
      : _db = db ?? FirebaseFirestore.instance;

  @override
  Stream<List<UserEntity>> watchAll() {
    return _db.collection('users').snapshots().map(
      (snap) => snap.docs.map((doc) => UserModel.fromFirestore(doc)).toList(),
    );
  }

  @override
  Future<void> updatePaymentStatus(String userId, bool isPaid) {
    return _db.collection('users').doc(userId).update({
      'isPaidManually': isPaid,
      'lastPaymentUpdateDate': FieldValue.serverTimestamp(),
    });
  }
}
