import 'package:civicalert/uipages/AchievementsPage.dart';
import 'package:civicalert/uipages/AdminDashboard.dart';
import 'package:civicalert/uipages/AdminSettingsPage.dart';
import 'package:civicalert/uipages/AnalyticsReportsPage.dart';
import 'package:civicalert/uipages/AppUpdatesPage.dart';
import 'package:civicalert/uipages/AttachmentGalleryPage.dart';
import 'package:civicalert/uipages/AuditLogsPage.dart';
import 'package:civicalert/uipages/CommentThreadPage.dart';
import 'package:civicalert/uipages/DepartmentPerformancePage.dart';
import 'package:civicalert/uipages/ForgotPasswordPage.dart';
import 'package:civicalert/uipages/HelpFaqPage.dart';
import 'package:civicalert/uipages/LiveMapViewPage.dart';
import 'package:civicalert/uipages/LoginPage.dart';
import 'package:civicalert/uipages/ManageReportsPage.dart';
import 'package:civicalert/uipages/MyReportsPage.dart';
import 'package:civicalert/uipages/NotificationPrefsPage.dart';
import 'package:civicalert/uipages/NotificationsPage.dart';
import 'package:civicalert/uipages/ProfileSettingsPage.dart';
import 'package:civicalert/uipages/RegisterPage.dart';
import 'package:civicalert/uipages/ReportDetailsPage.dart';
import 'package:civicalert/uipages/SplashPage.dart';
import 'package:civicalert/uipages/StaffManagementPage.dart';
import 'package:civicalert/uipages/SubmitReportPage.dart';
import 'package:civicalert/uipages/SystemOverviewPage.dart';
import 'package:civicalert/uipages/UserDashboard.dart';
import 'package:civicalert/uipages/UserManagementPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



// --- Optionally import state/providers here if using Provider or Riverpod ---

void main() {
  runApp(
      MultiProvider(
        providers: [
          Provider<int>.value(value: 0),  // dummy provider; replace or remove later
        ],
        child: CivicReporterApp(),
      )

  );
}

class CivicReporterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Civic Issue Reporter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF1B4F72),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF1B4F72),
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF117864),
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      initialRoute: '/splash',
      onGenerateRoute: (settings) {
        // For route arguments handling
        switch (settings.name) {
          case '/splash': return MaterialPageRoute(builder: (_) => SplashPage());
          case '/login': return MaterialPageRoute(builder: (_) => LoginPage());
          case '/register': return MaterialPageRoute(builder: (_) => RegisterPage());
          case '/forgot_password': return MaterialPageRoute(builder: (_) => ForgotPasswordPage());
          case '/user_dashboard': return MaterialPageRoute(builder: (_) => UserDashboard());
          case '/submit_report': return MaterialPageRoute(builder: (_) => SubmitReportPage());
          case '/my_reports': return MaterialPageRoute(builder: (_) => MyReportsPage());
          case '/report_details':
            final int? reportId = settings.arguments as int?;
            return MaterialPageRoute(builder: (_) => ReportDetailsPage(reportId: reportId));
          case '/comment_thread':
            final int? reportId = settings.arguments as int?;
            return MaterialPageRoute(builder: (_) => CommentThreadPage(reportId: reportId));
          case '/notifications': return MaterialPageRoute(builder: (_) => NotificationsPage());
          case '/profile_settings':return MaterialPageRoute(builder: (_) => ProfileSettingsPage(),);
          case '/achievements': return MaterialPageRoute(builder: (_) => AchievementsPage());
          case '/help_faq': return MaterialPageRoute(builder: (_) => HelpFaqPage());
          case '/attachment_gallery':
            final int? reportId = settings.arguments as int?;
            return MaterialPageRoute(builder: (_) => AttachmentGalleryPage(reportId: reportId));
          case '/notification_prefs': return MaterialPageRoute(builder: (_) => NotificationPrefsPage());
          case '/admin_dashboard': return MaterialPageRoute(builder: (_) => AdminDashboard());
          case '/manage_reports': return MaterialPageRoute(builder: (_) => ManageReportsPage());
          case '/live_map_view': return MaterialPageRoute(builder: (_) => LiveMapViewPage());
          case '/analytics_reports': return MaterialPageRoute(builder: (_) => AnalyticsReportsPage());
          case '/department_performance': return MaterialPageRoute(builder: (_) => DepartmentPerformancePage());
          case '/system_overview': return MaterialPageRoute(builder: (_) => SystemOverviewPage());
          case '/staff_management': return MaterialPageRoute(builder: (_) => StaffManagementPage());
          case '/user_management': return MaterialPageRoute(builder: (_) => UserManagementPage());
          case '/audit_logs': return MaterialPageRoute(builder: (_) => AuditLogsPage());
          case '/admin_settings': return MaterialPageRoute(builder: (_) => AdminSettingsPage());
          case '/app_updates': return MaterialPageRoute(builder: (_) => AppUpdatesPage());
          default:
            return MaterialPageRoute(
              builder: (_) => Scaffold(
                body: Center(child: Text('404: Page not found')),
              ),
            );
        }
      },
    );
  }
}
