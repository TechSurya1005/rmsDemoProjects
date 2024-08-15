import 'package:flutter/material.dart';
import 'package:rms_demo/Widgets/ProjectsDataTableView.dart';
import 'package:rms_demo/data/modal/projectsDataModel.dart';

class ProjectsView extends StatefulWidget {
  const ProjectsView({super.key});

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Projects",
          style: Theme.of(context).textTheme.labelLarge,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              )),
        ],
      ),
      body: ProjectDataTableView(
        projectsData: projectsData,
      ),
    );
  }
}
