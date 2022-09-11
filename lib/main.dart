import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentSteps = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stepper'),
      ),
      body: Center(
        child: Stepper(
          type: StepperType.horizontal,
          currentStep: currentSteps,
          onStepTapped: (index){
            setState(() {
              currentSteps = index;
            });
          },
          onStepContinue: (){
            if(currentSteps != 2){
              setState(() {
                currentSteps++;
              });
            }
          },
          onStepCancel: (){
            if(currentSteps !=0){
              setState(() {
                currentSteps--;
              });
            }
          },
          steps:  [
            Step(
              isActive: currentSteps >= 0,
                title: const Text('Step 1'),
                content: const Text('content for step 1')
            ),
            Step(
                isActive: currentSteps >= 1,
                title: const Text('Step 2'),
                content: const Text('content for step 2')
            ),
            Step(
                isActive: currentSteps >= 2,
                title: const Text('Step 3'),
                content: const Text('content for step 3')
            ),


          ],

        ),


      ),
    );
  }
}
