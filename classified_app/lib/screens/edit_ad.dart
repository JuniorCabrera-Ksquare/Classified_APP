import 'package:classified_app/models/ads_model.dart';
import 'package:classified_app/services/ads_service.dart';
import 'package:classified_app/services/picture_service.dart';
import 'package:classified_app/utilities/constants.dart';
import 'package:classified_app/utilities/manager/alert_manager.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditAdScreen extends StatefulWidget {
  final AdsModel data;
  const EditAdScreen({super.key, required this.data});

  @override
  State<EditAdScreen> createState() => _EditAdScreenState();
}

class _EditAdScreenState extends State<EditAdScreen> {
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _priceCtrl = TextEditingController();
  final TextEditingController _mobileCtrl = TextEditingController();
  final TextEditingController _descriptionCtrl = TextEditingController();
  bool _picked = false;
  List<dynamic> _imgPathList = [];

  @override
  Widget build(BuildContext context) {
    _titleCtrl.text = widget.data.title!;
    _priceCtrl.text = widget.data.price.toString();
    _mobileCtrl.text = widget.data.mobile!;
    _descriptionCtrl.text = widget.data.description!;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Ad"),
      ),
      backgroundColor: Colors.white,
      body: Visibility(
        visible: _picked,
        replacement: SingleChildScrollView(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                OutlinedButton(
                  onPressed: () async {
                    List<XFile> file = await ImagePicker().pickMultiImage();
                    if (file.isNotEmpty) {
                      setState(() {
                        _picked = true;
                      });
                      _imgPathList = await PictureService().uploadPhotos(file);
                      widget.data.images!.addAll(_imgPathList);
                    }
                    setState(() {
                      _picked = false;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
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
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.data.images!.length,
                    itemBuilder: ((context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey, style: BorderStyle.solid),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: Colors.white,
                        ),
                        margin: const EdgeInsets.all(4),
                        padding: const EdgeInsets.all(4),
                        width: 100,
                        child: Image.network(
                          widget.data.images![index],
                          fit: BoxFit.cover,
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                    controller: _titleCtrl,
                    style: const TextStyle(fontSize: 18, height: 1),
                    decoration:
                        const InputDecoration(border: OutlineInputBorder())),
                const SizedBox(height: 8),
                TextField(
                    controller: _priceCtrl,
                    style: const TextStyle(fontSize: 18, height: 1),
                    decoration:
                        const InputDecoration(border: OutlineInputBorder())),
                const SizedBox(height: 8),
                TextField(
                    controller: _mobileCtrl,
                    style: const TextStyle(fontSize: 18, height: 1),
                    decoration:
                        const InputDecoration(border: OutlineInputBorder())),
                const SizedBox(height: 8),
                TextField(
                    maxLines: 3,
                    controller: _descriptionCtrl,
                    style: const TextStyle(fontSize: 18, height: 1),
                    decoration:
                        const InputDecoration(border: OutlineInputBorder())),
                const SizedBox(height: 12),
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
                                id: widget.data.id,
                                title: _titleCtrl.text,
                                description: _descriptionCtrl.text,
                                price: double.parse(_priceCtrl.text),
                                mobile: _mobileCtrl.text,
                                images: widget.data.images);
                            await AdsService().updateMyAd(context, ad)
                                ? Navigator.pop(context)
                                : null;
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Constants().appColor),
                        child: const Text(
                          "Submit Ad",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        )))
              ],
            ),
          )),
        ),
        child: Center(
          child: CircularProgressIndicator(
            color: Constants().appColor,
          ),
        ),
      ),
    );
  }
}
