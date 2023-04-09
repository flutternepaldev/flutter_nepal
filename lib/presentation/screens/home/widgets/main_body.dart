part of 'widgets_imports.dart';

class MainBody extends StatefulWidget {
  const MainBody({
    super.key,
    required this.homeViewModel,
  });

  final HomeViewModel homeViewModel;

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  final SliderController controller = SliderController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 1.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: MyColors.flagBlueColor,
        ),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: widget.homeViewModel.formKey,
          child: BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
            bloc: widget.homeViewModel.isConfirmed,
            builder: (context, checkState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Please fill the form properly. All details filled below will be saved privately. None of your data will be shared to third-party."
                      .text
                      .xl
                      .white
                      .make(),
                  10.heightBox,
                  "*All fields are mandatory to fill".text.xl.white.make(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          BlocBuilder<VelocityBloc<Uint8List?>,
                              VelocityState<Uint8List?>>(
                            bloc: widget.homeViewModel.imageBloc,
                            builder: (context, state) {
                              return state.data != null
                                  ? VxCircle(
                                      radius: 60,
                                      backgroundColor: Colors.transparent,
                                      child: Image.memory(
                                        state.data!,
                                        width: 60,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Image.asset(
                                      Assets.assetsImagesDefaultImage,
                                      height: 60,
                                      width: 60,
                                      color: Colors.grey,
                                    );
                            },
                          ),
                          InkWell(
                            onTap: () =>
                                widget.homeViewModel.pickImage(context),
                            child: const Icon(
                              Icons.add,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  "Full Name*".text.white.bold.make(),
                  VxTextField(
                    hint: "Enter your full name",
                    hintStyle: TextStyle(color: MyColors.white),
                    style: TextStyle(color: MyColors.white),
                    suffixColor: MyColors.white,
                    controller: widget.homeViewModel.nameController,
                    validator: (value) {
                      if (value.isEmptyOrNull) {
                        return "Name field cannot be empty.";
                      } else {
                        return null;
                      }
                    },
                  ),
                  30.heightBox,
                  "Email*".text.white.bold.make(),
                  VxTextField(
                    hint: "Enter your email address",
                    hintStyle: TextStyle(color: MyColors.white),
                    style: TextStyle(color: MyColors.white),
                    suffixColor: MyColors.white,
                    controller: widget.homeViewModel.emailController,
                    validator: (value) {
                      if (value.isEmptyOrNull) {
                        return "Email field cannot be empty.";
                      } else {
                        return null;
                      }
                    },
                  ),
                  30.heightBox,
                  "Phone*".text.white.bold.make(),
                  VxTextField(
                    hint: "Enter your phone number",
                    hintStyle: TextStyle(color: MyColors.white),
                    style: TextStyle(color: MyColors.white),
                    suffixColor: MyColors.white,
                    controller: widget.homeViewModel.phoneController,
                    validator: (value) {
                      if (value.isEmptyOrNull) {
                        return "Phone field cannot be empty.";
                      } else {
                        return null;
                      }
                    },
                  ),
                  30.heightBox,
                  "Company Name*".text.white.bold.make(),
                  VxTextField(
                    hint: "Enter your company name",
                    hintStyle: TextStyle(color: MyColors.white),
                    style: TextStyle(color: MyColors.white),
                    suffixColor: MyColors.white,
                    controller: widget.homeViewModel.companyController,
                    validator: (value) {
                      if (value.isEmptyOrNull) {
                        return "Company field cannot be empty.";
                      } else {
                        return null;
                      }
                    },
                  ),
                  30.heightBox,
                  "Experience*".text.white.bold.make(),
                  VxTextField(
                    hint: "Enter your experience years/months",
                    hintStyle: TextStyle(color: MyColors.white),
                    style: TextStyle(color: MyColors.white),
                    suffixColor: MyColors.white,
                    controller: widget.homeViewModel.experienceController,
                    validator: (value) {
                      if (value.isEmptyOrNull) {
                        return "Experience field cannot be empty.";
                      } else {
                        return null;
                      }
                    },
                  ),
                  30.heightBox,
                  "From where you heard about this meetup/event? (Optional)"
                      .text
                      .white
                      .bold
                      .make(),
                  VxTextField(
                    hint: "Facebook",
                    hintStyle: TextStyle(color: MyColors.white),
                    style: TextStyle(color: MyColors.white),
                    suffixColor: MyColors.white,
                    controller: widget.homeViewModel.heardAboutController,
                  ),
                  30.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: checkState.data,
                        checkColor: MyColors.whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: BorderSide(
                            color: MyColors.white,
                          ),
                        ),
                        side: MaterialStateBorderSide.resolveWith((states) =>
                            BorderSide(width: 1.0, color: MyColors.white)),
                        onChanged: (value) {
                          if (checkState.data.toString() == "false") {
                            VxDialog.showCustom(
                              context,
                              child: Container(
                                width: 400,
                                height: 400,
                                color: MyColors.white,
                                child: SliderCaptcha(
                                  controller: controller,
                                  imageToBarPadding: 20,
                                  titleStyle: TextStyle(color: MyColors.white),
                                  image: Image.asset(
                                    Assets.assetsImagesFlutterLogo,
                                    fit: BoxFit.fitWidth,
                                  ),
                                  colorBar: const Color(0xff00579B),
                                  colorCaptChar: const Color(0xff00579B),
                                  onConfirm: (myvalue) async {
                                    debugPrint(myvalue.toString());
                                    if (myvalue.toString() == "true") {
                                      widget.homeViewModel.isConfirmed
                                          .onUpdateData(
                                              checkState.data.toggle());
                                      AutoRouter.of(context).pop();
                                    } else {
                                      return await Future.delayed(
                                              const Duration(seconds: 1))
                                          .then(
                                        (value) {
                                          controller.create.call();
                                        },
                                      );
                                    }
                                  },
                                ).p20(),
                              ),
                            );
                          } else {
                            widget.homeViewModel.isConfirmed
                                .onUpdateData(checkState.data.toggle());
                          }
                        },
                      ),
                      "I hereby confirm that I will follow"
                          .richText
                          .gray400
                          .withTextSpanChildren([
                            TextSpan(
                                text: " Code of Conduct ",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Utils.launchURL(
                                      url: "https://google.com"),
                                style: TextStyle(color: MyColors.whiteColor)),
                            const TextSpan(
                              text:
                                  "and agree to get banned from events If I dont follow.",
                            ),
                          ])
                          .make()
                          .expand(),
                    ],
                  ),
                  60.heightBox,
                  BlocBuilder<VelocityBloc<Uint8List?>,
                      VelocityState<Uint8List?>>(
                    bloc: widget.homeViewModel.imageBloc,
                    builder: (context, imageState) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        child: BlocBuilder<VelocityBloc<bool>,
                            VelocityState<bool>>(
                          bloc: widget.homeViewModel.isLoadingBloc,
                          builder: (context, state) {
                            return ElevatedButton(
                              onPressed: () {
                                // if (widget.homeViewModel.formKey.currentState!
                                //     .validate()) {
                                //   if (imageState.data != null) {
                                //     if (checkState.data == true) {
                                //       widget.homeViewModel
                                //           .storeNewUser(context);
                                //     } else {
                                //       VxToast.show(context,
                                //           msg: "Please accept Code of Ethics");
                                //     }
                                //   } else {
                                //     VxToast.show(context,
                                //         msg: "Please add profile Image.");
                                //   }
                                // }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyColors.secondaryColor,
                              ),
                              child: state.data == true
                                  ? const CircularProgressIndicator().centered()
                                  : "Submit".text.make(),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ).pSymmetric(h: 40, v: 60),
        ),
      ),
    );
  }
}
