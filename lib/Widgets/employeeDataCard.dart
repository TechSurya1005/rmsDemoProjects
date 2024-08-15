import 'package:flutter/material.dart';

import '../constant/color.dart';

class EmployeeDataCard extends StatelessWidget {
  final String? id;
  final String? name;
  final String? userName;
  final String? email;
  final String? phoneNumber;
  final String? designation;
  final String? salary;
  final String? status;
  final VoidCallback? onTap;

  const EmployeeDataCard({
    super.key,
    this.id,
    this.name,
    this.userName,
    this.email,
    this.phoneNumber,
    this.designation,
    this.salary,
    this.status,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryDarkColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            color: Colors.grey.shade300,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildRow(context, "ID", id ?? "N/A"),
            const SizedBox(height: 10),
            _buildRow(context, "Name", name ?? "N/A"),
            const SizedBox(height: 10),
            _buildRow(context, "Username", userName ?? "N/A"),
            const SizedBox(height: 10),
            _buildRow(context, "Email", email ?? "N/A"),
            const SizedBox(height: 10),
            _buildRow(context, "Phone Number", phoneNumber ?? "N/A"),
            const SizedBox(height: 10),
            _buildRow(context, "Designation", designation ?? "N/A"),
            const SizedBox(height: 10),
            _buildRow(context, "Salary", salary ?? "N/A"),
            const SizedBox(height: 10),
            _buildRow(context, "Status", status ?? "N/A"),
            const SizedBox(height: 10),
            InkWell(onTap: onTap, child: _buildEditButton(context)),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(BuildContext context, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }

  Widget _buildEditButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "",
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: errorColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.edit,
                  size: 16,
                ),
                const SizedBox(height: 10),
                Text(
                  "Edit",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
