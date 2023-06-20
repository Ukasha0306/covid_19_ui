import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constant.dart';
import 'line_chart.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final int effectedNum;
  final Color iconColor;
  final VoidCallback onPress;
  const InfoCard({
    super.key,
    required this.title,
    required this.effectedNum,
    required this.iconColor, required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return InkWell(
          onTap: onPress,
          child: Container(
            width: constraints.maxWidth / 2 - 10,
            // here is the constraints.maxWidth provide us the available width for the widget
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height*0.07,
                        width: MediaQuery.of(context).size.width*0.07,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: iconColor.withOpacity(0.12),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/running.svg",
                          height: MediaQuery.of(context).size.height*0.02,
                          width: MediaQuery.of(context).size.width*0.02,
                          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                        ),
                      ),
                       SizedBox(
                        width: MediaQuery.of(context).size.width*0.02,
                      ),
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RichText(
                          text: TextSpan(
                              style: const TextStyle(color: kTextColor),
                              children: [
                                TextSpan(
                                    text: "$effectedNum\n",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: kTextColor)),
                                const TextSpan(
                                    text: "People",
                                    style: TextStyle(fontSize: 12, height: 2))
                              ]),
                        ),
                      ),
                      const Expanded(
                        child: LineReportChart(),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}