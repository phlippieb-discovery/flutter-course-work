import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'centered_vertical_icon_and_text.dart';
import 'input_card.dart';
import 'calc.dart';
import 'gender.dart';

int height = 170;
int weight = 70;
int age = 20;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Top row
          Expanded(
            child: Row(
              children: [
                // Left item (male)
                InputCard(
                  cardColor: selectedGender == Gender.male
                      ? k.selectedCardColor
                      : k.inputCardColor,
                  cardChild: CenteredVerticalIconAndText(
                      FontAwesomeIcons.mars, "MALE"),
                  onTap: () => setState(() {
                    selectedGender = Gender.male;
                  }),
                ),
                // Right item (female)
                InputCard(
                  cardColor: selectedGender == Gender.female
                      ? k.selectedCardColor
                      : k.inputCardColor,
                  cardChild: CenteredVerticalIconAndText(
                    FontAwesomeIcons.venus,
                    "FEMALE",
                  ),
                  onTap: () => setState(() {
                    selectedGender = Gender.female;
                  }),
                ),
              ],
            ),
          ),
          // Middle card
          InputCard(
            cardColor: k.inputCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("HEIGHT"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: k.bigTextStyle,
                    ),
                    Text("cm"),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      activeTrackColor: k.bottomContainerColor,
                      inactiveTrackColor: k.selectedCardColor,
                      thumbColor: k.bottomContainerColor,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 12,
                      ),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 24)),
                  child: Slider(
                    value: height.toDouble(),
                    min: 100,
                    max: 220,
                    onChanged: (newHeight) {
                      setState(() {
                        height = newHeight.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          // Bottom row
          Expanded(
            child: Row(
              children: [
                InputCard(
                  cardColor: k.inputCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("WEIGHT"),
                      Text(
                        weight.toString(),
                        style: k.bigTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight = (weight > 0) ? weight - 1 : 0;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                InputCard(
                  cardColor: k.inputCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("AGE"),
                      Text(
                        age.toString(),
                        style: k.bigTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age = (age > 0) ? age - 1 : 0;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Bottom container
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            height: height,
                            weight: weight,
                          )));
            },
            child: Container(
              color: k.bottomContainerColor,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: k.bottomContainerHeight,
              child: Center(
                child: Text(
                  "CALCULATE",
                  style: k.bigTextStyle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Gender selectedGender = Gender.male;
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 55, height: 55),
      fillColor: Color(0xff4c4f5e),
    );
  }
}
