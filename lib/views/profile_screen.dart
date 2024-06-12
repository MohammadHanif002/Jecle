import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jecle/views/edit_profile_screen.dart'; // Pastikan ini adalah jalur yang benar ke layar edit profil Anda

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late FirebaseFirestore _firestore;
  late String _userId;
  DocumentSnapshot? _userData;
  String _profileImagePath = '';
  bool _isLoading = true;
  bool _isFirstTime = false;

  @override
  void initState() {
    super.initState();
    _firestore = FirebaseFirestore.instance;
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    String? userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      setState(() {
        _userId = userId;
      });

      try {
        DocumentSnapshot userData =
            await _firestore.collection('users').doc(userId).get();
        if (userData.exists) {
          setState(() {
            _userData = userData;
            Map<String, dynamic>? userDataMap =
                _userData?.data() as Map<String, dynamic>?;

            if (userDataMap != null &&
                userDataMap.containsKey('profileImage')) {
              _profileImagePath = userDataMap['profileImage'];
            } else {
              _profileImagePath = '';
            }

            // Check if this is the first time user is setting up profile
            _isFirstTime = userDataMap == null || userDataMap.isEmpty;

            _isLoading = false;
          });
        } else {
          setState(() {
            _isFirstTime = true;
            _isLoading = false;
          });
        }
      } catch (error) {
        setState(() {
          _isFirstTime = true;
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        _isLoading = false;
      });
    }

    if (_isFirstTime) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => EditProfileScreen()),
        );
      });
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
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _userData != null
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: w,
                        height: h * 0.3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage("assets/images/top_background.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: w * 0.15,
                              backgroundColor: Colors.grey[300],
                              backgroundImage: _profileImagePath.isNotEmpty
                                  ? NetworkImage(_profileImagePath)
                                  : null,
                              child: _profileImagePath.isEmpty
                                  ? Icon(Icons.camera_alt, size: w * 0.1)
                                  : null,
                            ),
                            SizedBox(height: h * 0.01),
                            Text(
                              _userData!['name'] ?? 'Nama Pengguna',
                              style: TextStyle(
                                fontSize: w * 0.08,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: h * 0.01),
                      Container(
                        width: 400.0,
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildProfileInfoRow(
                                'Nama', _userData!['name'] ?? ''),
                            _buildProfileInfoRow(
                                'Nomor HP', _userData!['phone'] ?? ''),
                            _buildProfileInfoRow(
                                'Alamat', _userData!['address'] ?? ''),
                            _buildProfileInfoRow(
                                'Kota', _userData!['city'] ?? ''),
                            _buildProfileInfoRow(
                                'Kode Pos', _userData!['postalCode'] ?? ''),
                            _buildProfileInfoRow(
                                'Usia',
                                _userData!['age'] != null
                                    ? '${_userData!['age']} tahun'
                                    : ''),
                            _buildProfileInfoRow(
                                'Jenis Kelamin', _userData!['gender'] ?? ''),
                          ],
                        ),
                      ),
                      SizedBox(height: h * 0.01),
                      Container(
                        width: w * 0.4,
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 3, 123, 3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfileScreen(),
                              ),
                            );
                            await _loadProfileData();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 3, 123, 3),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Ubah Profil',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: h * 0.01),
                      Container(
                        width: w,
                        height: h * 0.3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/bottom_background.jpeg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildEmptyProfileFormField('Nama', ''),
                          _buildEmptyProfileFormField('Nomor HP', ''),
                          _buildEmptyProfileFormField('Alamat', ''),
                          _buildEmptyProfileFormField('Kota', ''),
                          _buildEmptyProfileFormField('Kode Pos', ''),
                          _buildEmptyProfileFormField('Usia', ''),
                          _buildEmptyProfileFormField('Jenis Kelamin', ''),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => EditProfileScreen(),
                                ),
                              );
                            },
                            child: Text('Simpan Profil'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }

  Widget _buildProfileInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Text(
            '$label: $value',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildEmptyProfileFormField(String label, String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
