import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication{

  static Future<bool> signIn(String emailAddress ,String password)async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      log(credential.user!.email!);
      return Future.value(credential.user!=null ?true:false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return Future.value(false);
    } catch (e) {
      print(e);
      return Future.value(false);

    }
  }

  static Future register(String userName ,String emailAddress,String password,String phoneNumber )async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      ).then((value)async {
        log("${value.user?.uid}",);
        await FirebaseFirestore.instance.collection("users").doc(value.user?.uid).set(
          {
            "userName":userName,
            "phoneNumber":phoneNumber,
            "email":emailAddress,
            "about":"",
            "id":value.user?.uid,
          }
        );
        return true;
      }
          ,onError: (err){
            log(err.toString());
            return false;
          }
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return false;
      } else if (e.code == 'email-already-in-use') {

        print('The account already exists for that email.');
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}