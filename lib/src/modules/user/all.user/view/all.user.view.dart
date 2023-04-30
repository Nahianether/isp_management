import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../components/bottom.navbar/bottom.navbar.dart';
import '../../../../constants/constants.dart';
import '../../../../extensions/extensions.dart';
import '../../add.new.user/view/add.new.user.dart';
import '../../user.details/view/user.details.dart';

import '../../../../components/app.bar/appbar.dart';
import '../../../../theme/themes/themes.dart';

String dropdownValue = 'Paid';

class AllUserView extends StatefulWidget {
  const AllUserView({Key? key}) : super(key: key);

  @override
  State<AllUserView> createState() => _AllUserViewState();
}

class _AllUserViewState extends State<AllUserView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppbar(
            title: 'All User List',
            isAllUser: true,
            allRecipents: recipents,
            message: message),
      ),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () async {
                await context.push(const UserDetails());
              },
              borderRadius: BorderRadius.circular(10),
              child: Card(
                child: ListTile(
                  title: Text('Abdur Rahman Kaderi$index'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.phone,
                            size: 14,
                            color: Colors.grey,
                          ),
                          Text('+880-172432483$index'),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 14,
                            color: Colors.grey,
                          ),
                          Text('Kashinathpur$index'),
                        ],
                      ),
                    ],
                  ),
                  // trailing: DropdownButton<String>(
                  //   value: dropdownValue,
                  //   icon: const Icon(Icons.arrow_drop_down),
                  //   iconSize: 24,
                  //   onChanged: (String? newValue) {
                  //     setState(() {
                  //       dropdownValue = newValue!;
                  //     });
                  //   },
                  //   items: <String>['Paid', 'Unpaid']
                  //       .map<DropdownMenuItem<String>>((String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: Text(value),
                  //     );
                  //   }).toList(),
                  // ),
                  trailing: IconButton(
                    icon: const Icon(Icons.payment_rounded),
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (context) {
                          return const PaymnetPopup(
                            amount: 500,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const KBottomNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.push(const AddNewUser());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class PaymnetPopup extends StatelessWidget {
  const PaymnetPopup({
    super.key,
    this.amount,
  });

  final double? amount;

  @override
  Widget build(BuildContext context) {
    DateTime? picker;
    return AlertDialog(
      title: const Text('Payment Popup'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 5.0),
            child: Text(
              'Paid Amount: ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: TextEditingController(text: amount.toString()),
            decoration: inputDecoration.copyWith(
              hintText: 'Amount',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: InkWell(
              onTap: () async {
                picker = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2025),
                );
              },
              child: Text(
                DateFormat('dd MMMM, yyyy').format(picker ?? DateTime.now()),
              ),
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () async {
            context.pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () async {},
          child: const Text('Done'),
        )
      ],
    );
  }
}
