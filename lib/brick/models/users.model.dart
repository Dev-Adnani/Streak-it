import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_supabase/brick_supabase.dart';
import 'package:uuid/uuid.dart';

@ConnectOfflineFirstWithSupabase(
  supabaseConfig: SupabaseSerializable(tableName: 'users'),
)
class Users extends OfflineFirstWithSupabaseModel {
  @Supabase(unique: true)
  @Sqlite(index: true, unique: true, name: 'user_id')
  final String userId;

  @Sqlite(name: 'user_name')
  final String userName;

  final String email;

  @Sqlite(name: 'created_at')
  final DateTime createdAt;

  @Sqlite(name: 'updated_at')
  final DateTime updatedAt;

  @Sqlite(name: 'profile_url')
  final String profileUrl;

  @Sqlite(name: 'animal_sprit')
  final String? animalSprit;

  @Sqlite(name: 'is_deleted')
  final bool? isDeleted;

  @Sqlite(name: 'premium_user')
  final bool? premiumUser;

  Users({
    String? userId,
    required this.userName,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.profileUrl,
    required this.animalSprit,
    bool? isDeleted,
    bool? premiumUser,
  })  : userId = userId ?? const Uuid().v4(),
        isDeleted = isDeleted ?? false,
        premiumUser = premiumUser ?? false;

  //toJson and fromJson methods
  Map<String, dynamic> toJson() => {
        'userId': userId,
        'userName': userName,
        'email': email,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        'profileUrl': profileUrl,
        'animalSprit': animalSprit,
        'isDeleted': isDeleted,
        'premiumUser': premiumUser,
      };
  static Users fromJson(Map<String, dynamic> data) => Users(
        userId: data['userId'],
        userName: data['userName'],
        email: data['email'],
        createdAt: DateTime.parse(data['createdAt']),
        updatedAt: DateTime.parse(data['updatedAt']),
        profileUrl: data['profileUrl'],
        animalSprit: data['animalSprit'],
        isDeleted: data['isDeleted'],
        premiumUser: data['premiumUser'],
      );

  // CopyWith method
  Users copyWith({
    String? userId,
    String? userName,
    String? email,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? profileUrl,
    String? animalSprit,
    bool? isDeleted,
    bool? premiumUser,
  }) {
    return Users(
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      profileUrl: profileUrl ?? this.profileUrl,
      animalSprit: animalSprit ?? this.animalSprit,
      isDeleted: isDeleted ?? this.isDeleted,
      premiumUser: premiumUser ?? this.premiumUser,
    );
  }
}
