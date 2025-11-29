import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_sqlite/memory_cache_provider.dart';
import 'package:brick_supabase/brick_supabase.dart' hide Supabase;
import 'package:sqflite_common/sqlite_api.dart';
import 'package:streakit/brick/db/schema.g.dart';
import 'package:streakit/brick/models/users.model.dart';
import 'package:streakit/services/supabase_api_service.dart';
import 'package:streakit/ui/common/app.credentials.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'brick.g.dart';

class Repository extends OfflineFirstWithSupabaseRepository {
  static late Repository? _instance;

  Repository._({
    required super.supabaseProvider,
    required super.sqliteProvider,
    required super.migrations,
    required super.offlineRequestQueue,
    super.memoryCacheProvider,
  });

  factory Repository() => _instance!;

  static Future<void> configure(DatabaseFactory databaseFactory) async {
    final (client, queue) = OfflineFirstWithSupabaseRepository.clientQueue(
      databaseFactory: databaseFactory,
    );
    final SupabaseApiService supabaseApiService = SupabaseApiService();
    await Supabase.initialize(
      url: AppCredentials.supbaseApiUrl,
      anonKey: AppCredentials.supbaseApiKey,
      httpClient: client,
      authOptions: const FlutterAuthClientOptions(
        authFlowType: AuthFlowType.implicit,
      ),
      realtimeClientOptions: const RealtimeClientOptions(
        logLevel: RealtimeLogLevel.info,
      ),
      storageOptions: const StorageClientOptions(
        retryAttempts: 10,
      ),
      debug: true,
    );
    supabaseApiService.setSupabaseInstance(supabaseInstance: Supabase.instance);

    final provider = SupabaseProvider(
      Supabase.instance.client,
      modelDictionary: supabaseModelDictionary,
    );

    _instance = Repository._(
      supabaseProvider: provider,
      sqliteProvider: SqliteProvider(
        'my_repository.sqlite',
        databaseFactory: databaseFactory,
        modelDictionary: sqliteModelDictionary,
      ),
      migrations: migrations,
      offlineRequestQueue: queue,
      // Specify class types that should be cached in memory
      memoryCacheProvider: MemoryCacheProvider([Users]),
    );
  }
}
