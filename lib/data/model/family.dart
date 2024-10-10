class Family {
  final String? father;
  final String? mother;
  final String? son;
  final String? daughter;
  final String? wife;

  Family({
    this.father,
    this.mother,
    this.son,
    this.daughter,
    this.wife,
  });

  factory Family.fromJson(Map<String, dynamic>? json) {
    return Family(
      father: json?['father'] as String?,
      mother: json?['mother'] as String?,
      son: json?['son'] as String?,
      daughter: json?['daughter'] as String?,
      wife: json?['wife'] as String?,
    );
  }
}
