import 'package:flutter/material.dart';
import 'package:mvc/controllers/team_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Teams'),
        centerTitle: true,
      ),
      body: Consumer<TeamController>(builder: (context, team, child) {
        return FutureBuilder(
          future: team.fetchTeams(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Padding(
                padding: const EdgeInsets.all(15),
                child: ListView.builder(
                  itemCount: team.teams.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(child: Text('Team Id : ${team.teams[index].id.toString()}')),
                            Text('Name${team.teams[index].name!}'),
                            Text('Full Name : ${team.teams[index].fullName!}'),
                            Text('Division : ${team.teams[index].division!}'),
                            Text('City : ${team.teams[index].city!}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },
        );
      }),
    );
  }
}
