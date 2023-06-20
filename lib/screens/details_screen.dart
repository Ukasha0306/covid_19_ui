import 'package:covid_19_ui/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/weekly_chart.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildDetailsAppBar(context),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 21),
                            blurRadius: 53,
                            color: Colors.black.withOpacity(0.05))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTitleWithMoreIcon(),
                      const SizedBox(
                        height: 15,
                      ),
                      buildCaseNumber(context),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "From Health Center",
                        style: TextStyle(
                            color: kTextMediumColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const WeeklyChart(),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildInfoTextWithPercentage(
                            percentage: "6.43",
                            title : "From Last Week",
                          ),
                          buildInfoTextWithPercentage(
                            percentage: "9.43",
                            title : "Recovery Rate",
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 21),
                        blurRadius: 54,
                        color: Colors.black.withOpacity(0.05),

                      ),
                    ]
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Global Map", style: TextStyle(fontSize: 15),
                          ),
                          SvgPicture.asset('assets/icons/more.svg')
                        ],
                      ),
                      const SizedBox(height: 10,),
                      SvgPicture.asset('assets/icons/map.svg')
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }

  RichText buildInfoTextWithPercentage({required String title, required String percentage}) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: "$percentage% \n",
          style: const TextStyle(
            fontSize: 20,
            color: kPrimaryColor,
          ),
        ),
        TextSpan(
          text: title,
          style: const TextStyle(
            color: kTextMediumColor,
            height: 1.5,
          ),
        )
      ]),
    );
  }

  Row buildCaseNumber(BuildContext context) {
    return Row(
      children: [
        Text(
          "547  ",
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: kPrimaryColor, height: 1.2),
        ),
        const Text(
          "5.9%",
          style: TextStyle(color: kPrimaryColor),
        ),
        SvgPicture.asset("assets/icons/increase.svg")
      ],
    );
  }

  Row buildTitleWithMoreIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "New Cases",
          style: TextStyle(
              color: kTextMediumColor,
              fontWeight: FontWeight.w600,
              fontSize: 15),
        ),
        SvgPicture.asset("assets/icons/more.svg")
      ],
    );
  }

  AppBar buildDetailsAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: kPrimaryColor,
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {}, icon: SvgPicture.asset("assets/icons/search.svg"))
      ],
    );
  }
}
