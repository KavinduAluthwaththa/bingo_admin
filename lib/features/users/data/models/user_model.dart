import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.houseNumber,
    required super.ownerName,
    required super.nic,
    required super.mobile,
    super.isPaidManually = false,
    super.lastPaymentUpdateDate,
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      id: doc.id,
      houseNumber: data['houseNumber'] ?? data['House_Number'] ?? '',
      ownerName: data['ownerName'] ?? data['Owner_Name'] ?? '',
      nic: data['nic'] ?? data['NIC'] ?? '',
      mobile: data['mobile'] ?? data['Owner_Mobile'] ?? '',
      isPaidManually: data['isPaidManually'] ?? false,
      lastPaymentUpdateDate: data['lastPaymentUpdateDate'] != null
          ? (data['lastPaymentUpdateDate'] as Timestamp).toDate()
          : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'houseNumber': houseNumber,
      'ownerName': ownerName,
      'nic': nic,
      'mobile': mobile,
      'isPaidManually': isPaidManually,
      'lastPaymentUpdateDate': lastPaymentUpdateDate != null
          ? Timestamp.fromDate(lastPaymentUpdateDate!)
          : null,
    };
  }
}
