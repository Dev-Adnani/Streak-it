import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:streakit/services/alert_service.dart';
import 'package:streakit/services/analytics_service.dart';
import 'package:streakit/services/google_auth_service.dart';
import 'package:streakit/services/notification_service.dart';
import 'package:streakit/services/supabase_api_service.dart';
import 'package:streakit/services/user_service.dart';
import 'package:streakit/ui/views/archived_habit/archived_habit_view.dart';
import 'package:streakit/ui/views/change_password/change_password_view.dart';
import 'package:streakit/ui/views/create_habit/create_habit_view.dart';
import 'package:streakit/ui/views/home/home_view.dart';
import 'package:streakit/ui/views/html/html_view.dart';
import 'package:streakit/ui/views/onboarding/onboarding_view.dart';
import 'package:streakit/ui/views/otp/otp_view.dart';
import 'package:streakit/ui/views/register/register_view.dart';
import 'package:streakit/ui/views/settings/settings_view.dart';
import 'package:streakit/ui/views/splash/splash_view.dart';
import 'package:streakit/ui/views/navbar/navbar_view.dart';
import 'package:streakit/ui/views/support_developer/support_developer_view.dart';
import 'package:streakit/ui/views/upcoming_features/upcoming_features_view.dart';
import 'package:streakit/ui/views/user_profile/user_profile_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: HtmlView),
    MaterialRoute(page: OnboardingView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: OtpView),
    MaterialRoute(page: SettingsView),
    MaterialRoute(page: SplashView),
    MaterialRoute(page: ChangePasswordView),
    MaterialRoute(page: NavbarView),
    CustomRoute(page: CreateHabitView),
    MaterialRoute(page: UpcomingFeaturesView),
    MaterialRoute(page: SupportDeveloperView),
    MaterialRoute(page: UserProfileView),
    MaterialRoute(page: ArchivedHabitView),
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AlertService),
    LazySingleton(classType: GoogleAuthService),
    LazySingleton(classType: SupabaseApiService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: AnalyticsService),
    InitializableSingleton(classType: NotificationService),
  ],
  // bottomsheets: [
  //   StackedBottomsheet(classType: NoticeSheet),
  // ],
  // dialogs: [
  //   StackedDialog(classType: InfoAlertDialog),
  // ],
)
class App {}
