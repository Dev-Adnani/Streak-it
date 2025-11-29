import 'package:brick_core/core.dart';
import 'package:streakit/brick/models/users.model.dart';
import 'package:streakit/brick/repository.dart';

abstract class UserAbstractRepository {
  Future<Users?> getUser({required String userId});
  Future<void> createUser({required Users user});
  Future<void> updateUser({required Users user});
  Future<void> deleteUser({required String userId});
  Future<List<Users>?> getUserByEmailOrUsername(
      {required String emailOrUsername});
  // change plan status
  Future<String> changePlanStatus({required String userId});
}

class UserDBRepository implements UserAbstractRepository {
  final Repository _repository = Repository();

  @override
  Future<void> createUser({required Users user}) async {
    try {
      await _repository.upsert<Users>(user);
    } catch (e) {
      throw Exception("Error creating user: $e");
    }
  }

  @override
  Future<void> deleteUser({required String userId}) async {
    try {
      final user = await getUser(userId: userId);
      if (user != null) {
        await _repository.delete<Users>(user);
      }
    } catch (e) {
      throw Exception("Error deleting user: $e");
    }
  }

  @override
  Future<Users?> getUser({required String userId}) async {
    try {
      final users = await _repository.get<Users>(
        query: Query.where('userId', userId),
      );
      return users.isNotEmpty ? users.first : null;
    } catch (e) {
      throw Exception("Error fetching user: $e");
    }
  }

  @override
  Future<List<Users>?> getUserByEmailOrUsername(
      {required String emailOrUsername}) async {
    try {
      final users = await _repository.get<Users>(
          query: Query(
        where: [
          Or('email').isExactly(emailOrUsername),
          Or('userName').isExactly(emailOrUsername),
        ],
      ));
      return users;
    } catch (e) {
      throw Exception("Error fetching users by email or username: $e");
    }
  }

  @override
  Future<void> updateUser({required Users user}) async {
    try {
      await _repository.upsert<Users>(user);
    } catch (e) {
      throw Exception("Error updating user: $e");
    }
  }

  @override
  Future<String> changePlanStatus({required String userId}) async {
    try {
      final Users? user = await getUser(userId: userId);

      if (user != null) {
        bool isPremiumUser = user.premiumUser ?? false;
        Users? updatedUser = user.copyWith(
          premiumUser: !isPremiumUser,
        );

        await _repository.upsert<Users>(updatedUser);

        // User is now a premium user
        if (updatedUser.premiumUser ?? false) {
          return "User is now a premium user";
        } else {
          return "User is no longer a premium user";
        }

      }
    } catch (e) {
      throw Exception("Error changing plan status: $e");
      
    }
    return "Failed to change plan status";
  }
}
