import 'package:flutter/material.dart';
import '../Screens/TaskScreen.dart';
import '../Screens/MapScreen.dart';
import '../Screens/HistoriquesScreen.dart';
import '../Screens/ProfileScreen.dart';

class CostumNavBar extends StatelessWidget {
  const CostumNavBar({Key? key, required this.index, required this.routeData})
      : super(key: key);
  final int index;
  final Map<String, dynamic> routeData;

  List<Widget> _listOfScreens(BuildContext context) {
    List<String> poubelleAddresses = [];
    String depotAddress = '';

    if (routeData.isNotEmpty &&
        routeData['data'] != null &&
        routeData['data']['routes'] != null &&
        routeData['data']['routes'].isNotEmpty) {
      depotAddress = routeData['data']['routes'][0]['route'][0]['from'];
      poubelleAddresses = List<String>.from(routeData['data']['routes'][0]
              ['route']
          .map((segment) => segment['to']));

      if (poubelleAddresses.isNotEmpty) {
        poubelleAddresses =
            poubelleAddresses.sublist(0, poubelleAddresses.length - 1);
      }
    }
    return [
      TaskScreen(
          title: 'Task Title',
          date: '2023-01-01',
          startTime: '08:00',
          estimatedEndTime: '10:00',
          adresseDepot: depotAddress,
          adressePoubelle: poubelleAddresses,
          routeData: routeData),
      MapScreen(routeData: routeData),
      HistoriquesScreen(routeData: routeData),
      ProfileScreen(
        image: "lib/UI/Assets/Images/img_5.png",
        full_name: "Jane D",
        routeData: routeData,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 63,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon:
                  Icon(index == 0 ? Icons.home : Icons.home_outlined, size: 27),
              backgroundColor: const Color.fromARGB(255, 77, 166, 36),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(index == 1 ? Icons.map : Icons.map_outlined, size: 27),
              backgroundColor: const Color.fromARGB(255, 77, 166, 36),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(index == 2 ? Icons.archive : Icons.archive_outlined,
                  size: 27),
              backgroundColor: const Color.fromARGB(255, 77, 166, 36),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  index == 3 ? Icons.person : Icons.perm_identity_outlined,
                  size: 27),
              backgroundColor: const Color.fromARGB(255, 77, 166, 36),
              label: "",
            ),
          ],
          onTap: (value) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => _listOfScreens(context)[value]),
            );
          },
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          backgroundColor: const Color.fromRGBO(1, 113, 75, 1),
          currentIndex: index,
        ),
      ),
    );
  }
}