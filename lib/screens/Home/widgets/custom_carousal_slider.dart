
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../core/widgets/custom_default_button.dart';
import '../data/ads_seeder.dart';

class CustomCarouselSlider extends StatefulWidget {
   const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  /*final List<String> images = [
    'https://th.bing.com/th/id/R.5cd2112102cf223debd9dc2a08a93f3a?rik=dpwvOrpX1Pk3Lw&pid=ImgRaw&r=0',
    'https://peaseandcurren.com/wp-content/uploads/2020/03/Retail-and-online-shopping-1536x1024.jpg',
    'https://th.bing.com/th/id/OIP.H52yMR1vLXs7ygOqMOfwPwHaE_?w=1039&h=700&rs=1&pid=ImgDetMain',
    'https://myareanetwork-photos.s3.amazonaws.com/editorphotos/f/41826_1605057062.jpg?1620308603',
  ];*/
  @override
  void initState() {
    getData();
    super.initState();
  }
  void getData()async{
   await AdsSeeder.getAds();
   setState(() {});
  }
  final List<Color> color = [Colors.red,Colors.black,
    Colors.yellow,Colors.cyan];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(AdsSeeder.ads.length,
              (index){
            return Container(
              height: 200,
              width: double.infinity,
              padding:const EdgeInsets.all(10) ,
              decoration: BoxDecoration(
                color:color[index],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AdsSeeder.ads[index].title!,
                        maxLines: 3,
                        style:Theme.of(context).textTheme.labelMedium,
                        ),
                        const SizedBox(height: 10),
                        CustomSmallButton(
                          text: 'SEE MORE',
                          height: 43,
                          width:130 ,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Image.network(AdsSeeder.ads[index].imagePath!,
                      height: 170,
                      fit: BoxFit.fill,
                      errorBuilder:(context,_,error){
                      return const SizedBox();
                      } ,
                    ),
                  ),
                ],
              ),
            );
          }),
      options:CarouselOptions(
        height: 200,
        viewportFraction: 1,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
      ),
    );
  }
}
