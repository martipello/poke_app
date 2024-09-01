import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers/serializers.dart';

part 'user_score.g.dart';

abstract class UserScore implements Built<UserScore, UserScoreBuilder> {

  factory UserScore([void Function(UserScoreBuilder) updates]) = _$UserScore;
  UserScore._();

  String? get name;

  String? get alias;

  int get correctScore;

  int get incorrectScore;

  int get skippedScore;

  String? get uid;

  DateTime? get createdDate;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(UserScore.serializer, this) as Map<String, dynamic>;
  }

  static UserScore fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(UserScore.serializer, json)!;
  }

  static Serializer<UserScore> get serializer => _$userScoreSerializer;
}