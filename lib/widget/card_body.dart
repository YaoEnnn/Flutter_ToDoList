import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
   CardBody({
    super.key, required this.item, required this.deleteTask, required this.index
  });

   int index;
   final Function deleteTask;
   var item;

   void onDeleteClick(int id){
     deleteTask(id);
   }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      width: 400,
      height: 70,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2, // Bán kính màu bóng
              blurRadius: 9,
              offset: const Offset(0, 5) // Độ mờ của bóng
          )
        ],
        color: index.isEven ? const Color(0xFFDFDFDF) : const Color(0xFFFFE0BD),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(item.name,
              style: const TextStyle(
                color: Color(0xff4b4b4b),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: () async {
                if (await confirm(
                    context, 
                    content: Text('Are You Sure Want To Delete Task?',
                      style: TextStyle(
                        fontSize: 20,
                      ),),
                    textOK: Text('DELETE'),
                    textCancel: Text('CANCEL')
                    
                )
                ) 
                {
                  return onDeleteClick(item.id);
                }
                  return;
              },
              child: const Icon(
                Icons.delete_outline,
                size: 30,),
            ),
          ],
        ),
      ),
    );
  }
}