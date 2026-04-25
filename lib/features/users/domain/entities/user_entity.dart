class UserEntity {
  final String id;
  final String houseNumber;
  final String ownerName;
  final String nic;
  final String mobile;
  final bool isPaidManually;
  final DateTime? lastPaymentUpdateDate;

  UserEntity({
    required this.id,
    required this.houseNumber,
    required this.ownerName,
    required this.nic,
    required this.mobile,
    this.isPaidManually = false,
    this.lastPaymentUpdateDate,
  });

  bool isEffectivelyPaid(int validDays) {
    if (!isPaidManually) return false;
    if (lastPaymentUpdateDate == null) return false;
    final expiryDate = lastPaymentUpdateDate!.add(Duration(days: validDays));
    return DateTime.now().isBefore(expiryDate);
  }
}
