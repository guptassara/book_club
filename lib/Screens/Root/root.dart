// ignore_for_file: no_leading_underscores_for_local_identifiers, implementation_imports

import 'dart:developer';

import 'package:book_club/Screens/Login/login.dart';
import 'package:book_club/Screens/home.dart';
import 'package:book_club/Screens/noGroup/noGroup.dart';
import 'package:book_club/Screens/splashScreen/splashScreen.dart';
import 'package:book_club/States/currentGroup.dart';
import 'package:book_club/States/current_user.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

enum AuthStatus {
  unknown,
  notLoggedIn,
  notInGroup,
  inGroup,
}

class OurRoot extends StatefulWidget {
  const OurRoot({super.key});

  @override
  State<OurRoot> createState() => _OurRootState();
}

class _OurRootState extends State<OurRoot> {
  AuthStatus _authStatus = AuthStatus.unknown;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String? _returnString = await _currentUser.onStartUp();
    log(_returnString as String);
    if (_returnString == "success") {
      if (_currentUser.getcurrentUser?.groupID != null) {
        setState(() {
          _authStatus = AuthStatus.inGroup;
        });
      } else {
        setState(() {
          _authStatus = AuthStatus.notInGroup;
        });
      }
    } else {
      setState(() {
        _authStatus = AuthStatus.notLoggedIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    late Widget retVal;
    switch (_authStatus) {
      case AuthStatus.unknown:
        retVal = const OurSplashScreen();
        break;
      case AuthStatus.notLoggedIn:
        retVal = const OurLogin();
        break;
      case AuthStatus.notInGroup:
        retVal = const OurNoGroup();
        break;
      case AuthStatus.inGroup:
        retVal = ChangeNotifierProvider(
            create: (context) {
              CurrentGroup();
            },
            child: const HomeScreen());
        break;
      default:
    }
    return retVal;
  }
}
