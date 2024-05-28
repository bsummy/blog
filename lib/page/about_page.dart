import 'package:flutter/material.dart';
import '../misc/nav_bar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: NavBar(),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('../../assets/profile.jpeg'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'I am a software developer who enjoys creating applications that are both functional and visually appealing. I have experience with a variety of programming languages and frameworks, including Python, Java, and Flutter. I am always looking for new opportunities to learn and grow as a developer.',
                  style: TextStyle(
                    fontFamily: 'Lora',
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Contact Me',
                  style: TextStyle(
                    fontFamily: 'Lora',
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Email: bennettsummy@gmail.com',
                  style: TextStyle(
                    fontFamily: 'Lora',
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
