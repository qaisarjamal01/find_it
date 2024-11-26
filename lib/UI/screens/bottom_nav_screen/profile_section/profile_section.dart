import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_it/UI/screens/bottom_nav_screen/profile_section/AccountDetailsScreen/account_details.dart';
import 'package:find_it/UI/screens/bottom_nav_screen/profile_section/ContactInformationScreen/contact_information.dart';
import 'package:find_it/UI/screens/bottom_nav_screen/profile_section/UpdatePasswordScreen/update_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/constants/constant_color.dart';
import '../../../components/custom_container.dart';
import '../../../components/custom_profile_list_tile.dart';
import '../../auth/login_form/login_form.dart';
import '../../auth/sign_up_form/sign_up_form.dart';
import 'PrivacyPolicyScreen/privacy_policy_screen.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({super.key});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  String? userRole;
  String? userEmail;
  String userName = '';
  String? userContact;
  String profileUrl = '';
  User? currentUser;
  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
  }

  // Function to fetch user details from Firebase
  void _fetchUserDetails() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Set the email from FirebaseAuth
      userEmail = user.email;

      // Fetch the user details (e.g., userName and userRole) from Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')  // Assuming you store user data in 'users' collection
          .doc(user.uid)
          .get();

      setState(() {
        userName = userDoc['userName'];  // Assuming field name is 'userName'
        userRole = userDoc['userRole'];
        profileUrl = userDoc['image_url'];
        userContact = userDoc['userContact']; // Assuming field name is 'userRole'
      });
    }
  }

  // Function to delete the user document from Firestore and the Firebase Authentication account
  Future<void> deleteAccount() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        // Delete user document from Firestore
        await FirebaseFirestore.instance.collection('users').doc(user.uid).delete();
        print('User document deleted successfully');

        // Delete the user from Firebase Auth
        await user.delete();
        print('User authentication account deleted');

        // Navigate to SignUp or Login screen after deleting the account
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SignUpForm()));
      } catch (error) {
        print('Error deleting user account: $error');
      }
    }
  }


  XFile? imageFile;
  String imageUrl = '';


  // Function to pick image from gallery
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imageFile = pickedFile;
      });
    }
  }

  Future<void> uploadImage () async{
    if(imageFile == null)return;

    //unique name for image
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

    //uploading image to firebase
    //firebase storage instance
    Reference referenceRoot = FirebaseStorage.instance.ref();

    //create folder for images
    Reference referenceDirImages = referenceRoot.child('images');

    //give pic a unique name
    Reference imageToUpload = referenceDirImages.child(uniqueFileName);

    //upload image to Firebase
    try{
      await imageToUpload.putFile(File(imageFile!.path));
      imageUrl = await imageToUpload.getDownloadURL();
      print(imageUrl);
    }catch (e){
      print(e);
    }

  }

  @override
  Widget build(BuildContext context) {
    String? docId;
    double size = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ConstantColors.orangeShade,
      appBar: AppBar(
        title: Text('Profile',style: TextStyle(color: Color(0xffFFFFFF)),),
        centerTitle: true,
        backgroundColor: Color(0xff003366),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 14.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                          //color: Colors.blue,
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(image: profileUrl.isNotEmpty
                              ? NetworkImage(profileUrl)// Display the selected image
                              : const AssetImage('assets/images/profile_pic.jpg') as ImageProvider,
                            fit: BoxFit.cover,
                          ),)
                      ),
                    Positioned(
                      bottom: 0.h,
                      right: 0.w,
                      child: GestureDetector(
                        onTap: () async{
                          pickImage(); // Call the function to pick image
                           uploadImage();
                          User? user = FirebaseAuth.instance.currentUser;
                          if(imageUrl.isEmpty && imageFile!= null){
                            await uploadImage();
                          }
                          if(imageUrl.isNotEmpty){
                            await FirebaseFirestore.instance.collection('users').doc(user!.uid).update({
                              'image_url': imageUrl,
                            });
                          }

                        },
                        child: Container(
                          height: 4.h,
                          width: 8.w,
                          decoration: BoxDecoration(
                            //color: Colors.blue,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(Icons.camera_alt_outlined,color: Color(0xffFFA500),),
                        ),
                      ),
                    ),
                    //CircleAvatar(backgroundImage: AssetImage('assets/images/profile_pic.jpg'),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(userName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 3.h),),
              ),
              CustomProfileListTile(title: 'Account Details', icon: Icons.settings, onPress: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=> AccountDetailsScreen(userRole: userRole, userEmail: userEmail, userName: userName,)));
              }),
              CustomProfileListTile(title: 'Contact Information', icon: Icons.perm_contact_calendar_rounded, onPress: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => ContactInformation(userContact: userContact, userEmail: userEmail)));
              }),
              CustomProfileListTile(title: 'Privacy and Policy', icon: Icons.privacy_tip_outlined, onPress: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>PrivacyPolicyScreen()));
              }),
              CustomProfileListTile(title: 'Share', icon: Icons.share, onPress: (){}),
              CustomProfileListTile(title: 'Update Password', icon: Icons.password, onPress: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => UpdatePassword()));
              }),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> LoginForm()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomContainer(text: 'Logout', height: size*0.08),
                ),
              ),
              StreamBuilder(stream: FirebaseFirestore.instance.collection('users').snapshots(),
                  builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
                     return InkWell(
                       onTap: ()async{
                        deleteAccount();
                       },
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text('Delete Account',style: TextStyle(color: Color(0xffFFA500),fontSize: 3.h),),
                       ),
                     );
                  })
            ],
          ),
        ),
      ),
    );
  }
}