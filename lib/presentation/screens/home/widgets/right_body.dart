part of 'widgets_imports.dart';

class RightBody extends StatelessWidget {
  const RightBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          "Diamond Sponsors".text.underline.xl4.white.make(),
          // Image.asset(
          //   Assets.assetsImagesVw,
          //   width: 200,
          //   height: 80,
          // ),
          60.heightBox,
          "Gold Sponsors".text.underline.xl2.white.make(),
          Image.asset(
            Assets.assetsImagesNoditt,
            width: 200,
            height: 80,
          ),
          60.heightBox,
          "Media Partners".text.underline.xl.white.make(),
          Image.asset(
            Assets.assetsImagesGangajal,
            width: 200,
            height: 80,
          ),
        ],
      ).pOnly(left: 30),
    ).expand();
  }
}
