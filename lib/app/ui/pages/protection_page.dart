import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/resources.dart';
import '../theme/app_colors.dart';

class ProtectionPage extends StatelessWidget {
  final bool value = false;
  const ProtectionPage({
    Key? key,
  }) : super(key: key);

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      barrierColor: Colors.black38,
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text(
            'Who touched my phone & WTMP Would Like to Access the Camera'),
        content: const Text(
            'We need access to catch everyone who tries to unlock your phone!'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Don’t Allow'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: false,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 137.0, bottom: 40.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: AppColors.bordres),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  child: Row(
                    children: <Widget>[
                      SvgPicture.asset(Svgs.unlockphone),
                      const SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Text(
                            'Unlocking sound',
                            style:
                                TextStyle(fontSize: 17.0, color: Colors.white),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            'Tap to change alarm sound',
                            style: TextStyle(
                                fontSize: 11.0, color: AppColors.bordres),
                          ),
                        ],
                      ),
                      const Spacer(),
                      CupertinoSwitch(
                        value: value,
                        onChanged: (value) => _showAlertDialog(context),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                width: 240.0,
                height: 240.0,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    AppColors.fontgradientF,
                    AppColors.fontgradientN,
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(150.0),
                  border: Border.all(color: AppColors.bordres),
                ),
                child: const Center(
                  child: Text('Turn ON Protection'),
                ),
              ),
              onTap: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AlarmSoundScreen(),
                  ),
                );
              }),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 40.0, bottom: 10.0),
              child: Text(
                'Protection is off',
                style: TextStyle(fontSize: 17.0, color: Colors.red),
              ),
            ),
            const Text(
              'App will take a photo when someone tries to unlock your phone ',
              style: TextStyle(fontSize: 17.0, color: AppColors.bordres),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class AlarmSoundScreen extends StatelessWidget {
  const AlarmSoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ElevatedButton.icon(
                        onPressed: (() {
                          Navigator.pop(context);
                        }),
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: AppColors.bordres,
                        ),
                        label: Text(
                          'Back',
                          style: TextStyle(
                            color: AppColors.bordres,
                            fontSize: 15.0,
                          ),
                        ),
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.appBgmini),
                        ),
                      ),
                      SizedBox(),
                    ],
                  ),
                  SizedBox(height: 50.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: SvgPicture.asset(Svgs.phonecallbig),
                  ),
                  Text(
                    'Alarm sounds',
                    style: TextStyle(fontSize: 24.0, color: Colors.white),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Raising the alarm when somebody\n             unlocks your phone',
                    style: TextStyle(fontSize: 17.0, color: AppColors.bordres),
                  ),
                ],
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.appBgmini,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        'My Audios',
                        style:
                            TextStyle(fontSize: 17.0, color: AppColors.bordres),
                      ),
                    ),
                    MyAudiosPage(
                      name: 'morgen',
                    ),
                    SizedBox(height: 10.0),
                    MyAudiosPage(
                      name: 'filename',
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        'Default',
                        style:
                            TextStyle(fontSize: 17.0, color: AppColors.bordres),
                      ),
                    ),
                    SoundsButtonWidget(
                      name: 'Police Alarm',
                    ),
                    SizedBox(height: 10.0),
                    SoundsButtonWidget(
                      name: 'Wind',
                    ),
                    SizedBox(height: 10.0),
                    SoundsButtonWidget(
                      name: 'Ding-Dong',
                    ),
                    SizedBox(height: 10.0),
                    SoundsButtonWidget(
                      name: 'stop right there',
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: AppColors.howtoadded,
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'How to add an alarm?',
                          style: TextStyle(
                            color: AppColors.howtoaddedcolor,
                            fontSize: 17.0,
                          ),
                        ),
                        Icon(
                          Icons.close,
                          color: AppColors.howtoaddedcolor,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: <Widget>[
                        Column(
                          children: [
                            SvgPicture.asset(
                              Svgs.bigrecordicon,
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Audio file',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        GestureDetector(
                          child: Column(
                            children: [
                              SvgPicture.asset(Svgs.microfoneicon),
                              SizedBox(height: 10.0),
                              Text(
                                'Record',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                ),
                              ),
                            ],
                          ),
                          onTap: (() {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CupertinoAlertDialog(
                                  content: Text(
                                      'Who touched my phone & WTMP Would Like to Access the microphone'),
                                  title: Text(
                                      'We need access to let you record your alarms.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Don’t Allow',
                                        style: TextStyle(fontSize: 17.0),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                RecordAnAlarm(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Ok',
                                        style: TextStyle(fontSize: 17.0),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: SvgPicture.asset(Svgs.addrecordicon),
      ),
    );
  }
}

class MyAudiosPage extends StatelessWidget {
  final String name;
  const MyAudiosPage({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: AppColors.bordres),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 14.4),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset(Svgs.recordedicon),
                  SizedBox(width: 10.0),
                  Text(
                    name,
                    style: TextStyle(fontSize: 17.0, color: Colors.white),
                  ),
                  Spacer(),
                  const Icon(
                    Icons.currency_yen_sharp,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 15.0),
        Expanded(
          child: Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: AppColors.bordres),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                Svgs.trashfullicon,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SoundsButtonWidget extends StatelessWidget {
  final String name;
  const SoundsButtonWidget({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: AppColors.bordres),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Row(
          children: <Widget>[
            SvgPicture.asset(Svgs.unlockphone),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(fontSize: 17.0, color: Colors.white),
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.currency_yen_sharp),
          ],
        ),
      ),
    );
  }
}

class RecordAnAlarm extends StatelessWidget {
  const RecordAnAlarm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: AppColors.bordres,
                  ),
                  label: const Text(
                    'Back',
                    style: TextStyle(
                      color: AppColors.bordres,
                      fontSize: 15.0,
                    ),
                  ),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.scaffoldBg),
                  ),
                ),
                const SizedBox(),
              ],
            ),
            Column(
              children: const <Widget>[
                Text(
                  'Record an alarm',
                  style: TextStyle(fontSize: 24.0, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.0),
                Text(
                  'Press the button and record the sound.\n             It will be used as alarm.',
                  style: TextStyle(fontSize: 17.0, color: AppColors.howtoadded),
                ),
              ],
            ),
            const SizedBox(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {},
        child: SvgPicture.asset(Svgs.buttonrecordbig),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
