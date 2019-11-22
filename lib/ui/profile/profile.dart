import 'package:dear_diary/models/user.dart';
import 'package:dear_diary/notifiers/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    User userProfile = Provider.of<UserModel>(context).userProfile;
    return SafeArea(
      child: SingleChildScrollView(
        child: userProfile != null
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: 100,
                        margin: EdgeInsets.only(bottom: 40.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.blueGrey.shade600,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(13, 51, 32, 0.1),
                              offset: Offset(0.0, 6.0),
                              blurRadius: 10.0,
                            ),
                          ],
                        ),
                        child: Text(
                          userProfile.fullName[0],
                          style: TextStyle(color: Colors.white, fontSize: 32.0),
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 20.0),
                            margin: EdgeInsets.only(bottom: 40.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(13, 51, 32, 0.1),
                                  offset: Offset(0.0, 6.0),
                                  blurRadius: 10.0,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(bottom: 10.0),
                                  child: Text(
                                    'What I call you',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 20.0),
                                  child: Text(
                                    userProfile.fullName,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10.0),
                                  child: Text(
                                    'How I reach you',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 20.0),
                                  child: Text(
                                    userProfile.email,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 20.0),
                            margin: EdgeInsets.only(bottom: 40.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(13, 51, 32, 0.1),
                                  offset: Offset(0.0, 6.0),
                                  blurRadius: 10.0,
                                ),
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(bottom: 10.0),
                                  child: Text(
                                    'Total Entries',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 20.0),
                                  padding: EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                      color: Color(0xFF3C4858).withOpacity(0.2),
                                      shape: BoxShape.circle),
                                  child: Text(
                                    userProfile.entryCount,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      width: MediaQuery.of(context).size.width * .9,
                      height: 50,
                      child: RaisedButton(
                        color: Color(0xFF3C4858),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        onPressed: () {},
                        child: Text(
                          'LOG OUT',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : null,
      ),
    );
  }

  void getUserProfile() {
    Provider.of<UserModel>(context, listen: false).getUserProfile();
  }
}
