import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_training/home_view.dart';

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.grey.shade300,
    gravity: ToastGravity.CENTER,
    textColor: Colors.black,
  );
}

registerUser(String email, String password) {
  FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
}

loginUser(String email, String password) {
  FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password);
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

void navigatotToHome(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => const HomeView(),
  ));
}

const String facebookIcon =
    '''<svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
<path style="fill:#2196F3;" d="M320,85.333h64c5.891,0,10.667-4.776,10.667-10.667v-64C394.667,4.776,389.891,0,384,0h-64
	c-64.772,0.071-117.263,52.561-117.333,117.333V192H128c-5.891,0-10.667,4.776-10.667,10.667v64c0,5.891,4.776,10.667,10.667,10.667
	h74.667v224c0,5.891,4.776,10.667,10.667,10.667h64c5.891,0,10.667-4.776,10.667-10.667v-224h74.667
	c4.589-0.003,8.662-2.942,10.112-7.296l21.333-64c1.862-5.589-1.16-11.629-6.749-13.491c-1.084-0.361-2.22-0.546-3.363-0.547h-96
	v-74.667C288,99.66,302.327,85.333,320,85.333z"/>
</svg>''';

const String googleIcon =
    '''<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
<path style="fill:#FBBB00;" d="M113.47,309.408L95.648,375.94l-65.139,1.378C11.042,341.211,0,299.9,0,256
	c0-42.451,10.324-82.483,28.624-117.732h0.014l57.992,10.632l25.404,57.644c-5.317,15.501-8.215,32.141-8.215,49.456
	C103.821,274.792,107.225,292.797,113.47,309.408z"/>
<path style="fill:#518EF8;" d="M507.527,208.176C510.467,223.662,512,239.655,512,256c0,18.328-1.927,36.206-5.598,53.451
	c-12.462,58.683-45.025,109.925-90.134,146.187l-0.014-0.014l-73.044-3.727l-10.338-64.535
	c29.932-17.554,53.324-45.025,65.646-77.911h-136.89V208.176h138.887L507.527,208.176L507.527,208.176z"/>
<path style="fill:#28B446;" d="M416.253,455.624l0.014,0.014C372.396,490.901,316.666,512,256,512
	c-97.491,0-182.252-54.491-225.491-134.681l82.961-67.91c21.619,57.698,77.278,98.771,142.53,98.771
	c28.047,0,54.323-7.582,76.87-20.818L416.253,455.624z"/>
<path style="fill:#F14336;" d="M419.404,58.936l-82.933,67.896c-23.335-14.586-50.919-23.012-80.471-23.012
	c-66.729,0-123.429,42.957-143.965,102.724l-83.397-68.276h-0.014C71.23,56.123,157.06,0,256,0
	C318.115,0,375.068,22.126,419.404,58.936z"/>
</svg>''';
