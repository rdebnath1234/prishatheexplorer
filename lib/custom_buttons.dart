import 'package:flutter/material.dart';
import 'constants.dart';

class RoundedSocialButton extends StatelessWidget {
  final String imagePath;
  final Function()? onPressed;

  const RoundedSocialButton({super.key,required this.imagePath, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Image.asset(
            imagePath,
            width: 40,
            height: 40,
          ),
        ),
      ),
    );
  }
}
class DefaultButton extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final IconData iconData;
  const DefaultButton({super.key, required this.onPress,required this.title,required this.iconData});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding,
        ),
        padding: EdgeInsets.only(right: kDefaultPadding),
        width: double.infinity,
        height: 60.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [kSecondaryColor,kPrimaryColor],
            begin: FractionalOffset(0.0,0.0),
            end: FractionalOffset(0.0,0.0),
            stops: [0.0,1.0],
            tileMode: TileMode.clamp,
          ),
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text('Log IN',
              style:
              TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
                color: kTextLightColor,
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_outlined,
            size: 30.0,
            color: kOtherColor,)
          ],
        ),
      ),
    );
  }
}


