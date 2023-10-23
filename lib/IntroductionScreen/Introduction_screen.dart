import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream11_pw/Constant/Button/rectangleButton.dart';
import 'package:dream11_pw/Constant/images.dart';
import 'package:dream11_pw/Utils/utils.dart';
import '../Auth/login_page.dart';


class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  int _backButtonPressCounter = 0;
  @override
  Widget build(BuildContext context) {
    final heights=MediaQuery.of(context).size.height;
    final widths=MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        if (_backButtonPressCounter == 0) {
          Utils.showToast("Press again to exit");
          _backButtonPressCounter++;
          return false;
        } else {
          SystemNavigator.pop();
          // Exit the app on the second back button press
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
       body:Column(
         children: [
           Container(
             height: heights/4,
               width: widths/4,
             decoration: const BoxDecoration(
               image: DecorationImage(image: ((AssetImage(imagesTeam11)))),
             ),
           ),
           Column(
             children: [
               CarouselSlider(
                 items: imgList
                     .map((item) => Container(

                   decoration: BoxDecoration(
                     image: DecorationImage(
                       fit: BoxFit.fill,
                       image: AssetImage(item)
                     )
                   ),
                 ))
                     .toList(),
                 carouselController: _controller,
                 options: CarouselOptions(
                     height: heights/2.5,
                     aspectRatio: 5/1,
                     viewportFraction: 0.9,
                     initialPage: 0,
                     enableInfiniteScroll: true,
                     reverse: false,
                     autoPlay: true,
                     autoPlayInterval: const Duration(seconds: 3),
                     autoPlayAnimationDuration: const Duration(milliseconds: 800),
                     autoPlayCurve: Curves.fastOutSlowIn,
                     enlargeCenterPage: true,
                     enlargeFactor: 0.3,
                     scrollDirection: Axis.horizontal,
                     // enlargeCenterPage: true,
                     onPageChanged: (index, reason) {
                       setState(() {
                         _current = index;
                       });
                     }),
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: imgList.asMap().entries.map((entry) {
                   return GestureDetector(
                     onTap: () => _controller.animateToPage(entry.key),
                     child: Container(
                       width: widths/50,
                       height: heights/50,
                       margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                       decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           color: (Theme.of(context).brightness == Brightness.dark
                               ? Colors.white
                               : Colors.black)
                               .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                     ),
                   );
                 })
                     .toList(),
               ),
             SizedBox(
               height: heights/60,
             ),
             Text('Dream11.PW',style: TextStyle(fontWeight: FontWeight.bold,fontSize: heights/25),),
               SizedBox(
                 height: heights/20,
               ),
             CustomButton(onTap: ()
                 {
                   Navigator.push(context,MaterialPageRoute(builder: (context)=>const LoginScreen()) );
                 }, text: 'Login With Phone')
             ],
           )
         ],
       )
      ),
    );
  }
}

final List<String> imgList = [
  imagesSlide1,
  imagesSlide2,
  imagesSlide3
];
