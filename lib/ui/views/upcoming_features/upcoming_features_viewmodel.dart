import 'dart:convert';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:streakit/app/app.locator.dart';
import 'package:streakit/services/supabase_api_service.dart';
import 'package:streakit/ui/views/upcoming_features/model/feature.model.dart';
import 'package:http/http.dart' as http;

class UpcomingFeaturesViewModel extends FutureViewModel<List<Feature>> {
  final NavigationService _navigationService = locator<NavigationService>();
  final SupabaseApiService _supabaseApiService = locator<SupabaseApiService>();

  void goBack() {
    _navigationService.back();
  }

  @override
  Future<List<Feature>> futureToRun() async {
    try {
      // Get the public URL of the file
      final String publicUrl = _supabaseApiService
          .supabaseInstance.client.storage
          .from('upcoming-features')
          .getPublicUrl('features.json');

      // Fetch the JSON data using the public URL
      final response = await http.get(Uri.parse(publicUrl));

      if (response.statusCode == 200) {
        // Parse the JSON data
        final jsonData = jsonDecode(response.body) as List;
        return jsonData.map((item) => Feature.fromJson(item)).toList();
      } else {
        throw Exception(
            'Failed to fetch features. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Backup data in case of failure
      const backup = [
        {
          "title": "Recent Milestones",
          "description":
              "We introduced offline mode, a sleek dark theme, and faster app speeds.",
        },
        {
          "title": "Upcoming Features",
          "description":
              "Cloud sync, team collaboration, and enhanced customization are on the way.",
        },
      ];
      return backup.map((item) => Feature.fromJson(item)).toList();
    }
  }
}
