import 'package:flutter/material.dart';
import 'package:task_management/Data/view/Components/themes/colors.dart';

class ArrowButton extends StatelessWidget {
  final String gotoRoute;
  final String missionTitle;
  final int priorityLevel;
  const ArrowButton({Key? key, required this.gotoRoute, required this.missionTitle, required this.priorityLevel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color arrowButtonColor; // Define a variable to hold the color
    // Set the color based on priorityLevel
    if (priorityLevel == 0) {
      arrowButtonColor = FigmaPalette.transparentRed;
    } else {
      arrowButtonColor = FigmaPalette.lightGrey; // Default color if priorityLevel is not 0
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: FigmaPalette.lightGrey,
          borderRadius: BorderRadius.circular(35),
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/$gotoRoute");
          },
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(350, 45),
              backgroundColor: arrowButtonColor,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar( // TODO: make circle color conditional to the task status (voir figma)
                backgroundColor: FigmaPalette.red,
                maxRadius: 5,
              ),
              Expanded(
                child: Text(
                  "   " + missionTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ),
              //Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
            ],
          ),

        ),
      ),
    );
  }
}

