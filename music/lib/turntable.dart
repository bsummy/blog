
import 'package:flutter/material.dart';

class Turntable extends StatelessWidget {
  final Disk? disk1;
  final Disk? disk2;

  const Turntable({super.key, this.disk1, this.disk2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 200,
      child : Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.grey[800],
      ),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DiskSection(disk: disk1),
          DiskSection(disk: disk2),
        ],
      ),
      ),

    );
  }
}

class DiskSection extends StatelessWidget {
  final Disk? disk;

  const DiskSection({super.key, this.disk});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[700],
      ),
      child: Center(
        child: Text(
          disk?.name ?? 'Empty',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class Disk {
  final String name;

  Disk(this.name);
}
