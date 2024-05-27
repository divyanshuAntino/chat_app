import 'package:chatapp/common/service/sharePreference.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  customSharePreference customPref = customSharePreference();
  final googleSignIn = GoogleSignIn();
  Future<UserCredential?> SignUpWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      UserCredential userCredentail =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredentail;
    } else {
      return null;
    }
  }

  void logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    customPref.readData('logIn');
    print("Logout successfully");
  }

  Future<bool> checkUserId(String userId) async {
    try {
      // Access your Firestore collection
      CollectionReference users =
          FirebaseFirestore.instance.collection('user_loggedIn_through_google');

      // Retrieve the document containing the array
      DocumentSnapshot documentSnapshot = await users.doc('divya2003').get();

      // Check if the document exists and the array is present
      if (documentSnapshot.exists) {
        // Cast the data to Map<String, dynamic>
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;

        // Check if the 'userIds' field exists and is a List<dynamic>
        if (data.containsKey('logged') && data['logged'] is List<dynamic>) {
          // Cast the 'userIds' field to List<dynamic>
          List<dynamic> userIds = data['logged'] as List<dynamic>;

          // Check if the userId is present in the array
          if (userIds.contains(userId)) {
            print('User ID $userId is present in the array.');
            return true;
          } else {
            print('User ID $userId is not present in the array.');
          }
        } else {
          print('Field "userIds" does not exist or is not a List<dynamic>.');
        }
      } else {
        print('Document does not exist.');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
    return false;
  }

  Future<void> addUserToUserIds(String userId) async {
    try {
      // Access your Firestore collection
      CollectionReference users =
          FirebaseFirestore.instance.collection('user_loggedIn_through_google');

      // Retrieve the document containing the array
      DocumentReference docRef = users.doc('divya2003');
      DocumentSnapshot documentSnapshot = await docRef.get();

      // Check if the document exists
      if (documentSnapshot.exists) {
        // Get the current array
        List<dynamic> userIds =
            (documentSnapshot.data() as Map<String, dynamic>)['logged'];

        // Modify the array (add userId if not already present)
        if (!userIds.contains(userId)) {
          userIds.add(userId);
        }

        // Update the document with the modified array
        await docRef.update({'logged': userIds});

        print('User ID $userId added to the array.');
      } else {
        print('Document does not exist.');
      }
    } catch (error) {
      print('Error updating data: $error');
    }
  }
}
