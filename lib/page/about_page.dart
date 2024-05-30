import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/profile.jpeg'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Bennett Summy',
                style: TextStyle(
                  fontFamily: 'Lora',
                  fontSize: 20,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                """
McGill University '25 | B.A. in Software Engineering with a Minor in Political Science

June - August '22: Chicago Blackhawks - Business Strategy and Analytics,  Data Intern

January - August '23: Chicago Blackhawks -  Hockey Strategy and Analytics, Hockey Systems Intern

June - August '24: Boston Red Sox -  Baseball Research and Development, Baseball Systems Intern
                """,
                style: TextStyle(
                  fontFamily: 'Lora',
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 239, 90, 140),
                    shadowColor: Colors.red,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  onPressed: () {
                    _launchURL('https://www.pierreanalytics.com/about');
                  },
                  child: const Text(
                    'Check out more of my work here!',
                    style: TextStyle(
                      fontFamily: 'Lora',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                )),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Contact Me',
                style: TextStyle(
                  fontFamily: 'Lora',
                  fontSize: 20,
                ),
              ),
            ),
            const Text(
              """
Feel free to shoot me an email to chat while I'm on my travels!
Email: bennettsummy@gmail.com
                """,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Lora',
                fontSize: 16,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image.asset(
                    'assets/github_black.png',
                    width: 50,
                    height: 50,
                  ),
                  onPressed: () {
                    _launchURL('https://www.github.com/bsummy');
                  },
                ),
                IconButton(
                  icon: Image.asset(
                    'assets/linkedin_black.png',
                    width: 50,
                    height: 50,
                  ),
                  onPressed: () {
                    _launchURL('https://www.linkedin.com/in/bennett-summy');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}
