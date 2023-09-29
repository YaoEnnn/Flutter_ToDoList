import 'package:flutter/material.dart';

class ModalBottom extends StatelessWidget {
   ModalBottom({
    super.key, required this.addTask,
  });

  final Function addTask;

  String inputValue = '';

  void _onAddClick(BuildContext context){
    if(inputValue.isEmpty){
      return;
    }
    addTask(inputValue);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SizedBox(
        height: 200,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 30, left: 35, right: 35),
          child: Column(
            children: [
              TextField(
                onChanged: (value){
                  inputValue = value;
                },
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  hintText: "Your Task",
                  hintStyle: const TextStyle(
                      color: Color(0xFFDFDFDF),
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.transparent)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.transparent)
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed:() => _onAddClick(context),
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(400, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )
                ),
                child: const Text('Add Task',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
