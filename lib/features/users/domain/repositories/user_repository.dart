import '../entities/user_entity.dart';

abstract class UserRepository {
  Stream<List<UserEntity>> watchAll();
  Future<void> updatePaymentStatus(String userId, bool isPaid);
}
