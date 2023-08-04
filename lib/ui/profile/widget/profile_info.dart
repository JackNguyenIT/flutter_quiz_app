import 'package:flutter/material.dart';
import 'package:quiz_app/resource/theme/colors.dart';
import 'package:quiz_app/router/route_page.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
    required this.name,
    required this.email,
    required this.image,
  });

  final String name, email, image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: 250,
              decoration:
                  const BoxDecoration(gradient: QAColors.backgroundTopProfile),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                _buildAvatar(context),
                Text(name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 22.0,
                          color: Colors.white,
                        )),
                const SizedBox(height: 5.0),
                Text(email,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                        )),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildAvatar(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(PROFILE_EDIT_PATH);
      },
      child: Stack(children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10.0),
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 4,
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(image),
            ),
          ),
        ),
        Positioned(
            bottom: 10,
            right: 0,
            child: Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: QAColors.white,
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(8.0))),
              child: const Icon(
                Icons.edit,
                size: 16.0,
                color: QAColors.white,
              ),
            ))
      ]),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
