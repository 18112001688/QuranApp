import 'package:Qurane_app/Features/home/presentation/manager/Them/them_cubit.dart';
import 'package:Qurane_app/Features/home/widget/contact_devolper_button.dart';
import 'package:Qurane_app/core/constant/constent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrwer extends StatelessWidget {
  const CustomDrwer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : const Color(0xff180B37),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? primaryColor
                  : const Color(0xff180B37),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "يَا أَيُّهَا الَّذِينَ آمَنُوا إِذَا لَقِيتُمْ فِئَةً فَاثْبُتُوا وَاذْكُرُوا اللَّهَ كَثِيرًا لَعَلَّكُمْ تُفْلِحُونَ",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'me_quran',
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'السبحة',
              style: TextStyle(
                fontFamily: 'me_quran',
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            onTap: () {
              GoRouter.of(context).push('/SephaView');
            },
          ),
          SwitchListTile(
            title: const Text(
              'الوضع الليلي',
              style: TextStyle(
                fontFamily: 'me_quran',
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            value: context.watch<ThemeCubit>().state == ThemeState.dark,
            onChanged: (value) {
              BlocProvider.of<ThemeCubit>(context).toggleTheme();
            },
            secondary: Icon(
                context.watch<ThemeCubit>().state == ThemeState.dark
                    ? Icons.brightness_2 // Icon for dark mode
                    : Icons.wb_sunny, // Icon for light mode
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.amber
                    : primaryColor),
          ),
          const SizedBox(
            height: 380,
          ),
          ListTile(
            title: const Text(
              'أتصل بالمطور',
              style: TextStyle(
                fontFamily: 'me_quran',
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Contact Developer'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: [
                          ContactDevlperButton(
                            buttonColor:
                                Theme.of(context).brightness == Brightness.light
                                    ? primaryColor
                                    : const Color(0xff180B37),
                            color: Colors.white,
                            onPressed: (() {
                              _launchUrl(
                                  'https://www.facebook.com/profile.php?id=100008992934539');
                            }),
                            text: 'via Facebook',
                          ),
                          ContactDevlperButton(
                            onPressed: () {
                              _launchEmail('mousatfasaper167@gmail.com');
                            },
                            buttonColor:
                                Theme.of(context).brightness == Brightness.light
                                    ? primaryColor
                                    : const Color(0xff180B37),
                            color: Colors.white,
                            text: 'via Email',
                          ),
                          ContactDevlperButton(
                            buttonColor:
                                Theme.of(context).brightness == Brightness.light
                                    ? primaryColor
                                    : const Color(0xff180B37),
                            color: Colors.white,
                            onPressed: (() {
                              _launchUrl(
                                  'https://www.linkedin.com/in/moustafa-mahmoud-45a7b4204/');
                            }),
                            text: 'via LinkedIn',
                          ),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text(
                          'Close',
                          style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? primaryColor
                                  : Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}

Future<void> _launchUrl(url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}

Future<void> _launchEmail(String email) async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: email, // Replace with your email address
    queryParameters: {
      'subject': 'Your Subject Here', // Specify the email subject
      'body': 'Hello,\n\n', // Specify the email body (initial content)
    },
  );

  if (!await launchUrl(emailLaunchUri)) {
    throw Exception('Could not launch email');
  }
  await launchUrl(emailLaunchUri);
}
