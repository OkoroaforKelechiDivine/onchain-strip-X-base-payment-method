
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/widgets/app_text.dart';

class ScreenButton extends StatelessWidget {
  final String digit;
  final Function() onPressed;
  const ScreenButton({Key? key, required this.digit, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        
        decoration: BoxDecoration(
         //  color: Colors.yellow,
          borderRadius: BorderRadius.circular(15.0),
          //color: Colors.grey.shade200,
        ),
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
        //height: MediaQuery.of(context).size.height * 0.1 * 0.9,
        child: AppText(
          digit,
          fontSize: 25,
          alignment: TextAlign.center,
          color: Colors.black,
        ),
      ),
    );
  }
}

class EmptyScreenButton extends StatelessWidget {
  const EmptyScreenButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        // color: Colors.yellow,
        borderRadius: BorderRadius.circular(15.0),
        //color: Colors.white,
      ),
      margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      //height: MediaQuery.of(context).size.height * 0.1 * 0.9,
    );
  }
}

class BackSpaceButton extends StatelessWidget {
  final Function() onPressed;
  const BackSpaceButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
           //color: Colors.yellow,
          borderRadius: BorderRadius.circular(15.0),
          //color: Colors.grey.shade200,
        ),
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
        //height: MediaQuery.of(context).size.height * 0.1 * 0.9,
        child: SvgPicture.asset(
          AppAssets.backSpace,
          height: 30,
          fit: BoxFit.none,
          width: 30,
          color: Colors.black,
        ),
      ),
    );
  }
}