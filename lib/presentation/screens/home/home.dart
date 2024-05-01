part of 'home_imports.dart';

@RoutePage()
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomeViewModel homeViewModel;

  @override
  void initState() {
    homeViewModel = HomeViewModel(context.read<Repository>());
    // homeViewModel.getUserDetails(context);
    // showSponsorDialog();
    super.initState();
  }

  showSponsorDialog() {
    Future.delayed(const Duration(seconds: 3), () {
      VxDialog.showAlert(
        context,
        title: "For Sponsors",
        content: "Please mail us at sponsors@flutternepal.dev",
        confirm: 'OK',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return VxResponsive(
      small: Scaffold(
        backgroundColor: MyColors.primaryColor,
        body: "Please use web for better experience"
            .text
            .center
            .xl4
            .color(MyColors.white)
            .makeCentered(),
      ),
      medium: Scaffold(
        backgroundColor: MyColors.primaryColor,
        appBar: AppBar(
          backgroundColor: MyColors.flagRedColor,
          title: const Text(
            "Flutter Nepal (Registration Starts from July 01, 2024)",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            60.heightBox,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const LeftBody(),
                MainBody(homeViewModel: homeViewModel),
                const RightBody(),
              ],
            ).pSymmetric(h: 20),
            10.heightBox,
            // BlocBuilder<VelocityBloc<UserDetailsModel?>,
            //     VelocityState<UserDetailsModel?>>(
            //   bloc: homeViewModel.userDetailsBloc,
            //   builder: (context, userDetailsState) {
            //     if (userDetailsState is VelocityInitialState) {
            //       return const CircularProgressIndicator.adaptive().centered();
            //     } else {
            //       return Visibility(
            //         visible: userDetailsState.data!.meetupUsers!.length >= 5,
            //         child: SizedBox(
            //           width: MediaQuery.of(context).size.width / 2,
            //           height: 40,
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               for (int i = 0; i < 5; i++)
            //                 VxCircle(
            //                   radius: 40,
            //                   backgroundColor: Colors.transparent,
            //                   backgroundImage: DecorationImage(
            //                     fit: BoxFit.cover,
            //                     image: NetworkImage(
            //                         "https://meetup.codersangam.com/${userDetailsState.data!.meetupUsers![i].profileImage!.replaceAll("public", "storage")}"),
            //                   ),
            //                 )
            //                     .tooltip(
            //                         "${userDetailsState.data!.meetupUsers![i].fullName}")
            //                     .p(1),
            //               10.widthBox,
            //               "+${userDetailsState.data!.meetupUsers!.length - 5} are going."
            //                   .text
            //                   .white
            //                   .make(),
            //             ],
            //           ),
            //         ),
            //       );
            //     }
            //   },
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "Made with ❤️ in Nepal".text.white.make(),
                "❤️ Flutter ❤️".text.white.make(),
              ],
            ).pSymmetric(h: 25, v: 10),
          ],
        ).centered(),
      ),
    );
  }
}
