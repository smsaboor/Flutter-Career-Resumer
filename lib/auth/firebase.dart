import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resume_creator/core/components.dart';

class FirebaseBackend {
  static String? _verificationId;
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static confirmMobileNumber(mobile) async {
    print('my mobile number is' + mobile);
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(mobile)
          .get();
      if (snapshot.exists) {
        print('snapshot is' + snapshot.exists.toString());
      } else {
        print('snapshot else is' + snapshot.exists.toString());
        await _auth.verifyPhoneNumber(
          phoneNumber: mobile,
          codeSent: (verificationId, forceResendingToken) {
            _verificationId = verificationId;
          },
          verificationCompleted: (phoneAuthCredential) {
            // signInWithPhone(phoneAuthCredential);
          },
          verificationFailed: (error) {
            // emit( AuthErrorState(error.message.toString()) );
          },
          codeAutoRetrievalTimeout: (verificationId) {
            _verificationId = verificationId;
          },
        );
      }
    } catch (e) {
      print('okay' + e.toString());
    }
  }

  static verifyOTP(String otp) async {
    print('otp----------$otp');
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!, smsCode: otp);
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (userCredential.user != null) {
        print('userCredential.user != null----------$otp');
      }
    } on FirebaseAuthException catch (error) {
      print("exception is : ${error.code.toString()}");
    }
  }

  static createResume(String uid, name) async {
    if (uid == '' || name == '') {
      showToast(msg: 'Uid or name is null');
      return;
    }
    await FirebaseFirestore.instance
        .collection("resumes")
        .doc(uid)
        .collection(uid)
        .doc()
        .set({"name": name}).then((value) {
      showToast(msg: 'Resume created');
    }).catchError((e) {
      showToast(msg: '$e Resume not created');
    });
  }

  static addPersonal(String uid, name, address, email, phone) async {
    if (uid == '' ||
        name == '' ||
        address == '' ||
        email == '' ||
        phone == '') {
      showToast(msg: 'Uid or name is null');
      return;
    }
    await FirebaseFirestore.instance
        .collection("personaldetails")
        .doc(uid)
        .collection(uid)
        .doc()
        .set({
      "name": name,
      "address": address,
      "email": email,
      "phone": phone
    }).then((value) {
      showToast(msg: 'Details Added');
    }).catchError((e) {
      showToast(msg: '$e Details not Added');
    });
  }

  static addEducation(String uid, course, school, grades, year) async {
    if (uid == '' ||
        course == '' ||
        school == '' ||
        grades == '' ||
        year == '') {
      showToast(msg: 'nothing entered');
      return;
    }
    await FirebaseFirestore.instance
        .collection("education")
        .doc(uid)
        .collection(uid)
        .doc()
        .set({
      "course": course,
      "school": school,
      "grades": grades,
      "year": year,
    }).then((value) {
      showToast(msg: 'Details Added');
    }).catchError((e) {
      showToast(msg: '$e Details not Added');
    });
  }

  static addExperience(
      String uid, company, jobtitle, startdate, enddate, details) async {
    if (uid == '' ||
        company == '' ||
        jobtitle == '' ||
        startdate == '' ||
        enddate == '' ||
        details == '') {
      showToast(msg: 'nothing entered');
      return;
    }
    await FirebaseFirestore.instance
        .collection("experience")
        .doc(uid)
        .collection(uid)
        .doc()
        .set({
      "company": company,
      "jobtitle": jobtitle,
      "startdate": startdate,
      "enddate": enddate,
      "details": details,
    }).then((value) {
      showToast(msg: 'Details Added');
    }).catchError((e) {
      showToast(msg: '$e Details not Added');
    });
  }

  static addSkills(String uid, details) async {
    if (uid == '' || details == '') {
      showToast(msg: 'nothing entered');
      return;
    }
    await FirebaseFirestore.instance
        .collection("skills")
        .doc(uid)
        .collection(uid)
        .doc()
        .set({
      "details": details,
    }).then((value) {
      showToast(msg: 'Skills Added');
    }).catchError((e) {
      showToast(msg: '$e Skills not Added');
    });
  }

  static addProject(String uid, title, descrition) async {
    if (uid == '' || title == '' || descrition == '') {
      showToast(msg: 'nothing entered');
      return;
    }
    await FirebaseFirestore.instance
        .collection("projects")
        .doc(uid)
        .collection(uid)
        .doc()
        .set({
      "title": title,
      "description": descrition,
    }).then((value) {
      showToast(msg: 'Skills Added');
    }).catchError((e) {
      showToast(msg: '$e Skills not Added');
    });
  }

  static addObjective(String uid, objective) async {
    if (uid == '' || objective == '') {
      showToast(msg: 'nothing entered');
      return;
    }
    await FirebaseFirestore.instance
        .collection("objective")
        .doc(uid)
        .collection(uid)
        .doc()
        .set({
      "objective": objective,
    }).then((value) {
      showToast(msg: 'Career Objective Added');
    }).catchError((e) {
      showToast(msg: '$e Career Objective not Added');
    });
  }
}
