import 'package:chat_app/features/home/view/widgets/home_app_bar.dart';
import 'package:chat_app/features/home/view/widgets/home_text_filed.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      bottomNavigationBar: HomeTextFiled(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: test.length,
          itemBuilder: (context, index) {
            return Align(
              alignment: Alignment.centerLeft,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: test[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

List<Text> test = [
  Text("Hello World , how are you?"),
  Text("Hello  , how are you?"),
  Text("Hello World , how are ?"),
  Text("Hello World , how are you?"),
  Text(" World , how are you?"),
  Text("Hello World , how are you?"),
  Text("Hello Woryou?"),
  Text("Hello World , how are you?"),
  Text("Hello World , how are you?"),
  Text("Hel are you?"),
  Text("Hello  are you?"),
  Text("Hello World , how are you?"),
  Text("Hello Worre you?"),
  Text("Hello World , how are you?"),
  Text("Heow are you?"),
];
