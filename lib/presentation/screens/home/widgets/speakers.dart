part of 'widgets_imports.dart';

class Speakers extends StatelessWidget {
  const Speakers({
    super.key,
    required this.name,
    required this.image,
    this.topics,
    this.designation = "",
    this.height,
    this.width,
  });

  final String name;
  final String image;
  final String? topics;
  final String? designation;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        VxCircle(
          radius: 90,
          backgroundImage: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
        10.heightBox,
        name.text.bold.xl.white.make(),
        5.heightBox,
        designation!.text.center.white.make(),
        5.heightBox,
        topics!.text.center.white.make(),
      ],
    ).p(14).glassMorphic(circularRadius: 6, width: width, height: height);
  }
}
