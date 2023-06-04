import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive_animation/constants.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.name,
    required this.profession,
  });

  final String name, profession;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white24,
        backgroundImage: FileImage(imageFile!),
      ),
      title: Text(
        name,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        profession,
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey.shade200,
        ),
      ),
    );
  }
}
