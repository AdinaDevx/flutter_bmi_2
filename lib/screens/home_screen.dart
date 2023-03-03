import 'package:flutter/material.dart';
import 'package:flutter_bmi_2/constans/colors/app_colors.dart';
import 'package:flutter_bmi_2/constans/text_styles/app_text_styles.dart';
import 'package:flutter_bmi_2/screens/result_screen.dart';
import 'package:flutter_bmi_2/widgets/calculate_widget.dart';
import 'package:flutter_bmi_2/widgets/gender_Container_Widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bmi_2/widgets/weight_age_widget.dart';

Color activeColor = AppColors.grey;
Color inactiveColor = AppColors.mainColor;

enum Gender {
  male,
  female,
}

class Mashina {
  String bir = 'Lexus';
  String eki = 'Audi';
  String uch = 'Toyota';
  String tort = 'Hyndai';
}

enum Mashine {
  toyota,
  lexus,
  audi,
  hyndai,
  janibek,
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  double currentHeightState = 60;
  int weight = 65;
  int age = 30;

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("My title"),
      content: const Text("This is my message."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  ageFunction(String ageMP) {
    if (ageMP == '-') {
      age--;
    }
    if (ageMP == '+') {
      age++;
    }
    setState(() {});
  }

  Color maleSelected = inactiveColor;
  Color femaleSelected = inactiveColor;

  void enumMaleFemale(Gender gender) {
    if (gender == Gender.male) {
      maleSelected = activeColor;
      femaleSelected = inactiveColor;
    } else if (gender == Gender.female) {
      femaleSelected = activeColor;
      maleSelected = inactiveColor;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColors.secondaryColor,
          title: const Center(
            child: Text(
              'Bmi Calculator',
              style: AppTextStyles.white22w500,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GenderContainerWidget(
                  onTap: () => enumMaleFemale(Gender.male),
                  icons: FontAwesomeIcons.mars,
                  genderText: 'Male',
                  horizontal: 40,
                  vertical: 40,
                  colors: maleSelected,
                ),
                GenderContainerWidget(
                  onTap: () => enumMaleFemale(Gender.female),
                  horizontal: 30,
                  vertical: 40,
                  icons: FontAwesomeIcons.venus,
                  genderText: 'FeMale',
                  colors: femaleSelected,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff0B0120),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      Text(
                        'Height'.toUpperCase(),
                        style: AppTextStyles.white25w500,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(currentHeightState.toStringAsFixed(0),
                              style: AppTextStyles.white55w800),
                          Text(
                            'cm',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.8),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        activeColor: Colors.white,
                        inactiveColor: Colors.grey,
                        thumbColor: Colors.amber,
                        value: currentHeightState,
                        onChanged: (double userValue) {
                          setState(() {});
                          currentHeightState = userValue;
                        },
                        max: 220,
                        min: 0,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                WeightAgeWidget(
                  heroTag2: 'tag3',
                  heroTag1: 'tag4',
                  label: 'Weight',
                  middleText: '$weight',
                  onPressedMinus: () {
                    setState(() {
                      weight--;
                    });
                  },
                  onPressedPlus: () {
                    setState(() {
                      weight++;
                    });
                  },
                ),
                WeightAgeWidget(
                  heroTag2: 'tag1',
                  heroTag1: 'tag2',
                  label: 'Age',
                  middleText: '$age',
                  onPressedMinus: () {
                    ageFunction('-');
                  },
                  onPressedPlus: () => ageFunction('+'),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: CalculateWidget(
          labal: 'CalCulaTe',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ResultScreen(height: currentHeightState, weight: weight),
              ),
            );
          },
        ),
      ),
    );
  }
}
