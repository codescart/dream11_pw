// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dream11_pw/Constant/Button/rectangleButton.dart';
import 'package:image_picker/image_picker.dart';
import '../Api/api_controller.dart';
import '../Constant/image_picker.dart';
import '../Constant/input_decoration.dart';
import '../Provider/profile_update_provider.dart';
import '../Provider/view_profile_provider.dart';

class MyProfileTab extends StatefulWidget {
  const MyProfileTab({super.key});
  @override
  State<MyProfileTab> createState() => _MyProfileTabState();
}

class _MyProfileTabState extends State<MyProfileTab> {

  ApiController apiController = ApiController();
  Future<void> fetchData() async {
    try {
      final userData = await apiController.fetchProfileData();
      if (userData != null) {
        Provider.of<ProfileViewProvider>(context, listen: false)
            .setUser(userData);
      }
    } catch (error) {
      // Handle error here
    }
  }

  @override
  Widget build(BuildContext context) {
    final updateUserProvider = Provider.of<UpdateUserProvider>(context);
    final userData = Provider.of<ProfileViewProvider>(context).userData;
    final countryCont = TextEditingController(text: userData?.country ?? '');
    final nameCont = TextEditingController(text: userData?.name ?? '');
    final emailCont = TextEditingController(text: userData?.email ?? '');
    final contactCont = TextEditingController(text: userData?.mobile ?? '');
    final dobCont = TextEditingController(text: userData?.dob ?? '');
    final genderCont = TextEditingController(text: userData?.gender ?? '');
    final stateCont = TextEditingController(text: userData?.state ?? '');
    final cityCont = TextEditingController(text: userData?.city ?? '');

    return Scaffold(
      body: userData == null
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.grey,
            ))
          : ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: myData != '0'
                            ? Image.memory(base64Decode(myData)).image
                            : Image.network(userData.image.toString()).image,
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () {
                              _settingModalBottomSheet(context);
                            },
                            child: const CircleAvatar(
                              backgroundColor: Colors.redAccent,
                              radius: 18,
                              child: Icon(Icons.camera_alt_outlined),
                            ),
                          )),
                    ],
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
                    child: Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 14),
                    decoration: getInputDecoration('Name', Icons.home),
                    controller: nameCont,
                    keyboardType: TextInputType.name,
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
                    child: Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 14),
                    decoration: getInputDecoration(
                      'Your Email here',
                      Icons.email,
                    ),
                    controller: emailCont,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
                    child: Text(
                      'Contact Number',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 14),
                    decoration: getInputDecoration('Contact here', Icons.phone),
                    controller: contactCont,
                    keyboardType: TextInputType.phone,
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
                    child: Text(
                      'Date of Birth',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 14),
                    decoration: getInputDecoration(
                        'Date of Birth', Icons.calendar_month),
                    controller: dobCont,
                    keyboardType: TextInputType.name,
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
                    child: Text(
                      'Gender',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 14),
                    decoration: getInputDecoration('Gender', Icons.male),
                    controller: genderCont,
                    keyboardType: TextInputType.name,
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
                    child: Text(
                      'country',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
                  child: TextFormField(
                    readOnly: true,
                    style: const TextStyle(fontSize: 14),
                    decoration: getInputDecoration('Country name', Icons.flag),
                    controller: countryCont,
                    keyboardType: TextInputType.name,
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
                    child: Text(
                      'State',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 14),
                    decoration: getInputDecoration('State name', Icons.villa),
                    controller: stateCont,
                    keyboardType: TextInputType.name,
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
                    child: Text(
                      'City',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 14),
                    decoration:
                        getInputDecoration('Your City', Icons.home_work),
                    controller: cityCont,
                    keyboardType: TextInputType.name,
                  ),
                ),
                Center(
                  child: CustomButton(
                    loading: updateUserProvider.loading,
                    onTap: () {
                      updateUserProvider.updateUser(
                          nameCont.text,
                          emailCont.text,
                          contactCont.text,
                          dobCont.text,
                          genderCont.text,
                          countryCont.text,
                          stateCont.text,
                          cityCont.text,
                          myData).then((value) => fetchData());
                    },
                    text: 'Save',
                  ),
                )
              ],
            ),
    );
  }

  String myData = '0';
  void _updateImage(ImageSource imageSource) async {
    String? imageData =
        await ChooseImage.chooseImageAndConvertToString(imageSource);
    if (imageData != null) {
      setState(() {
        myData = imageData;
        // You can also update 'file' if needed.
      });
    }
  }

  void _settingModalBottomSheet(context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        context: context,
        builder: (BuildContext bc) {
          return SizedBox(
            height: heights / 7,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  widths / 12, 0, widths / 12, heights / 60),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      _updateImage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: heights / 20,
                      width: widths / 2.7,
                      decoration: BoxDecoration(
                          // color: Colors.blue,
                          border: Border.all(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                          child: Text(
                        'Camera',
                        style: TextStyle(color: Colors.red),
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _updateImage(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: heights / 20,
                      width: widths / 2.7,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                          child: Text(
                        'Gallery',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
