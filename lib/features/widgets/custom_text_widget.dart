import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  CustomTextInput({required this.onTap, required this.isEnabled, super.key});

  Function(String) onTap;
  bool isEnabled;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: const EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 3),
                      blurRadius: 5,
                      color: Colors.grey,
                    ),
                  ],
                ),
                child: Expanded(
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
                      hintText: 'Type Something...',
                      hintStyle: TextStyle(color: Colors.blueAccent),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: isEnabled ? Colors.blueAccent : Colors.grey,
                shape: BoxShape.circle,
              ),
              child: InkWell(
                onTap: isEnabled
                    ? () {
                  if (controller.text != null &&
                      controller.text.isNotEmpty) {
                    onTap(controller.text);
                    controller.text = '';
                  }
                }
                    : () {},
                child: const Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}