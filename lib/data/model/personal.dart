class Personal {
  final String? birthdate;
  final String? sex;
  final String? bloodType;
  final String? status;
  final String? tailedBeast;

  Personal({
    this.birthdate,
    this.sex,
    this.bloodType,
    this.status,
    this.tailedBeast,
  });

  factory Personal.fromJson(Map<String, dynamic>? json) {
    return Personal(
      birthdate: json?['birthdate'] as String?,
      sex: json?['sex'] as String?,
      bloodType: json?['bloodType'] as String?,
      status: json?['status'] as String?,
      tailedBeast: json?['tailedBeast'] as String?,
    );
  }
}
