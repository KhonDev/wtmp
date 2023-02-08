import 'package:flutter/material.dart';
import 'package:wtmp2/resources/resources.dart';

import '../tab_bar_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const Text(
                  'Enter password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 29.0,
                  ),
                ),
                const SizedBox(height: 150.0),
                const Text(
                  'Type your password\n to access the app',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 90.0, vertical: 30.0),
                  child: TextField(
                    maxLength: 4,
                    style: const TextStyle(color: Colors.white),
                    enabled: true,
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye_outlined),
                  label: const Text('Show password'),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TabBarScreen()),
                    );
                  },
                  child: const Image(
                    image: AssetImage(Images.continuebutton),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
