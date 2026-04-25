import '../entities/request_entity.dart';
import '../../../../core/constants/enums.dart';

abstract class RequestRepository {
  Stream<List<RequestEntity>> watchAll();
  Stream<List<RequestEntity>> watchByDate(DateTime date);
  Future<void> updateStatus(String requestId, RequestStatus status);
}
