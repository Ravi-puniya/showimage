import 'package:flutter/material.dart';
import 'package:showimage/Screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(alignment: Alignment.bottomLeft, children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            'images/image_four.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            bottom: size.height * .12,
            left: size.width * .04,
            child: RichText(
              textAlign: TextAlign.left,
              text:const TextSpan(
                text: ' Picture\n ',
                style: TextStyle(fontSize: 25),
                children:  <TextSpan>[
                  TextSpan(
                      text: "The camera is an instrument that \n",
                      style:
                          TextStyle(fontWeight: FontWeight.w100, fontSize: 15)),
                  TextSpan(
                      text: ' teaches people how to see without a camera',
                      style:
                          TextStyle(fontWeight: FontWeight.w100, fontSize: 15)),
                ],
              ),
            )
            //  const Text('Pick Your Image',
            //     style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 30,
            //         fontWeight: FontWeight.w500))
            ),
        const SizedBox(
          height: 5,
        ),
        // Positioned(
        //     bottom: size.height * .12,
        //     left: size.width * .01,
        //     child: const Text("""
        //         The camera is an instrument that
        //         teaches people how to see without a camera.
        //         """,
        //         textAlign: TextAlign.left,
        //         maxLines: 4,
        //         softWrap: true,
        //         overflow: TextOverflow.ellipsis,
        //         style: TextStyle(
        //             color: Colors.white,
        //             fontSize: 15,
        //             fontWeight: FontWeight.w100))),
      ]),
    );
  }
}
