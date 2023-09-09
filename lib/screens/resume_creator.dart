import 'package:flutter/material.dart';

class Creator {
  Creator({required this.icon, required this.name, required this.route});
  String name;
  Icon icon;
  String route;
}

final List<Creator> creators = [
  Creator(
      icon: const Icon(Icons.accessibility),
      name: 'Personal details',
      route: 'personaldetails'),
  Creator(
      icon: const Icon(Icons.account_circle),
      name: 'Education',
      route: 'education'),
  Creator(icon: const Icon(Icons.air), name: 'Experience', route: 'experience'),
  Creator(
      icon: const Icon(Icons.account_box), name: 'Projects', route: 'projects'),
  Creator(icon: const Icon(Icons.face), name: 'Skills', route: 'skills'),
  Creator(
      icon: const Icon(Icons.table_bar),
      name: 'Cover letter',
      route: 'coverletter'),
  Creator(
      icon: const Icon(Icons.headphones),
      name: 'Objective',
      route: 'objective'),
];

class ResumeCreator extends StatefulWidget {
  const ResumeCreator({super.key});
  @override
  State<ResumeCreator> createState() {
    return _ResumeCreatorState();
  }
}

class _ResumeCreatorState extends State<ResumeCreator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: ListView.builder(
          itemCount: creators.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(4),
              child: Material(
                borderRadius: BorderRadiusDirectional.circular(7),
                elevation: 2,
                shadowColor: Colors.blueGrey,
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, creators[index].route);
                  },
                  leading: creators[index].icon,
                  title: Text(
                    creators[index].name,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 33, 138, 243),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
