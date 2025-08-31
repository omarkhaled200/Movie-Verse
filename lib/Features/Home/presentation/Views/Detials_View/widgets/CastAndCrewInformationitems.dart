import 'package:flutter/material.dart';
import 'package:movie_verse/Core/utlis/assets.dart';

class CastAndCrewInformationitems extends StatelessWidget {
  const CastAndCrewInformationitems({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;

    return SizedBox(
      height: height * 0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: SizedBox(
              height: height * 0.2,
              child: Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      width: width * 0.6,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        color: Colors.grey[900],
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Omar Khaled',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -10,
                      left: -15,
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.black54,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(Assets.loginimage),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
