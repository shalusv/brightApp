import 'package:bright_ui/datas/projectData.dart';
import 'package:bright_ui/models/project.dart';
import 'package:bright_ui/screens/admin/projectViewScreen.dart';
import 'package:flutter/material.dart';
import 'addNewProject.dart';

class AdminProjectScreen extends StatelessWidget {
  final String headerName;
  final int selectPage = 0;
  AdminProjectScreen({this.headerName});

  @override
  Widget build(BuildContext context) {
    print(headerName);
    List<Object> pages = [
      // AdminScreen(),
    ];
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(headerName),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddNewProject(),
                ));
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
          bottom: TabBar(
            // isScrollable: true,
            tabs: [
              Tab(
                child: Text(
                  'All',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'On Going',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 12,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Completed',
                  style: TextStyle(
                    color: Colors.greenAccent[400],
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddNewProject(),
            ));
          },
          icon: Icon(Icons.add),
          label: Text('Add New Project'),
        ),
        body: TabBarView(
          children: [
            _listFilter("All"),
            _listFilter("On Going"),
            _listFilter("Completed"),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}

_listFilter(String status) {
  List<Project> filteredProject = [];
  projectList.forEach((project) {
    if (status == 'All') {
      filteredProject.add(project);
    } else {
      if (project.status == status) {
        filteredProject.add(project);
      }
    }
  });

  return Container(
    padding: EdgeInsets.all(10),
    child: Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: filteredProject.length,
              itemBuilder: (context, index) {
                Project project = filteredProject[index];
                return InkWell(
                  onTap: () {
                    print('Tapped to ${project.title}');
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProjectViewScreen(
                          project: project,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: ListTile(
                      leading: Text('${index + 2}'),
                      title: Text(project.title),
                      subtitle: Text(project.id),
                      trailing: GestureDetector(
                        onTap: () {
                          print("object");
                        },
                        child: PopupMenuButton(
                          icon: Icon(
                            Icons.more_vert,
                            size: 20,
                            color: Colors.blue,
                          ),
                          itemBuilder: (context) => [
                            PopupMenuItem<String>(
                              value: project.id,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.remove_red_eye,
                                    size: 15,
                                  ),
                                  Text(
                                    'View Project',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: project.id,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.edit,
                                    size: 15,
                                  ),
                                  Text(
                                    'Edit Project',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: project.id,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.delete,
                                    size: 15,
                                  ),
                                  Text(
                                    'Delete from List',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    ),
  );
}
