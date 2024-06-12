import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:jecle/views/home_screen.dart'; // Pastikan ini adalah jalur yang benar ke layar beranda Anda

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  File? _image; // Menggunakan File dari dart:io

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    String? userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      if (userData.exists) {
        setState(() {
          nameController.text = userData['name'] ?? '';
          phoneController.text = userData['phone'] ?? '';
          addressController.text = userData['address'] ?? '';
          cityController.text = userData['city'] ?? '';
          postalCodeController.text = userData['postalCode'] ?? '';
          ageController.text = userData['age']?.toString() ?? '';
          genderController.text = userData['gender'] ?? '';
        });
      }
    }
  }

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      print('Tidak ada gambar yang dipilih.');
    }
  }

  Future<String> uploadImageToFirebaseStorage(File imageFile) async {
    try {
      // Generate a unique filename for the image
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();

      // Upload the image to Firebase Storage
      final Reference ref =
          FirebaseStorage.instance.ref().child('images/$fileName.jpg');
      await ref.putFile(imageFile);

      // Get the download URL for the image
      String imageUrl = await ref.getDownloadURL();

      return imageUrl;
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
      return '';
    }
  }

  void _handleSaveButtonPressed() async {
    String imageUrl = '';
    if (_image != null) {
      imageUrl = await uploadImageToFirebaseStorage(_image!);
    }
    await _saveDataToFirestore(imageUrl);
  }

  Future<void> _saveDataToFirestore(String imageUrl) async {
    String name = nameController.text;
    String phone = phoneController.text;
    String address = addressController.text;
    String city = cityController.text;
    String postalCode = postalCodeController.text;
    int age = int.tryParse(ageController.text) ?? 0;
    String gender = genderController.text;

    try {
      String? userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId != null) {
        DocumentReference userDoc =
            FirebaseFirestore.instance.collection('users').doc(userId);
        await userDoc.set({
          'name': name,
          'phone': phone,
          'address': address,
          'city': city,
          'postalCode': postalCode,
          'age': age,
          'gender': gender,
          if (imageUrl.isNotEmpty) 'profileImage': imageUrl,
        }, SetOptions(merge: true));

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Data berhasil disimpan di Firestore')));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Terjadi kesalahan: $error')));
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(48, 133, 195, 1),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          iconSize: 24,
        ),
        toolbarHeight: 40.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 0, right: 0),
              width: w,
              height: h * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/top_background.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: h * 0.05),
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: w * 0.15,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    child: _image == null
                        ? Icon(Icons.camera_alt, size: w * 0.1)
                        : null,
                  ),
                ),
                SizedBox(height: h * 0.02),
                Text(
                  'Nama Pengguna',
                  style: TextStyle(
                      fontSize: w * 0.08, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: h * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Nama'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                  child: TextField(
                    controller: phoneController,
                    decoration: InputDecoration(labelText: 'Nomor HP'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                  child: TextField(
                    controller: addressController,
                    decoration: InputDecoration(labelText: 'Alamat'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                  child: TextField(
                    controller: cityController,
                    decoration: InputDecoration(labelText: 'Kota'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                  child: TextField(
                    controller: postalCodeController,
                    decoration: InputDecoration(labelText: 'Kode Pos'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                  child: TextField(
                    controller: ageController,
                    decoration: InputDecoration(labelText: 'Usia'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                  child: TextField(
                    controller: genderController,
                    decoration: InputDecoration(labelText: 'Jenis Kelamin'),
                  ),
                ),
                SizedBox(height: h * 0.03),
                Container(
                  width: w * 0.4,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 3, 123, 3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    onPressed: _handleSaveButtonPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 3, 123, 3),
                    ),
                    child: Text(
                      'Simpan',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 0, right: 0),
              width: w,
              height: h * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/bottom_background.jpeg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
