import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/order_provider.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../widgets/small_padding.dart';

class AddNoteToOrderScreen extends StatefulWidget {
  const AddNoteToOrderScreen({super.key});

  @override
  State<AddNoteToOrderScreen> createState() => _AddNoteToOrderScreenState();
}

class _AddNoteToOrderScreenState extends State<AddNoteToOrderScreen> {
  late TextEditingController _noteController;
  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController();
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note to Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _noteController,
                  maxLines: null,
                  minLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Enter your note here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kRadius),
                    ),
                  ),
                ),
                paddingVertical,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kRadius),
                    ),
                  ),
                  onPressed: () {
                    Provider.of<OrderProvider>(context, listen: false).setDetail(_noteController.text);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Save',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
