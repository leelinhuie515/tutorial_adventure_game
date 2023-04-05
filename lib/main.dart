import 'package:flutter/material.dart';
import 'story_brain.dart';
import 'package:glitcheffect/glitcheffect.dart';

//TODO: Step 15 - Run the app and see if you can see the screen update with the first story. Delete this TODO if it looks as you expected.

void main() => runApp(AdventureGame());

class AdventureGame extends StatelessWidget {
  const AdventureGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(), // we are using the dark theme
      home: StoryPage(),
    );
  }
}

//TODO: Step 9 - Create a new storyBrain object from the StoryBrain class.
StoryBrain storybrain = StoryBrain();

class StoryPage extends StatefulWidget {
  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        body: GlitchEffect(
          duration:Duration(seconds: 8),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/night.jpg'),
                fit: BoxFit.cover,
              ),
            ),
        //TODO: Step 1 - Find a background image, add the background image into the images directory, then add the background image to this Container.
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
          child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                      child: Text(
                          'Midnight Thriller',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 5.0,
                              fontFamily: 'DeliciousHandrawn'
                          ),
                      ),
                  ),
                  Expanded(
                    flex: 12,
                    child: Center(
                      child: Text(
                        //TODO: Step 10 - use the storyBrain to get the first story title and display it in this Text Widget.
                        storybrain.getStory(),
                        style: TextStyle(
                          fontSize: 25.0,
                          fontFamily: 'IndieFlower',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextButton(
                      onPressed: () {
                        // Choice 1 made by user
                        setState(() {
                          storybrain.nextStory(1);
                        });
                        //TODO: Step 18 - Call the nextStory() method from storyBrain and pass the number 1 as the choice made by the user.
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.blueGrey),
                        foregroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.white),
                        shape: MaterialStateProperty.resolveWith(
                                (states) => RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                        ),
                      ),
                      child: Text(
                        //TODO: Step 13 - Use the storyBrain to get the text for choice 1.
                        storybrain.getChoice1(),
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    flex: 2,
                    child: Visibility(
                      visible: storybrain.buttonShouldBeVisible(),
                      //TODO: Step 26 - Use a Flutter Visibility Widget to wrap this TextButton.
                      //TODO: Step 28 - Set the "visible" property of the Visibility Widget to equal the output from the buttonShouldBeVisible() method in the storyBrain.
                        child: TextButton(
                          onPressed: () {
                            // Choice 2 made by user
                            setState(() {
                              storybrain.nextStory(2);
                            });
                            //TODO: Step 19 - Call the nextStory() method from storyBrain and pass the number 2 as the choice made by the user.
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                    (states) => Colors.blueGrey[900]),
                            foregroundColor: MaterialStateProperty.resolveWith(
                                    (states) => Colors.white),
                            shape: MaterialStateProperty.resolveWith(
                                  (states) => RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          child: Text(
                            //TODO: Step 14 - Use the storyBrain to get the text for choice 2.
                            storybrain.getChoice2(),
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}

//TODO: Step 24 - Run the app and try to figure out what code you need to add to this file to make the story change when you press on the choice buttons.

//TODO: Step 29 - Run the app and test it against the Story Outline to make sure you've completed all the steps.
