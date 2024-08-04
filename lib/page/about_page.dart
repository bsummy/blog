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
                  fontSize: 22,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(

                  style: TextStyle(
                    fontFamily: 'Lora',
                    fontSize: 18,
                  ),
                  children: [
                    TextSpan(
                      text:
                          """Aspiring full-stack software engineer studying at McGill University in Montreal. Loves hockey, F1, reading, cooking, and wool socks.\n\n""",
                    ),
                    TextSpan(
                      text: """McGill University '25: """,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          """B.A. in Software Engineering with a Minor in Political Science\n\n""",
                    ),
                    TextSpan(
                      text: """June - August '24: """,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          """Boston Red Sox - Baseball Research and Development, Baseball Systems Intern\n\n""",
                    ),
                    TextSpan(
                      text: """January - August '23: """,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          """Chicago Blackhawks - Hockey Strategy and Analytics, Hockey Systems Intern\n\n""",
                    ),
                    TextSpan(
                      text: """June - August '22: """,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          """Chicago Blackhawks - Business Strategy and Analytics,  Data Intern""",
                    ),
                  ],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 83, 198, 114),
                    shadowColor: Colors.black,
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
