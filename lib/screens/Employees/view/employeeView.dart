import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rms_demo/Widgets/EmployeeDataTableView.dart';
import 'package:rms_demo/Widgets/employeeDataCard.dart';
import 'package:rms_demo/constant/color.dart';
import 'package:rms_demo/screens/Employees/viewModel/employeeViewModel.dart';
import 'package:rms_demo/utils/utils.dart';

import '../../../data/modal/employeeDataModel.dart';

class EmployeeView extends StatefulWidget {
  const EmployeeView({super.key});

  @override
  State<EmployeeView> createState() => _EmployeeViewState();
}

class _EmployeeViewState extends State<EmployeeView> {
  void _showAddEmployeeDialog() {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _userNameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _phoneNumberController =
        TextEditingController();
    final TextEditingController _designationController =
        TextEditingController();
    final TextEditingController _salaryController = TextEditingController();
    final TextEditingController _statusController = TextEditingController();
    int generateRandomNumber(int min, int max) {
      final random = Random();
      return min + random.nextInt(max - min);
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Add Employee",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          content: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: _nameController,
                  style: Theme.of(context).textTheme.labelSmall,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter employee name',
                    hintStyle: Theme.of(context).textTheme.labelSmall,
                    labelStyle: Theme.of(context).textTheme.labelSmall,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the employee name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _userNameController,
                  style: Theme.of(context).textTheme.labelSmall,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: 'Enter employee username',
                    hintStyle: Theme.of(context).textTheme.labelSmall,
                    labelStyle: Theme.of(context).textTheme.labelSmall,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the employee username';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  style: Theme.of(context).textTheme.labelSmall,
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter employee email',
                    hintStyle: Theme.of(context).textTheme.labelSmall,
                    labelStyle: Theme.of(context).textTheme.labelSmall,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the employee email';
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  style: Theme.of(context).textTheme.labelSmall,
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    hintText: 'Enter employee phone number',
                    hintStyle: Theme.of(context).textTheme.labelSmall,
                    labelStyle: Theme.of(context).textTheme.labelSmall,
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the employee phone number';
                    }
                    if (value.length < 10) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  style: Theme.of(context).textTheme.labelSmall,
                  controller: _designationController,
                  decoration: InputDecoration(
                    labelText: 'Designation',
                    hintText: 'Enter employee designation',
                    hintStyle: Theme.of(context).textTheme.labelSmall,
                    labelStyle: Theme.of(context).textTheme.labelSmall,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the employee designation';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  style: Theme.of(context).textTheme.labelSmall,
                  controller: _salaryController,
                  decoration: InputDecoration(
                    labelText: 'Salary',
                    hintText: 'Enter employee salary',
                    hintStyle: Theme.of(context).textTheme.labelSmall,
                    labelStyle: Theme.of(context).textTheme.labelSmall,
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the employee salary';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid salary amount';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  style: Theme.of(context).textTheme.labelSmall,
                  controller: _statusController,
                  decoration: InputDecoration(
                    labelText: 'Status',
                    hintText: 'Enter employee status',
                    hintStyle: Theme.of(context).textTheme.labelSmall,
                    labelStyle: Theme.of(context).textTheme.labelSmall,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the employee status';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: accentColor),
              ),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  employeeData.add(EmployeeDataModel(
                    id: employeeData.length + 1,
                    name: _nameController.text.toString(),
                    userName: _userNameController.text.toString(),
                    email: _emailController.text.toString(),
                    phoneNumber: _phoneNumberController.text.toString(),
                    designation: _designationController.text.toString(),
                    salary: _salaryController.text.toString(),
                    status: _statusController.text.toString(),
                  ));
                  Utils.toastMessage("Employees Details Saved", successColor);
                  setState(() {});
                  Navigator.of(context).pop();
                }
              },
              child: Text(
                'Save',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: accentColor),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final employeeController = Provider.of<EmployeeViewmodel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Employees",
          style: Theme.of(context).textTheme.labelLarge,
        ),
        actions: [
          IconButton(
              onPressed: () => _showAddEmployeeDialog(),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                employeeController.setIsGrid();
              },
              icon: Icon(
                employeeController.isGrid
                    ? Icons.table_chart_outlined
                    : Icons.list,
                color: Colors.white,
              ))
        ],
      ),
      body: employeeController.isGrid
          ? EmployeeDataTableView(employeeData: employeeData)
          : ListView.builder(
              itemCount: employeeData.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EmployeeDataCard(
                      id: employeeData[index].id.toString(),
                      name: employeeData[index].name.toString(),
                      userName: employeeData[index].userName.toString(),
                      email: employeeData[index].email.toString(),
                      phoneNumber: employeeData[index].phoneNumber.toString(),
                      designation: employeeData[index].designation.toString(),
                      salary: employeeData[index].salary.toString(),
                      status: employeeData[index].status.toString(),
                    ));
              },
            ),
    );
  }
}
