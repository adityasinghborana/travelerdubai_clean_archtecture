import 'package:flutter/material.dart';

Container dataNotFound({required var width, required var height}) {
  return Container(
    margin: EdgeInsets.only(left:10,right: 32,bottom: 10,top:15),
    width: width*1.25,
    height: height,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text(
          'No Data Found\nadd Data',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF858D9D),
            fontSize: 15,
            fontFamily: 'Open Sans',
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    ),
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      shadows: [
        BoxShadow(
          color: Color(0x0C000000),
          blurRadius: 6,
          offset: Offset(0, 2),
          spreadRadius: 0,
        )
      ],
    ),
  );
}



Container emptyStateColumn({required var width, required var height}) {
  return Container(
    margin: EdgeInsets.all(10),
    width: width*1.25,
    height: height,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No Data Found\nadd Data',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF858D9D),
            fontSize: 15,
            fontFamily: 'Open Sans',
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    ),
  );
}




Container loadingStateColumn({required var width, required var height}) {
  return Container(
    margin: EdgeInsets.all(10),
    width: width*1.25,
    height: height,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Container(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(
              color: Color(0xff7A992D)
          ),
        ),
      ],
    ),
  );
}

Container errorStateColumn({required var width, required var height}) {
  return Container(
    margin: EdgeInsets.all(10),
    width: width*1.25,
    height: height,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Oops\nSomething went wrong',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF858D9D),
            fontSize: 15,
            fontFamily: 'Open Sans',
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    ),
  );
}