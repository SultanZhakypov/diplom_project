import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/profile/profile_viewmodel.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    Provider.of<ProfileViewModel>(context, listen: false).getWhoLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<ProfileViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Профиль'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ListTile(
                    onTap: () => Navigator.pushNamed(context, '/myCourse',
                        arguments: user.userData),
                    tileColor: Colors.grey[200],
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    title: const Text('Мои курсы'),
                    trailing: const Icon(Icons.chevron_right_outlined),
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    onTap: () => Navigator.pushNamed(context, '/faq'),
                    tileColor: Colors.grey[200],
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    title: const Text('FAQ'),
                    trailing: const Icon(Icons.chevron_right_outlined),
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    onTap: () {
                      String? encodeQueryParameters(
                          Map<String, String> params) {
                        return params.entries
                            .map((e) =>
                                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                            .join('&');
                      }

                      final Uri emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: 'online@edutiv.com',
                        query: encodeQueryParameters(<String, String>{
                          'subject': 'Tell us to improve edutiv services!'
                        }),
                      );

                      launchUrl(emailLaunchUri);
                    },
                    tileColor: Colors.grey[200],
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    // leading: const Icon(Icons.mail),
                    title: const Text('Support'),
                    trailing: const Icon(Icons.chevron_right_outlined),
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    onTap: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.remove('token');
                      await prefs.setBool('isLoggedIn', false);
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/',
                        (route) => false,
                      );
                      print(prefs.getString('token'));
                    },
                    tileColor: Colors.grey[200],
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    leading: const Icon(Icons.logout_outlined),
                    title: const Text('Выйти'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // var user = Provider.of<ProfileViewModel>(context);
    return Container(
      color: Theme.of(context).primaryColor,
      width: double.infinity,
      height: 200,
      child: Consumer<ProfileViewModel>(
        builder: (context, user, child) {
          if (user.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: CircleAvatar(
                  backgroundColor: Colors.grey[400],
                  radius: 50,
                  child: CircleAvatar(
                    radius: 45,
                    backgroundImage: NetworkImage(user.userData.avatar!),
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                flex: 1,
                child: Text(
                  '${user.userData.firstname!} ${user.userData.lastname!}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Text(
                  user.userData.specialization?.categoryName ??
                      'No Specialization',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
