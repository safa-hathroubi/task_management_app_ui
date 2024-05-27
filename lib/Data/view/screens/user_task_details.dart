import 'package:flutter/material.dart';
import 'package:task_management/Data/view/Components/custom_components/gradientButton.dart';
import 'package:task_management/Data/view/Components/custom_components/task_field.dart';
import 'package:task_management/Data/view/Components/themes/colors.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class UserTaskDetails extends StatelessWidget {
  const UserTaskDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, right: 8, left: 8),
            child: Column(
              children: [
                Row(
                  children: [IconButton(
            // Use the MdiIcons class for the IconData
            icon: new Icon(MdiIcons.arrowLeft),
              onPressed: () { print('Using the sword');
              // Use Navigator.pop to go back to the previous screen
              Navigator.pop(context);}
          ),
                    SizedBox(width: screenWidth/6,),
                    const Text(
                      'Task Details',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20, width: 200),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: FigmaPalette.lightGrey,
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [SizedBox(width: screenWidth/6,),

                            const Text(
                              "Task1",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircularPercentIndicator(
                                radius: 30.0,
                                lineWidth: 3.0,
                                percent: 1.0,
                                center: Text("40%"),
                                progressColor: Colors.blue,
                                backgroundColor: Colors.grey,
                              ),/*CircularProgressIndicator(
                                value: 0.3,
                                color: Colors.blueAccent,
                                backgroundColor: FigmaPalette.grey,
                              ),*/
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        const TaskField(hintText: "File attachment", labelText: "Field 1", iconName: "\u{e226}") ,
                        SizedBox(height: 20),
                        TaskField(hintText: "File attachment", labelText: "Field 1", iconName: "\u{e226}") ,
                        //LoginField(hintText: "File attachment", labelText: "Field 1"),
                        SizedBox(height: 100),
                        GradientButton(gotoRoute: '/userdashboard', buttonText: 'Report problem'),
                        GradientButton(gotoRoute: '/userdashboard', buttonText: 'Submit'),
                        SizedBox(height: 10),
                      ],
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
