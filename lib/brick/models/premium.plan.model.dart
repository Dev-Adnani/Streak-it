import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_supabase/brick_supabase.dart';
import 'package:uuid/uuid.dart';

@ConnectOfflineFirstWithSupabase(
  supabaseConfig: SupabaseSerializable(tableName: 'plans'),
)
class PremiumPlan extends OfflineFirstWithSupabaseModel {
  @Supabase(unique: true)
  @Sqlite(index: true, unique: true, name: 'plan_id')
  final String planId;

  @Sqlite(name: 'user_id', index: true)
  @Supabase(foreignKey: 'user_id')
  final String userId; // Foreign key to Users table

  @Sqlite(name: 'plan_type')
  final String planType; // e.g., 'pro', 'onetime', etc.

  @Sqlite(name: 'start_date')
  final DateTime startDate;

  @Sqlite(name: 'end_date')
  final DateTime? endDate; // Null for lifetime or onetime plans

  @Sqlite(name: 'price')
  final double price; // Plan price

  @Sqlite(name: 'created_at')
  final DateTime createdAt;

  @Sqlite(name: 'updated_at')
  final DateTime updatedAt;

  PremiumPlan({
    String? planId,
    required this.userId,
    required this.planType,
    required this.startDate,
    this.endDate,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
  }) : planId = planId ?? const Uuid().v4();

  // toJson method
  Map<String, dynamic> toJson() => {
        'planId': planId,
        'userId': userId,
        'planType': planType,
        'startDate': startDate.toIso8601String(),
        'endDate': endDate?.toIso8601String(),
        'price': price,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };

  // fromJson method
  static PremiumPlan fromJson(Map<String, dynamic> data) => PremiumPlan(
        planId: data['planId'],
        userId: data['userId'],
        planType: data['planType'],
        startDate: DateTime.parse(data['startDate']),
        endDate:
            data['endDate'] != null ? DateTime.parse(data['endDate']) : null,
        price: data['price'],
        createdAt: DateTime.parse(data['createdAt']),
        updatedAt: DateTime.parse(data['updatedAt']),
      );

  // CopyWith method
  PremiumPlan copyWith({
    String? planId,
    String? userId,
    String? planType,
    DateTime? startDate,
    DateTime? endDate,
    double? price,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PremiumPlan(
      planId: planId ?? this.planId,
      userId: userId ?? this.userId,
      planType: planType ?? this.planType,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      price: price ?? this.price,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
