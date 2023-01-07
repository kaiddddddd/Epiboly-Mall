import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import 'my_cahenetwork_image.dart';

class HeadSwiper extends StatefulWidget {
  final List<String> bannerList;

  const HeadSwiper({Key? key, required this.bannerList}) : super(key: key);

  @override
  _HeadSwiperState createState() => _HeadSwiperState();
}

class _HeadSwiperState extends State<HeadSwiper> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135.0 + 30,
      child: Swiper(
        autoplay: true,
        autoplayDelay: 4000,
        duration: 750,
        itemBuilder: (BuildContext context, int index) {
          bool isLocal = widget.bannerList[index].startsWith('assets');
          return Container(
            height: 135,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: isLocal
                  ? Image.asset(widget.bannerList[index])
                  : MyCachedNetworkImage(
                      imageurl: widget.bannerList[index],
                    ),
            ),
          );
        },
        itemCount: widget.bannerList.length,
      ),
    );
  }
}
