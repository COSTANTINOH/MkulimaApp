import 'package:flutter/material.dart';

class NewChatBottomSheet extends StatelessWidget {
  var readBy = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(
            bottom: 2,
            right: 10,
            left: 10,
            top: 2,
          ),
          child: GestureDetector(
            onTap: () async => {},
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 2.0), //(x,y)
                    blurRadius: 3.0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/user.png"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Mauzo Na Wateja",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
