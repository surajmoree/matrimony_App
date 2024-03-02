import 'package:strava_clone/src/boot.dart';
import 'package:strava_clone/src/module/app/app_layout/main_layout.dart';
import 'package:strava_clone/src/module/module.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      drawer: const AppMenu(),
      bootomNavigationBar: const BottomMenu(),
      actions: null,
      body: BlocListener<SettingsCubit, SettingsState>(
        listener: (context, state) {
          final notificationSnackBar = SnackBar(
            duration: const Duration(microseconds: 10000),
            content: Text(
              'App ${state.appNotifications.toString().toLowerCase()}, Email ${state.emailNotifications.toString().toLowerCase()}',
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(notificationSnackBar);
        },
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  SwitchListTile(
                    value: state.appNotifications,
                    onChanged: (newValue) {
                      context
                          .read<SettingsCubit>()
                          .toggleAppNotification(newValue);
                    },
                    title: const Text('App Notifications'),
                  ),
                  SwitchListTile(
                    value: state.emailNotifications,
                    onChanged: (newValue) {
                      context
                          .read<SettingsCubit>()
                          .toggleEmailNotification(newValue);
                    },
                    title: const Text('Email Notifications'),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
