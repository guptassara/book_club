import 'package:book_club/Screens/Login/login.dart';
import 'package:book_club/Screens/home.dart';
import 'package:book_club/States/current_user.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

enum AuthStatus {
  notLoggedIn,
  loggedIn,
}

class OurRoot extends StatefulWidget {
  const OurRoot({super.key});

  @override
  State<OurRoot> createState() => _OurRootState();
}

class _OurRootState extends State<OurRoot> {
  AuthStatus _authStatus = AuthStatus.notLoggedIn;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String? _returnString = await _currentUser.onStartUp();
    if (_returnString == "success") {
      setState(() {
        _authStatus = AuthStatus.loggedIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    late Widget retVal;
    switch (_authStatus) {
      case AuthStatus.notLoggedIn:
        retVal = const OurLogin();
        break;
      case AuthStatus.loggedIn:
        retVal = const HomeScreen();
        break;
      default:
    }
    return retVal;
  }
}
