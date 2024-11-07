dynamic parseData<T>(dynamic data, T Function(Map<String, dynamic>) fromJson) {
  if (data == null) return null;
  if(data is Map<String, dynamic>) return fromJson(data);
  if(data is List) return List<String>.from(data);
  if(data is String) return data;
}