import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseApiService {
  SupabaseApiService._privateConstructor();
  static final SupabaseApiService _instance =
      SupabaseApiService._privateConstructor();
  factory SupabaseApiService() => _instance;

  late Supabase supabaseInstance;

  setSupabaseInstance({required Supabase supabaseInstance}) async {
    this.supabaseInstance = supabaseInstance;
  }
}
