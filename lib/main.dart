import 'package:flutter/material.dart';
import 'package:day_6_kismet/story_brain.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData.dark(),
      home: KismetApp(),
    ));

class KismetApp extends StatefulWidget {
  @override
  _KismetAppState createState() => _KismetAppState();
}

// TODO: Step 15 - Run your app and see if it works as expected
class _KismetAppState extends State<KismetApp> {
  // TODO: Step 6 - Create a storyBrain object and use it to get story title, choice1 and choice 2 and show them on the app by using at appropriate locations
  StoryBrain storyBrain = new StoryBrain();

  String title;
  String ch1;
  String ch2;

  void setStory()
  {
    setState(() {
      title = storyBrain.getStory();
      ch1 = storyBrain.getChoice1();
      ch2 = storyBrain.getChoice2();
    });
  }
  @override
  Widget build(BuildContext context) {
    setStory();
    return Scaffold(
      //TODO: Step 1 - Add background.png to this Container as a background image. (Remember to add it to pubspec.yaml)
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    storyBrain.nextStory(1);
                    setStory();
                    //Choice 1 made by user.
                    //TODO: Step 9 - Call the nextStory() method from storyBrain and pass the number 1 as the choice made by the user, do the same for choice2 button and pass number 2 in that case
                  },
                  color: Colors.red,
                  child: Text(
                    ch1,
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
                //TODO: Step 14 - Use a Flutter Visibility Widget to wrap this FlatButton and set the "visible" property of the Visibility Widget to equal the output from the buttonShouldBeVisible() method in the storyBrain.
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: FlatButton(
                    onPressed: () {
                      storyBrain.nextStory(2);
                      setStory();
                      //Choice 2 made by user.
                    },
                    color: Colors.blue,
                    child: Text(
                      ch2,
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
    );
  }
}
