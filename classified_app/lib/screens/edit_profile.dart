import 'package:classified_app/models/user_model.dart';
import 'package:classified_app/services/picture_service.dart';
import 'package:classified_app/services/profile_service.dart';
import 'package:classified_app/utilities/constants.dart';
import 'package:classified_app/utilities/manager/alert_manager.dart';
import 'package:classified_app/utilities/navigation/const_routes.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _mobileCtrl = TextEditingController();
  bool _loading = false;
  bool _picked = false;
  String _imgPath = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: FutureBuilder(
        future: ProfileService().readProfile(context),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            UserModel user = snapshot.data;
            _nameCtrl.text = user.name!;
            _emailCtrl.text = user.email!;
            _mobileCtrl.text = user.mobile!;
            _picked ? user.imgURL = _imgPath : null;
            _picked ? _loading = false : null;
            return Center(
                child: Column(
              children: [
                const SizedBox(height: 18),
                GestureDetector(
                  onTap: () async {
                    XFile? file = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (file != null) {
                      setState(() {
                        _loading = true;
                      });
                      _imgPath =
                          await PictureService().uploadPicture(file.path);
                      setState(() {
                        _picked = true;
                      });
                    }
                  },
                  child: Visibility(
                    visible: _loading,
                    replacement: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(user.imgURL!),
                      radius: 60,
                    ),
                    child: CircularProgressIndicator(
                      color: Constants().appColor,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 400,
                  width: double.infinity,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TextField(
                            controller: _nameCtrl,
                            style: const TextStyle(fontSize: 18, height: 1),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder())),
                        const SizedBox(height: 8),
                        TextField(
                            controller: _emailCtrl,
                            style: const TextStyle(fontSize: 18, height: 1),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder())),
                        const SizedBox(height: 8),
                        TextField(
                            controller: _mobileCtrl,
                            style: const TextStyle(fontSize: 18, height: 1),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder())),
                        const SizedBox(height: 24),
                        SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () async {
                                  if (_nameCtrl.text.isEmpty ||
                                      _emailCtrl.text.isEmpty ||
                                      _mobileCtrl.text.isEmpty) {
                                    AlertManager().displaySnackbar(context,
                                        "Please, fill out all the fields.");
                                  } else {
                                    String? img = user.imgURL;
                                    user = UserModel(
                                        name: _nameCtrl.text,
                                        email: _emailCtrl.text,
                                        mobile: _mobileCtrl.text,
                                        imgURL: img);
                                    if (await ProfileService()
                                        .updateProfile(context, user)) {
                                      Navigator.pop(context);
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Constants().appColor),
                                child: const Text(
                                  "Update Profile",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ))),
                        const SizedBox(height: 10),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, loginPage, (route) => false);
                            },
                            child: Text(
                              "Logout",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Constants().appColor),
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ));
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Constants().appColor,
              ),
            );
          }
        },
      ),
    );
  }
}
