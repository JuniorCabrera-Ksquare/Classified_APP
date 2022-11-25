import 'package:classified_app/models/ads_model.dart';
import 'package:classified_app/services/ads_service.dart';
import 'package:classified_app/services/picture_service.dart';
import 'package:classified_app/utilities/constants.dart';
import 'package:classified_app/utilities/manager/alert_manager.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateAdScreen extends StatefulWidget {
  const CreateAdScreen({super.key});

  @override
  State<CreateAdScreen> createState() => _CreateAdScreenState();
}

class _CreateAdScreenState extends State<CreateAdScreen> {
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _priceCtrl = TextEditingController();
  final TextEditingController _mobileCtrl = TextEditingController();
  final TextEditingController _descriptionCtrl = TextEditingController();
  bool _imageLoad = false;
  bool _check = false;
  List<dynamic> _data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Ad"),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: () async {
                  List<XFile> file = await ImagePicker().pickMultiImage();
                  if (file.isNotEmpty) {
                    setState(() {
                      _imageLoad = true;
                      _check = true;
                    });
                    _data = await PictureService().uploadPhotos(file);
                  }
                  setState(() {
                    _check = false;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 24),
                  child: Column(
                    children: const [
                      Icon(
                        Icons.add_a_photo_outlined,
                        size: 40,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Tap to Upload",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Visibility(
                visible: _imageLoad,
                replacement: const SizedBox(
                  height: 1,
                  width: double.infinity,
                ),
                child: SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: _check
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Constants().appColor,
                          ),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _data.length,
                          itemBuilder: ((context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey,
                                    style: BorderStyle.solid),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                color: Colors.white,
                              ),
                              margin: const EdgeInsets.all(4),
                              padding: const EdgeInsets.all(4),
                              width: 100,
                              child: Image.network(
                                _data[index],
                                fit: BoxFit.cover,
                              ),
                            );
                          }),
                        ),
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(children: [
                    TextField(
                        controller: _titleCtrl,
                        style: const TextStyle(fontSize: 18, height: 1),
                        decoration: const InputDecoration(
                            labelText: "Title", border: OutlineInputBorder())),
                    const SizedBox(height: 8),
                    TextField(
                        controller: _priceCtrl,
                        style: const TextStyle(fontSize: 18, height: 1),
                        decoration: const InputDecoration(
                            labelText: "Price", border: OutlineInputBorder())),
                    const SizedBox(height: 8),
                    TextField(
                        controller: _mobileCtrl,
                        style: const TextStyle(fontSize: 18, height: 1),
                        decoration: const InputDecoration(
                            labelText: "Contact Number",
                            border: OutlineInputBorder())),
                    const SizedBox(height: 8),
                    TextField(
                        maxLines: 3,
                        controller: _descriptionCtrl,
                        style: const TextStyle(fontSize: 18, height: 1),
                        decoration: const InputDecoration(
                            labelText: "Description",
                            border: OutlineInputBorder())),
                    const SizedBox(height: 16),
                  ]),
                ),
              ),
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (_titleCtrl.text.isEmpty ||
                            _priceCtrl.text.isEmpty ||
                            _mobileCtrl.text.isEmpty ||
                            _descriptionCtrl.text.isEmpty) {
                          AlertManager().displaySnackbar(
                              context, "Please, fill out all the fields.");
                        } else {
                          AdsModel ad = AdsModel(
                              title: _titleCtrl.text,
                              description: _descriptionCtrl.text,
                              price: double.parse(_priceCtrl.text),
                              mobile: _mobileCtrl.text,
                              images: _data);
                          await AdsService().createMyAd(context, ad)
                              ? Navigator.pop(context)
                              : null;
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xfff25723)),
                      child: const Text(
                        "Submit Ad",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      )))
            ],
          ),
        )),
      ),
    );
  }
}
