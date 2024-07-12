import 'package:flutter/material.dart';

class DonationForm extends StatefulWidget {
  @override
  _DonationFormState createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usnController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _numDonationsController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  String _gender = 'Male';
  String _bloodGroup = 'A+';
  String _plateletsDonated = 'No';
  String _medicalCondition = 'No';
  String _smokingDrinking = 'No';
  String _willDonate = 'No';
  DateTime? _lastDonationDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Blood Donation Form')),
      body: Container(
        color: Colors.red[50],
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email ID'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name of Donor'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _usnController,
                decoration: InputDecoration(labelText: 'USN'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter your USN';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Donor Age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter your age';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField(
                value: _gender,
                items: ['Male', 'Female', 'Non-Binary']
                    .map((label) => DropdownMenuItem(
                          child: Text(label),
                          value: label,
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() => _gender = value as String);
                },
                decoration: InputDecoration(labelText: 'Donor Gender'),
              ),
              DropdownButtonFormField(
                value: _bloodGroup,
                items: ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-']
                    .map((label) => DropdownMenuItem(
                          child: Text(label),
                          value: label,
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() => _bloodGroup = value as String);
                },
                decoration: InputDecoration(labelText: 'Donor Blood Group'),
              ),
              TextFormField(
                controller: _mobileController,
                decoration: InputDecoration(labelText: 'Donor Mobile Number'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter your mobile number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _pincodeController,
                decoration: InputDecoration(labelText: 'Address Pin Code'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter your pin code';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField(
                value: _plateletsDonated,
                items: ['Yes', 'No']
                    .map((label) => DropdownMenuItem(
                          child: Text(label),
                          value: label,
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() => _plateletsDonated = value as String);
                },
                decoration: InputDecoration(labelText: 'Have you donated platelets?'),
              ),
              TextFormField(
                controller: _numDonationsController,
                decoration: InputDecoration(labelText: 'Number of Donations'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter the number of donations';
                  }
                  return null;
                },
              ),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(labelText: 'Last Date of Donation'),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _lastDonationDate = pickedDate;
                    });
                  }
                },
                validator: (value) {
                  if (_lastDonationDate == null) {
                    return 'Please pick a date';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField(
                value: _medicalCondition,
                items: ['Yes', 'No']
                    .map((label) => DropdownMenuItem(
                          child: Text(label),
                          value: label,
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() => _medicalCondition = value as String);
                },
                decoration: InputDecoration(labelText: 'Are you under any medical condition?'),
              ),
              DropdownButtonFormField(
                value: _smokingDrinking,
                items: ['Yes', 'No']
                    .map((label) => DropdownMenuItem(
                          child: Text(label),
                          value: label,
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() => _smokingDrinking = value as String);
                },
                decoration: InputDecoration(labelText: 'Drinking and smoking?'),
              ),
              DropdownButtonFormField(
                value: _willDonate,
                items: ['Yes', 'No']
                    .map((label) => DropdownMenuItem(
                          child: Text(label),
                          value: label,
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() => _willDonate = value as String);
                },
                decoration: InputDecoration(labelText: 'Will you donate blood if you stay close to needy?'),
              ),
              TextFormField(
                controller: _experienceController,
                decoration: InputDecoration(labelText: 'Write a few lines about your blood donation experience'),
                maxLines: 3,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Handle form submission here
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Form submitted successfully')));
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
