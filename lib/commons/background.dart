import 'package:flutter/material.dart';

class Background extends StatelessWidget {
   final String urlImgBackground;
   final Widget widgetBody;
   final double? opacity ;

   const Background({Key? key, required this.urlImgBackground,required this.widgetBody, this.opacity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Stack(
        children: [
          Opacity(
            opacity: opacity ?? 1,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(urlImgBackground, fit: BoxFit.cover,),
            ),
          ),
          Positioned(
              child: SizedBox(
                height: double.infinity,
                  width: double.infinity,
                  child: widgetBody))
        ],
      ),
    );
  }
}
