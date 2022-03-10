

import 'dart:convert';
//import 'dart:html';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'colors.dart' as color;

class VedioInfo extends StatefulWidget {
  const VedioInfo({Key? key}) : super(key: key);

  @override
  _VedioInfoState createState() => _VedioInfoState();
}

class _VedioInfoState extends State<VedioInfo> {
  List videoInfo = [];
  bool _playArea=false;
  late VideoPlayerController _controller;
  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/videoinfo.json")
        .then((value) {
     setState(() {
        videoInfo = json.decode(value);
     });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _playArea==false? BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.AppColor.gradientFirst.withOpacity(.9),
              color.AppColor.gradientSecond
            ],
            begin: const FractionalOffset(0, 0.4),
            end: Alignment.topRight,
          ),
        ):BoxDecoration(
          color: color.AppColor.gradientSecond,
        ),
        child: Column(
          children: [
           _playArea==false? Container(
              padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: color.AppColor.secondPageIconColor,
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Icon(
                          Icons.info_outline,
                          size: 20,
                          color: color.AppColor.secondPageIconColor,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Legs Toning',
                      style: TextStyle(
                        fontSize: 21,
                        color: color.AppColor.secondPageTitleColor,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'and glutes Workout',
                      style: TextStyle(
                        fontSize: 21,
                        color: color.AppColor.secondPageTitleColor,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      children: [
                        Container(
                          width: 90,
                          height: 33,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                color.AppColor
                                    .secondPageContainerGradient1stColor,
                                color.AppColor
                                    .secondPageContainerGradient2ndColor
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.timer,
                                size: 16,
                                color: color.AppColor.secondPageIconColor,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '60 min',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: color.AppColor.secondPageTitleColor),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          width: 200,
                          height: 33,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                color.AppColor
                                    .secondPageContainerGradient1stColor,
                                color.AppColor
                                    .secondPageContainerGradient2ndColor
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.handyman_outlined,
                                size: 16,
                                color: color.AppColor.secondPageIconColor,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'Resistent Band, Kettebell',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: color.AppColor.secondPageTitleColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),
            ):SizedBox(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    padding: const EdgeInsets.only(top: 40,left: 30, right: 30),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                            debugPrint("tapped");
                          },
                          child: InkWell(
                             onTap: (){
                                Get.back();
                             },
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 20, 
                              color: color.AppColor.secondPageTopIconColor,
                              ),
                          ),
                        ),
                        Expanded(child: Container()),
                         Icon(Icons.info_outline,
                        size: 20,
                        color: color.AppColor.secondPageTopIconColor,
                        ),
                      ],
                    ),
                  ),
                  _playVeiw(context),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(90),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const SizedBox(width: 23),
                        Text(
                          "Circuit 1 : Legs toning",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: color.AppColor.circuitsColor,
                          ),
                        ),
                        const SizedBox(
                          width: 50
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.loop,
                              size: 30,
                              color: color.AppColor.loopColor,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '3 sets',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: color.AppColor.setsColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                        child:_listVeiw(), ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
 Widget _playVeiw(BuildContext context){
       final controller=_controller;
      // ignore: unnecessary_null_comparison
      if(controller!=null && controller.value.isInitialized){
        return SizedBox(
          height: 300,
          width: 300,
          child: VideoPlayer(controller),
        );
      }else{
       return const Text("being intialized pls wait...");
      }
  }
  _onTapVideo(int index){
      final controller=VideoPlayerController.network(videoInfo[index]["videoUrl"]);
      _controller=controller;
      setState(() {});
      controller.initialize().then((_){
        controller.play();
        setState(() {
          
        }); 
      });
  }
  _listVeiw(){
    return ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                            itemCount: videoInfo.length,
                            itemBuilder: (_, int index) {
                              
                              return GestureDetector(
                                onTap: () {
                                  _onTapVideo(index);
                                  // debugPrint(index.toString());
                                  setState(() {
                                    if(_playArea==false){
                                      _playArea=true;
                                    }
                                  });
                                },
                                child: _buildCard(index),
                              );
                            });
  }
  _buildCard(int index){
      return SizedBox(
                                  height: 135,
                                  //width: 200,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  videoInfo[index]["thumbnail"],
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                videoInfo[index]["title"],
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 3.0),
                                                child: Text(
                                                  videoInfo[index]["time"],
                                                  style: TextStyle(
                                                    color: Colors.grey[500],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 18),
                                      Row(children: [
                                        Container(
                                          height: 24,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFeaeeFC),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: const Text('15s rest',style: TextStyle(
                                            color: Color(0xFF839fed),                                            
                                          ),textAlign: TextAlign.center,),
                                        ),
                                        const SizedBox(width: 3,),
                                        Row(children: [
                                          for(int i=0;i<70;i++)
                                         i.isEven? Container(
                                            height: 1,
                                            width: 3,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(2),
                                              color: const Color(0xFF839fed),
                                            ),
                                          ):Container(
                                           height: 2,
                                            width: 3,
                                            color: Colors.white,
                                          ),
                                        ],),
                                      ],),
                                    ],
                                  ),
                                );
  }

}


