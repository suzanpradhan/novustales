import 'package:json_annotation/json_annotation.dart';

class GenericConverter<T> implements JsonConverter<T, Map<String, dynamic>> {
  final T Function(Map<String, dynamic>) fromJsonT;
  const GenericConverter(this.fromJsonT);

  @override
  T fromJson(Map<String, dynamic> json) {
    return fromJsonT(json);
  }

  @override
  Map<String, dynamic> toJson(T object) {
    // Implement how `T` is serialized.
    // For example, if `T` has a `toJson` method:
    // if (object is User) {
    //   return (object as User).toJson();
    // }
    throw UnimplementedError('toJson is not implemented for $T');
  }
}
