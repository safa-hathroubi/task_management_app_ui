/*import 'package:flutter/material.dart';
import 'package:task_management/Data/view/Components/themes/colors.dart';

import 'dart:io';
import 'package:file_picker/file_picker.dart';

class TaskField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final String iconName;

  const TaskField({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.iconName,
  }) : super(key: key);

  @override
  _TaskFieldState createState() => _TaskFieldState();
}

class _TaskFieldState extends State<TaskField> {
  File? _selectedFile;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }






  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 350,
        maxHeight: 60,
      ),
      child: TextButton(
        onPressed: _pickFile,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(FigmaPalette.lightGrey),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
          ),
        ),
        child: Row(
          children: [
            /*Icon(
              IconData(int.parse(widget.iconName), fontFamily: 'MaterialIcons'),
              color: FigmaPalette.grey,
            ),*/
            const SizedBox(width: 10),
            Text(
              _selectedFile != null ? _selectedFile!.path.split('/').last : widget.hintText,
              style: TextStyle(
                color: _selectedFile != null ? Colors.black : FigmaPalette.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:task_management/Data/view/Components/themes/colors.dart';

import 'dart:io';
import 'package:file_picker/file_picker.dart';

class TaskField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final String iconName;

  const TaskField({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.iconName,
  }) : super(key: key);

  @override
  _TaskFieldState createState() => _TaskFieldState();
}

class _TaskFieldState extends State<TaskField> {
  File? _selectedFile;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    } else {
      setState(() {
        _selectedFile = null; // Set selected file to null when no file is picked
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: screenWidth-40,
        minHeight: 50,
      ),
      child: TextButton(
        onPressed: _pickFile,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(FigmaPalette.lightGrey),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
          ),
          elevation: MaterialStateProperty.all<double>(4.0), // Set the elevation to 4.0 (you can adjust the value as needed)
        ),

        /*ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(FigmaPalette.grey), // Set the background color to grey
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
          ),
        ),*/
        child: Row(
          children: [
        // Use the MdiIcons class for the IconData
        Icon(MdiIcons.attachment),
          //attachment - fileDocument - image
          /* TODO             note: ICON BUTTON:
          IconButton(
            // Use the MdiIcons class for the IconData
              icon: new Icon(MdiIcons.sword),
              onPressed: () { print('Using the sword'); }
          );*/
            /*Icon(
              IconData(int.parse(widget.iconName), fontFamily: 'MaterialIcons'),
              color: FigmaPalette.grey,
            ),*/
            const SizedBox(width: 10),
            Text(
              _selectedFile != null ? _selectedFile!.path.split('/').last : widget.hintText,
              style: TextStyle(
                color: _selectedFile != null ? Colors.black : FigmaPalette.grey,),
            ),
          ],
        ),
/*Row(
          children: [
            /*Icon(
              IconData(int.parse(widget.iconName), fontFamily: 'MaterialIcons'),
              color: FigmaPalette.grey,
            ),*/
            const SizedBox(width: 10),
            Text(
              _selectedFile != null ? _selectedFile!.path.split('/').last : widget.hintText,
              style: TextStyle(
                color: _selectedFile != null ? Colors.black : FigmaPalette.grey,
              ),
            ),
          ],
        ),*/
      ),
    );
  }
}

