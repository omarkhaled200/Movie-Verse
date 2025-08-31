import 'package:flutter/material.dart';
import 'package:movie_verse/Core/utlis/assets.dart';
import 'package:movie_verse/Core/utlis/custom_Container_image.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Detials_View/widgets/CastAndCrewInformationitems.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Detials_View/widgets/CustomArrowback.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Detials_View/widgets/CustomFilmInfoRow.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Detials_View/widgets/CustomFilmNameDesign.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Detials_View/widgets/CustomFilmTypewidget.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Detials_View/widgets/Simillar_Film_Section.dart';

class DetialsViewBody extends StatelessWidget {
  const DetialsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            customcontainerimage(
              height: height,
              image: AssetImage(Assets.rata),
            ),
            Container(color: Colors.black.withOpacity(0.3)),
            Positioned.fill(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 0.35),
                    CustomFilmNameDesign(width: width, height: height),
                    CustomFilmTypewidget(),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: CustomFilmInfoRow(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: const Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                        "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.",
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Cast And Crew',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CastAndCrewInformationitems(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SimillarFilmSection(),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(top: 15, left: 15, child: CustomArrowback()),
          ],
        ),
      ),
    );
  }
}
