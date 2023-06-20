import 'package:covid_19_ui/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constant.dart';
import '../widgets/info_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  left: 20, top: 20, right: 20, bottom: 20),
              width: MediaQuery.of(context).size.width*1,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.03),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
              ),
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                children: [
                  InfoCard(
                    title: "Confirmed Cases",
                    iconColor: const Color(0xFFFF8C00),
                    effectedNum: 1062,
                    onPress: () {},
                  ),
                  InfoCard(
                    title: "Total Death",
                    iconColor: const Color(0xFFFF2D55),
                    effectedNum: 75,
                    onPress: () {},
                  ),
                  InfoCard(
                    title: "Total Recovered",
                    iconColor: const Color(0xFF50E3C2),
                    effectedNum: 689,
                    onPress: () {},
                  ),
                  InfoCard(
                    title: "New Cases",
                    iconColor: const Color(0xFF5856D6),
                    effectedNum: 52,
                    onPress: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const DetailsScreen();
                      }));
                    },
                  ),
                ],
              ),
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Preventions",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                   SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,
                  ),
                  buildPreventation(),
                   SizedBox(
                    height: MediaQuery.of(context).size.height*0.06,
                  ),
                  Stack(alignment: Alignment.bottomLeft, children: [
                    buildHelpCard(context),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SvgPicture.asset('assets/icons/nurse.svg'),
                    ),
                    Positioned(
                        top: 15,
                        right: 10,
                        child: SvgPicture.asset("assets/icons/virus.svg"))
                  ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildPreventation() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PreventionCard(
          svgSrc: "assets/icons/hand_wash.svg",
          title: "Wash Hands",
        ),
        PreventionCard(
          svgSrc: "assets/icons/use_mask.svg",
          title: "Use Masks",
        ),
        PreventionCard(
          svgSrc: "assets/icons/Clean_Disinfect.svg",
          title: "Clean Disinfect",
        ),
      ],
    );
  }

  Container buildHelpCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * .4,
        top: 20,
        right: 20,
      ),
      height: MediaQuery.of(context).size.height*0.2,
      width: MediaQuery.of(context).size.width*1,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          Color(0xFF60BE93),
          Color(0xFF1B8D59),
        ]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: "Dial 999 for \nMedical Help! \n",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white)),
          TextSpan(
              text: "If any symptoms appear",
              style: TextStyle(color: Colors.white.withOpacity(0.7)))
        ]),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kPrimaryColor.withOpacity(.03),
      leading: IconButton(
          onPressed: () {}, icon: SvgPicture.asset('assets/icons/menu.svg')),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/search.svg"),
        ),
      ],
    );
  }
}

class PreventionCard extends StatelessWidget {
  final String title;
  final String svgSrc;
  const PreventionCard({
    super.key,
    required this.title,
    required this.svgSrc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(svgSrc),
        Text(title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: kPrimaryColor))
      ],
    );
  }
}
