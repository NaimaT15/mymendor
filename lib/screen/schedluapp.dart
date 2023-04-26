import 'package:flutter/material.dart';
import '../model/user.dart';
import 'package:intl/intl.dart';

class HomeMaterial extends StatefulWidget {
  @override
  _HomeMaterialState createState() => _HomeMaterialState();
}

class _HomeMaterialState extends State {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _user = User();
  TextEditingController dateController = TextEditingController();
  @override
  void initState() {
    super.initState();
    dateController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    var dropdownValue;
    return Scaffold(
        appBar: AppBar(title: Text('Schedule Appointment')),
        body: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Builder(
                builder: (context) => Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'First name'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your first name';
                              }
                            },
                            onSaved: (val) =>
                                setState(() => _user.firstName = val!),
                          ),
                          TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Last name'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your last name.';
                                }
                              },
                              onSaved: (val) =>
                                  setState(() => _user.lastName = val!)),
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                            child: Text('Department'),
                          ),
                          DropdownButton<String>(
                            // Step 3.

                            // Step 4.
                            items: <String>[
                              'nigd fikad',
                              'maret astedadar',
                              'watatoch',
                              'ginbat fikad'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(fontSize: 20),
                                ),
                              );
                            }).toList(),
                            // Step 5.
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Selected Value: $dropdownValue',
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Container(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                  child: TextField(
                                controller: dateController,
                                decoration: const InputDecoration(
                                    icon: Icon(Icons.calendar_today),
                                    labelText: "Enter Date"),
                                readOnly: true,
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101),
                                  );
                                  if (pickedDate != null) {
                                    String formattedDate =
                                        DateFormat("yyyy-MM-dd")
                                            .format(pickedDate);

                                    setState(() {
                                      dateController.text =
                                          formattedDate.toString();
                                    });
                                  } else {
                                    print("Not selected");
                                  }
                                },
                              ))),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 16.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    final FormState? form =
                                        _formKey.currentState;
                                    if (form!.validate()) {
                                      form?.save();
                                      _user.save();
                                      _showDialog(context);
                                    }
                                  },
                                  child: const Text('Save'))),
                        ])))));
  }

  _showDialog(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("submitting form")));
  }
}
