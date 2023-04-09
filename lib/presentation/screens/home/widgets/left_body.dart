part of 'widgets_imports.dart';

class LeftBody extends StatelessWidget {
  const LeftBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.4,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Organiser".text.underline.xl4.white.make(),
            10.heightBox,
            Speakers(
              width: MediaQuery.of(context).size.width,
              name: "Sangam Singh",
              image: Assets.assetsImagesCodersangam,
              designation: "Software Developer @World Advance Technology",
              topics: "",
            ),
            // 20.heightBox,
            // "Speakers".text.underline.xl4.white.make(),
            // 20.heightBox,
            // Wrap(
            //   alignment: WrapAlignment.spaceBetween,
            //   runAlignment: WrapAlignment.spaceBetween,
            //   crossAxisAlignment: WrapCrossAlignment.end,
            //   spacing: 16,
            //   runSpacing: 16,
            //   children: const [
            //     Speakers(
            //       name: "Sangam Singh",
            //       image: Assets.assetsImagesCodersangam,
            //       designation:
            //           "Software Developer \n@World Advance \nTechnology",
            //       topics: "Topics: creation of \ncrypto wallet locally",
            //     ),
            //     Speakers(
            //       name: "Sangam Singh",
            //       image: Assets.assetsImagesCodersangam,
            //       designation:
            //           "Software Developer \n@World Advance \nTechnology",
            //       topics: "Topics: creation of \ncrypto wallet locally",
            //     ),
            //   ],
            // ),
            // 20.heightBox,
            // Wrap(
            //   alignment: WrapAlignment.spaceBetween,
            //   runAlignment: WrapAlignment.spaceBetween,
            //   crossAxisAlignment: WrapCrossAlignment.end,
            //   spacing: 16,
            //   runSpacing: 16,
            //   children: const [
            //     Speakers(
            //       name: "Sangam Singh",
            //       image: Assets.assetsImagesCodersangam,
            //       designation:
            //           "Software Developer \n@World Advance \nTechnology",
            //       topics: "Topics: creation of \ncrypto wallet locally",
            //     ),
            //     Speakers(
            //       name: "Sangam Singh",
            //       image: Assets.assetsImagesCodersangam,
            //       designation:
            //           "Software Developer \n@World Advance \nTechnology",
            //       topics: "Topics: creation of \ncrypto wallet locally",
            //     ),
            //   ],
            // ),
            40.heightBox,
            "Event Timeline".text.underline.xl4.white.make(),
            TimelineTile(
              alignment: TimelineAlign.center,
              isFirst: true,
              isLast: false,
              indicatorStyle: IndicatorStyle(
                  height: 40,
                  width: 40,
                  indicator: Image.asset(Assets.assetsImagesNepal)),
              startChild: SizedBox(
                width: 40,
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "11:00 AM".text.white.make(),
                    10.heightBox,
                    "Initialise with \nNational Anthem".text.white.make(),
                  ],
                ),
              ),
            ),
            TimelineTile(
              alignment: TimelineAlign.center,
              isFirst: false,
              isLast: false,
              endChild: SizedBox(
                width: 40,
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    "11:30 AM".text.white.make(),
                    10.heightBox,
                    // "Crypto wallet creation locally by Sangam Singh"
                    "First Speaker".text.end.white.make(),
                  ],
                ),
              ),
            ),
            TimelineTile(
              alignment: TimelineAlign.center,
              isFirst: false,
              isLast: false,
              startChild: SizedBox(
                width: 40,
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "12:30 PM".text.white.make(),
                    10.heightBox,
                    "Second Speaker".text.white.make(),
                  ],
                ),
              ),
            ),
            TimelineTile(
              alignment: TimelineAlign.center,
              isFirst: false,
              isLast: false,
              indicatorStyle: IndicatorStyle(
                  height: 40,
                  width: 40,
                  indicator: Image.asset(Assets.assetsImagesPizza)),
              endChild: SizedBox(
                width: 40,
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    "01:00 PM".text.white.make(),
                    10.heightBox,
                    "Lunch Break \n(1 Hour)".text.white.make(),
                  ],
                ),
              ),
            ),
            TimelineTile(
              alignment: TimelineAlign.center,
              isFirst: false,
              isLast: false,
              startChild: SizedBox(
                width: 40,
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "02:00 PM".text.white.make(),
                    10.heightBox,
                    "Third Speaker".text.white.make(),
                  ],
                ),
              ),
            ),
            TimelineTile(
              alignment: TimelineAlign.center,
              isFirst: false,
              isLast: false,
              endChild: SizedBox(
                width: 40,
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    "02:30 PM".text.white.make(),
                    10.heightBox,
                    "Fourth Speaker".text.end.white.make(),
                  ],
                ),
              ),
            ),
            TimelineTile(
              alignment: TimelineAlign.center,
              isFirst: false,
              isLast: false,
              startChild: SizedBox(
                width: 40,
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "03:00 PM".text.white.make(),
                    10.heightBox,
                    "Quizes and Swags".text.white.make(),
                  ],
                ),
              ),
            ),
            TimelineTile(
              alignment: TimelineAlign.center,
              isFirst: false,
              isLast: true,
              endChild: SizedBox(
                width: 40,
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    "04:00 PM".text.white.make(),
                    10.heightBox,
                    "Group Photo\nEnd of Event/Meetup".text.end.white.make(),
                  ],
                ),
              ),
            ),
          ],
        ).pOnly(right: 30),
      ),
    ).expand();
  }
}
