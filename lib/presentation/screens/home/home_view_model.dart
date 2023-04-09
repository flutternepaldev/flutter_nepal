part of 'home_imports.dart';

class HomeViewModel {
  final Repository repository;
  HomeViewModel(this.repository);

  VelocityBloc<Uint8List?> imageBloc = VelocityBloc<Uint8List?>(null);

  VelocityBloc<XFile?> imageFileBloc = VelocityBloc<XFile?>(null);

  VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);

  VelocityBloc<bool> isConfirmed = VelocityBloc<bool>(false);

  VelocityBloc<UserDetailsModel?> userDetailsBloc =
      VelocityBloc<UserDetailsModel?>(null);

  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController heardAboutController = TextEditingController();
  TextEditingController experienceController = TextEditingController();

  clearControllers() {
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    companyController.clear();
    heardAboutController.clear();
    experienceController.clear();
    imageBloc.onUpdateData(null);
    isConfirmed.onUpdateData(false);
  }

  pickImage(context) async {
    final ImagePicker imagePicker = ImagePicker();
    final imageFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      var f = await imageFile.readAsBytes();
      imageBloc.onUpdateData(f);
      imageFileBloc.onUpdateData(imageFile);
    } else {
      VxToast.show(
        context,
        msg: "No Image Selected",
        textColor: MyColors.white,
      );
    }
  }

  storeNewUser(context) async {
    isLoadingBloc.onUpdateData(true);
    var userData = await repository.othersApi.getUserDetails();
    if (userData.meetupUsers!.length < 50) {
      String fileName = imageFileBloc.state.data!.path.split('/').last;
      final data = await repository.othersApi.storeNewUser(
          nameController.text,
          emailController.text,
          imageBloc.state.data,
          fileName,
          phoneController.text,
          experienceController.text,
          heardAboutController.text,
          companyController.text);

      if (data.status == 1) {
        clearControllers();
        VxToast.show(context, msg: data.message!);
      } else {
        VxToast.show(context, msg: data.message!);
      }
    } else {
      VxToast.show(context, msg: "Oops! Max Participants Reached.");
    }

    isLoadingBloc.onUpdateData(false);
  }

  getUserDetails(context) async {
    var userData = await repository.othersApi.getUserDetails();
    if (userData.status == 1) {
      userDetailsBloc.onUpdateData(userData);
    } else {
      VxToast.show(context, msg: userData.message!);
    }
  }
}
