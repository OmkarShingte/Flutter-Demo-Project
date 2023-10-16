import 'package:flutter/material.dart';

extension CustomContainer on Container {
  Container customSocialContainer(
      double width, double height, Color color, String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(child: Image.asset(imagePath)),
      ),
    );
  }
}

class CustomSocialButton extends StatelessWidget {
  final Color color;
  final String imagePath;

  const CustomSocialButton({
    super.key,
    required this.color,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(child: Image.asset(imagePath)),
      ),
    );
  }
}

class CustomBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final int index;
  final IconData icon;
  final String title;

  const CustomBottomNavigation(
      {super.key,
      required this.selectedIndex,
      required this.index,
      required this.icon,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.ac_unit_outlined,size: 20,),
        // Image.asset(
        //   icon,
        //   width: 20,
        //   height: 20,
        //   color: selectedIndex == index ? Colors.white : Colors.black,
        // ),
        Text(
          title,
          style: TextStyle(
              color: selectedIndex == index ? Colors.white : Colors.black),
        )
      ],
    );
  }
}
