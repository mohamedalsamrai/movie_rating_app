import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_rating_app/models/profile_model.dart';
import 'package:movie_rating_app/navigation/nav_destinations.dart';
import 'package:movie_rating_app/utils/constants.dart';
import 'package:movie_rating_app/utils/dimens.dart';
import 'package:movie_rating_app/utils/styles.dart';
import 'package:movie_rating_app/utils/utilities.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _dobController = TextEditingController();
  String _imagePath = '';

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  void _loadProfile() {
    final profile = getProfile(); // استرجاع البيانات من Hive
    if (profile != null) {
      _usernameController.text = profile.username;
      _emailController.text = profile.email;
      _dobController.text = profile.date;
      _imagePath = profile.image;
    }
  }

  ProfileModel? getProfile() {
    final box = Hive.box<ProfileModel>(Constants.profileBox);
    return box.get('user_profile');
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
      });
    }
  }

  Future<void> _saveProfile() async {
    // حفظ البيانات في Hive
    final profile = ProfileModel(
      _imagePath,
      _usernameController.text,
      _emailController.text,
      _dobController.text,
    );
    await saveProfile(profile);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Profile updated successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                SizedBox(
                  width: 40,
                ),
                Text(
                  'Edit Profile',
                  style: AppStyles.searchedMovieDetail(context).copyWith(
                      fontSize: Dimens.getAppDimens(context).fontSize20),
                ),
                Spacer(),
                IconButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      context.goNamed(NavDestinations.signUp.name);
                    },
                    icon: Icon(
                      Icons.logout,
                      color: Constants.mainColor,
                    ))
              ],
            ),
            SizedBox(
              height: 23,
            ),
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 85,
                backgroundImage:
                    _imagePath.isNotEmpty ? FileImage(File(_imagePath)) : null,
                child: _imagePath.isEmpty
                    ? Icon(Icons.add_a_photo, size: 50)
                    : null,
              ),
            ),
            SizedBox(height: 20),
            ProfileTextFiled(
              controller: _usernameController,
              hintText: 'Username',
            ),
            SizedBox(height: 20),
            ProfileTextFiled(
              controller: _emailController,
              hintText: "Email",
              readOnly: true,
            ),
            SizedBox(height: 20),
            ProfileTextFiled(
              readOnly: true,
              controller: _dobController,
              hintText: "Date",
              isDatefiled: true,
            ),
            SizedBox(height: 86),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  backgroundColor: Constants.mainColor),
              onPressed: _saveProfile,
              child: Text(
                'Save Changes',
                style: AppStyles.searchedMovieDetail(context)
                    .copyWith(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTextFiled extends StatefulWidget {
  final bool? isDatefiled;
  final TextEditingController controller;
  final String hintText;
  final bool? readOnly;
  const ProfileTextFiled({
    super.key,
    this.isDatefiled,
    required this.controller,
    required this.hintText,
    this.readOnly,
  });

  @override
  State<ProfileTextFiled> createState() => _ProfileTextFiledState();
}

class _ProfileTextFiledState extends State<ProfileTextFiled> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.hintText,
          style: AppStyles.searchedMovieDetail(context).copyWith(fontSize: 14),
        ),
        SizedBox(
          height: 13,
        ),
        SizedBox(
          height: 44,
          child: TextFormField(
            readOnly: widget.readOnly ?? false,
            controller: widget.controller,
            style: const TextStyle(color: Colors.white),
            cursorColor: Constants.mainColor,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: const TextStyle(color: Constants.customTextFieldColor),
              suffixIcon: widget.isDatefiled != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: IconButton(
                          onPressed: () async {
                            DateTime? tame = await showDatePicker(
                                context: context,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2050));
                            tame != null
                                ? widget.controller.text =
                                    tame.toString().substring(0, 10)
                                : '';
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.arrow_downward,
                            color: Constants.mainColor,
                          )))
                  : const SizedBox(),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      Dimens.getAppDimens(context).radius8),
                  borderSide: BorderSide(
                      width: Dimens.getAppDimens(context).customTextFieldBorder,
                      color: Constants.mainColor)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      Dimens.getAppDimens(context).radius8),
                  borderSide: BorderSide(
                      width: Dimens.getAppDimens(context).customTextFieldBorder,
                      color: Colors.grey.shade800)),
            ),
          ),
        ),
      ],
    );
  }
}
