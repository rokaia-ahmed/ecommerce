
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/custom_default_button.dart';

class CustomCarouselSlider extends StatefulWidget {
   const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  @override
  void initState() {
    Provider.of<HomeProvider>(context,listen: false).getAds();
    super.initState();
  }
  final List<Color> color = [Colors.red,Colors.black,
    Colors.yellow,Colors.cyan];

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (BuildContext context,homeProvider, child) {
        return
        CarouselSlider(
          items: List.generate(homeProvider.adsList.length,
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
                            Text(homeProvider.adsList[index].title!,
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
                        child: Image.network(homeProvider.adsList[index].imagePath!,
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
      },
    );
  }
}
