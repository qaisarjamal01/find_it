import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/constants/constant_color.dart';
import '../dashboard_screen/home_screen.dart';

class UpdateProducts extends StatefulWidget {
  String itemName;
  String categoryName;
  String location;
  String date;
  String description;
  String docId;
    UpdateProducts({required this.docId, required this.description, required this.itemName,required this.categoryName,required this.location,required this.date, super.key});

  @override
  State<UpdateProducts> createState() => _UpdateProductsState();
}

class _UpdateProductsState extends State<UpdateProducts> {
  String imageUrl = '';
  // Function to upload lost item details to Firestore
  Future<void> UpdateProducts(
      String itemName,
      String categoryName,
      String location,
      String date,
      String description,
      ) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      // Handle unauthenticated user scenario
      print('No user is currently signed in.');
      return;
    }

    try {
      if(imageUrl.isNotEmpty){
        await FirebaseFirestore.instance.collection('lostItems').doc(widget.docId).update({
          'ItemName': itemName,
          'categoryName': categoryName,
          'location': location,
          'date': date,
          'description': description,
          'image_url' : imageUrl,
          // Add any other fields you need
        });
      }

      print('Lost item details uploaded successfully!');
    } on FirebaseException catch (e) {
      print('Failed to upload lost item details: $e');
      // Optionally, show an error message to the user
    }
  }
  // Function to open the date picker with previous month dates disabled
  Future<void> _selectDate(BuildContext context) async {
    final DateTime now = DateTime.now(); // Current date
    final DateTime firstDateOfCurrentMonth =
    DateTime(now.year, now.month, 1); // First day of current month

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      selectableDayPredicate: (DateTime date) {
        // Only allow dates from the current month onwards
        return date.isAfter(
            firstDateOfCurrentMonth.subtract(const Duration(days: 1)));
      },
    );

    if (picked != null && picked != now) {
      setState(() {
        // Update the controller with the selected date
        dateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  String? selectedCity; // Holds the selected value from the dropdown
  String? selectedCategory;
  bool isOtherSelected = false; // Determines if 'Other' is selected

  TextEditingController otherCityController =
  TextEditingController(); // Controller for "Other" input
  // Initialize the date controller
  TextEditingController dateController = TextEditingController();
  TextEditingController itemNameController = TextEditingController();
  // Removed categoryController and locationController as they're not used
  TextEditingController descriptionController = TextEditingController();
  //TextEditingController imageController = TextEditingController();

  @override
  void dispose() {
    // Dispose the controllers when the widget is destroyed to avoid memory leaks
    dateController.dispose();
    otherCityController.dispose();
    itemNameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    String? docId;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(widget.categoryName);
    return Scaffold(
      backgroundColor: ConstantColors.orangeShade,
      appBar: AppBar(
        title: Text(
          'Lost Post',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff003366),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(
                    context, MaterialPageRoute(builder: (_) => HomeScreen()));
              },
              child: Icon(
                Icons.home,
                color: Color(0xffFFFFFF),
              ),
            ),
          )
        ],
      ),
      body: Container(
        height: height * double.infinity,
        color: Color(0xffFFF3E0),
        child: SingleChildScrollView(
          child: Padding(
            padding:
            const EdgeInsets.all(8.0), // Added padding for better spacing
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Item Name
                Text('Enter lost Item Name'),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextFormField(
                    controller: itemNameController..text = widget.itemName,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.drive_file_rename_outline),
                      hintText: 'Item Name',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffFFA500)),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xffFFA500))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category Name
                      Text('Category Name'),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search_outlined),
                            hintText: 'Search Category',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffFFA500)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xffFFA500)),
                            ),
                          ),
                          value:  widget.categoryName , // Set initial value if needed
                          items: [
                            DropdownMenuItem(
                                value: 'Mobiles', child: Text('Mobiles')),
                            DropdownMenuItem(value: 'Bags', child: Text('Bags')),
                            DropdownMenuItem(
                                value: 'Watches', child: Text('Watches')),
                            DropdownMenuItem(
                                value: 'Others', child: Text('Others')),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedCategory = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Location
                      Text('Location'),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.location_on_outlined),
                            hintText: 'Select Location',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffFFA500)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xffFFA500)),
                            ),
                          ),
                          value: widget.location, // Set initial value if needed
                          items: [
                            DropdownMenuItem(
                                value: 'Peshawar', child: Text('Peshawar')),
                            DropdownMenuItem(
                                value: 'Islamabad', child: Text('Islamabad')),
                            DropdownMenuItem(
                                value: 'Karachi', child: Text('Karachi')),
                            DropdownMenuItem(
                                value: 'Quetta', child: Text('Quetta')),
                            DropdownMenuItem(
                                value: 'Lahore', child: Text('Lahore')),
                            DropdownMenuItem(
                                value: 'Other', child: Text('Other')),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedCity = value;
                              isOtherSelected = value == 'Other'; // Check if 'Other' is selected
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // "Other" City Input
                if (isOtherSelected)
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Enter City Name'),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: TextFormField(
                            controller: otherCityController,
                            decoration: InputDecoration(
                              hintText: 'Enter City Name',
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Color(0xffFFA500)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                BorderSide(color: Color(0xffFFA500)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                // Date Lost
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Date Lost'),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TextFormField(
                          controller: dateController..text = widget.date,
                          readOnly: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.date_range_outlined),
                            hintText: 'Select Date',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffFFA500)),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color(0xffFFA500))),
                          ),
                        //  initialValue: widget.date,
                          onTap: () {
                            _selectDate(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // Description
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Description'),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TextFormField(
                          controller: descriptionController..text = widget.description,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.description),
                            hintText: 'Description',
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Color(0xffFFA500)),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                BorderSide(color: Color(0xffFFA500))),
                          ),
                          maxLines: 3, // Optional: Allow multiple lines for description
                        ),
                      ),
                    ],
                  ),
                ),
                // Upload Image Button (Functionality not implemented)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0,left: 80),
                        child: Container(
                          height: height * 0.08,
                          width: width * 0.5,
                          decoration: BoxDecoration(
                            color: Color(0xffFFA500),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: ()async{
                                //image picker
                                ImagePicker imagePicker = ImagePicker();
                                XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
                                print(file!.path);

                                if(file == null)return;

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
                                  await imageToUpload.putFile(File(file.path));
                                  imageUrl = await imageToUpload.getDownloadURL();
                                  print(imageUrl);
                                }catch (e){
                                  print(e);
                                }

                                //add link to the specific user doc
                                FirebaseFirestore.instance.collection('lostItems').doc(docId.toString()).update(
                                    {
                                      'image': imageUrl,
                                    }).then((value) => {Get.back()});
                              },
                              child: Text(
                                'Upload Image',
                                style: TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 0.3.dp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Publish Button
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Center(
                    child: Container(
                      height: height * 0.08,
                      width: width * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Color(0xff003366),
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            // Validate required fields
                            if (itemNameController.text.trim().isEmpty) {
                              Get.snackbar('Error',
                                  'Please enter the item name.',
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white);
                              return;
                            }
                            // if (selectedCategory == null) {
                            //   Get.snackbar('Error',
                            //       'Please select a category.',
                            //       backgroundColor: Colors.red,
                            //       colorText: Colors.white);
                            //   return;
                            // }
                            // if (selectedCity == null) {
                            //   Get.snackbar('Error',
                            //       'Please select a location.',
                            //       backgroundColor: Colors.red,
                            //       colorText: Colors.white);
                            //   return;
                            // }
                            if (dateController.text.trim().isEmpty) {
                              Get.snackbar('Error',
                                  'Please select a date.',
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white);
                              return;
                            }
                            if (descriptionController.text.trim().isEmpty) {
                              Get.snackbar('Error',
                                  'Please enter a description.',
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white);
                              return;
                            }

                            // Determine the location
                            //String location;
                            // if (isOtherSelected) {
                            //   if (otherCityController.text.trim().isEmpty) {
                            //     Get.snackbar('Error',
                            //         'Please enter a city name.',
                            //         backgroundColor: Colors.red,
                            //         colorText: Colors.white);
                            //     return;
                            //   }
                            //   location = otherCityController.text.trim();
                            // } else {
                               String location = selectedCity!;
                            // }

                            // Call the LostItems function with all necessary data
                            UpdateProducts(
                              itemNameController.text.trim(),
                              selectedCategory!,
                              location,
                              dateController.text.trim(),
                              descriptionController.text.trim(),
                            ).then((_) {
                              // // Optionally, navigate the user to another screen or show a success message
                              // Get.snackbar('Success',
                              //     'Lost item details published successfully!',
                              //     backgroundColor: Colors.green,
                              //     colorText: Colors.white);
                              // Clear the form or navigate as needed
                              itemNameController.clear();
                              setState(() {
                                selectedCategory = null;
                                selectedCity = null;
                                isOtherSelected = false;
                              });
                              dateController.clear();
                              descriptionController.clear();
                              otherCityController.clear();
                            }).catchError((error) {
                              // Handle any errors
                              Get.snackbar('Error',
                                  'Failed to publish lost item details.',
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white);
                            });

                          },
                          child: Text(
                            'Update',
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 0.3.dp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

  }
}
