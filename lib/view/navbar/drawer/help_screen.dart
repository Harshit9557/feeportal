import 'dart:convert';

import 'package:bubble/bubble.dart';
import 'package:feeportal/app/constants/color_constants.dart';
import 'package:feeportal/app/constants/url_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HelpMainScreen extends StatefulWidget {
  const HelpMainScreen({Key? key}) : super(key: key);

  @override
  State<HelpMainScreen> createState() => _HelpMainScreenState();
}

class _HelpMainScreenState extends State<HelpMainScreen> {
  final queryController = TextEditingController();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  bool isTextFieldHovered = false;
  List<String> _data = [];

  _send(String query) async {
    if (query.isNotEmpty) {
      _data.add(query);
      _listKey.currentState?.insertItem(_data.length - 1);
      queryController.clear();
      var client = http.Client();
      try {
        await client.post(
          Uri.parse(chatBotURL),
          body: {"query": query},
        ).then((response) {
          Map<String, dynamic> data = jsonDecode(response.body);
          _data.add(
            "${data['responce']}<bot>",
          );
          _listKey.currentState?.insertItem(_data.length - 1);
        });
      } catch (e) {
        print(e.toString());
      } finally {
        client.close();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: (defaultTargetPlatform == TargetPlatform.iOS ||
                defaultTargetPlatform == TargetPlatform.android)
            ? Padding(
                padding: const EdgeInsets.only(left: 20),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              )
            : null,
        titleSpacing: 0,
        title: const Text(
          'Quick Support',
        ),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: AnimatedList(
              key: _listKey,
              initialItemCount: _data.length,
              itemBuilder: (context, index, Animation<double> animation) {
                return buildItem(
                  _data[index],
                  animation,
                  index,
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset.zero,
                    blurRadius: 4,
                    spreadRadius: 4,
                    color: Colors.grey.shade200,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      textInputAction: TextInputAction.send,
                      cursorColor: kSplashScreenColor,
                      keyboardType: TextInputType.text,
                      controller: queryController,
                      validator: (value) {
                        if (value!.isEmpty || value == null) {
                          return 'Please Enter Your Email ID';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter Your Query',
                        hintStyle: TextStyle(
                          color: kTextColor.withOpacity(0.5),
                          fontSize: 13,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.zero,
                          gapPadding: 10,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.zero,
                          gapPadding: 10,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.zero,
                          gapPadding: 10,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () => _send(queryController.text),
                    child: Container(
                      height: 35,
                      width: 80,
                      padding: const EdgeInsets.only(left: 3),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kButtonColor,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget buildItem(String item, Animation<double> animation, int index) {
  bool botResponse = item.endsWith('<bot>');
  return SizeTransition(
    sizeFactor: animation,
    child: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        alignment: botResponse ? Alignment.topLeft : Alignment.topRight,
        child: Bubble(
          padding: const BubbleEdges.all(10),
          color: botResponse ? kSplashScreenColor : kButtonColor,
          child: Text(
            item.replaceAll("<bot>", ""),
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}
