// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freezed_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

UserMinimal _$UserMinimalFromJson(Map<String, dynamic> json) {
  return _UserMinimal.fromJson(json);
}

abstract class _$UserMinimal {
  String get userId;
  String get displayName;

  UserMinimal copyWith({String userId, String displayName});

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class _$_UserMinimal implements _UserMinimal {
  const _$_UserMinimal(this.userId, this.displayName);

  factory _$_UserMinimal.fromJson(Map<String, dynamic> json) =>
      _$_$_UserMinimalFromJson(json);

  @override
  final String userId;
  @override
  final String displayName;

  @override
  String toString() {
    return 'UserMinimal(userId: $userId, displayName: $displayName)';
  }

  @override
  bool operator ==(dynamic other) {
    return other is _UserMinimal &&
        (identical(other.userId, userId) || other.userId == userId) &&
        (identical(other.displayName, displayName) ||
            other.displayName == displayName);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ userId.hashCode ^ displayName.hashCode;

  @override
  _$_UserMinimal copyWith({
    Object userId = immutable,
    Object displayName = immutable,
  }) {
    return _$_UserMinimal(
      userId == immutable ? this.userId : userId as String,
      displayName == immutable ? this.displayName : displayName as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserMinimalToJson(this);
  }
}

abstract class _UserMinimal implements UserMinimal {
  const factory _UserMinimal(String userId, String displayName) =
      _$_UserMinimal;

  factory _UserMinimal.fromJson(Map<String, dynamic> json) =
      _$_UserMinimal.fromJson;

  @override
  String get userId;
  @override
  String get displayName;

  @override
  _UserMinimal copyWith({String userId, String displayName});
}

abstract class _$OtherTile {
  UserMinimal get user;
  Sentiment get sentiment;

  OtherTile copyWith({UserMinimal user, Sentiment sentiment});
}

class _$_OtherTile implements _OtherTile {
  const _$_OtherTile(this.user, this.sentiment);

  @override
  final UserMinimal user;
  @override
  final Sentiment sentiment;

  @override
  String toString() {
    return 'OtherTile(user: $user, sentiment: $sentiment)';
  }

  @override
  bool operator ==(dynamic other) {
    return other is _OtherTile &&
        (identical(other.user, user) || other.user == user) &&
        (identical(other.sentiment, sentiment) || other.sentiment == sentiment);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ user.hashCode ^ sentiment.hashCode;

  @override
  _$_OtherTile copyWith({
    Object user = immutable,
    Object sentiment = immutable,
  }) {
    return _$_OtherTile(
      user == immutable ? this.user : user as UserMinimal,
      sentiment == immutable ? this.sentiment : sentiment as Sentiment,
    );
  }
}

abstract class _OtherTile implements OtherTile {
  const factory _OtherTile(UserMinimal user, Sentiment sentiment) =
      _$_OtherTile;

  @override
  UserMinimal get user;
  @override
  Sentiment get sentiment;

  @override
  _OtherTile copyWith({UserMinimal user, Sentiment sentiment});
}

abstract class _$MyTile {
  UserMinimal get user;
  Sentiment get sentiment;

  MyTile copyWith({UserMinimal user, Sentiment sentiment});
}

class _$_MyTile implements _MyTile {
  const _$_MyTile(this.user, this.sentiment);

  @override
  final UserMinimal user;
  @override
  final Sentiment sentiment;

  @override
  String toString() {
    return 'MyTile(user: $user, sentiment: $sentiment)';
  }

  @override
  bool operator ==(dynamic other) {
    return other is _MyTile &&
        (identical(other.user, user) || other.user == user) &&
        (identical(other.sentiment, sentiment) || other.sentiment == sentiment);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ user.hashCode ^ sentiment.hashCode;

  @override
  _$_MyTile copyWith({
    Object user = immutable,
    Object sentiment = immutable,
  }) {
    return _$_MyTile(
      user == immutable ? this.user : user as UserMinimal,
      sentiment == immutable ? this.sentiment : sentiment as Sentiment,
    );
  }
}

abstract class _MyTile implements MyTile {
  const factory _MyTile(UserMinimal user, Sentiment sentiment) = _$_MyTile;

  @override
  UserMinimal get user;
  @override
  Sentiment get sentiment;

  @override
  _MyTile copyWith({UserMinimal user, Sentiment sentiment});
}

abstract class _$Dashboard {
  MyTile get myTile;
  List<OtherTile> get otherTiles;

  Dashboard copyWith({MyTile myTile, List<OtherTile> otherTiles});
}

class _$_Dashboard implements _Dashboard {
  const _$_Dashboard(this.myTile, this.otherTiles);

  @override
  final MyTile myTile;
  @override
  final List<OtherTile> otherTiles;

  @override
  String toString() {
    return 'Dashboard(myTile: $myTile, otherTiles: $otherTiles)';
  }

  @override
  bool operator ==(dynamic other) {
    return other is _Dashboard &&
        (identical(other.myTile, myTile) || other.myTile == myTile) &&
        (identical(other.otherTiles, otherTiles) ||
            other.otherTiles == otherTiles);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ myTile.hashCode ^ otherTiles.hashCode;

  @override
  _$_Dashboard copyWith({
    Object myTile = immutable,
    Object otherTiles = immutable,
  }) {
    return _$_Dashboard(
      myTile == immutable ? this.myTile : myTile as MyTile,
      otherTiles == immutable ? this.otherTiles : otherTiles as List<OtherTile>,
    );
  }
}

abstract class _Dashboard implements Dashboard {
  const factory _Dashboard(MyTile myTile, List<OtherTile> otherTiles) =
      _$_Dashboard;

  @override
  MyTile get myTile;
  @override
  List<OtherTile> get otherTiles;

  @override
  _Dashboard copyWith({MyTile myTile, List<OtherTile> otherTiles});
}

abstract class _$SentimentUpdate {
  String get sentiment;

  SentimentUpdate copyWith({String sentiment});
}

class _$_SentimentUpdate implements _SentimentUpdate {
  const _$_SentimentUpdate(this.sentiment);

  @override
  final String sentiment;

  @override
  String toString() {
    return 'SentimentUpdate(sentiment: $sentiment)';
  }

  @override
  bool operator ==(dynamic other) {
    return other is _SentimentUpdate &&
        (identical(other.sentiment, sentiment) || other.sentiment == sentiment);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ sentiment.hashCode;

  @override
  _$_SentimentUpdate copyWith({
    Object sentiment = immutable,
  }) {
    return _$_SentimentUpdate(
      sentiment == immutable ? this.sentiment : sentiment as String,
    );
  }
}

abstract class _SentimentUpdate implements SentimentUpdate {
  const factory _SentimentUpdate(String sentiment) = _$_SentimentUpdate;

  @override
  String get sentiment;

  @override
  _SentimentUpdate copyWith({String sentiment});
}
