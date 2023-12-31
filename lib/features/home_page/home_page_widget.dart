import 'package:flutter/material.dart';
import 'package:upwork_client/core/core.dart';
import 'package:upwork_client/features/pages.dart';
import 'package:upwork_client/utils/utils.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({this.selectedPage, super.key});

  final int? selectedPage;

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  int _selectedTab = 2;
  WebViewScreen webViewScreen = WebViewScreen();

  @override
  void initState() {
    super.initState();
    if (widget.selectedPage != null) {
      _selectedTab = widget.selectedPage!;
    }
  }

  late final List<Widget> _pages = [
    const NotesScreen(),
    const ChatScreen(),
    JobsListScreen(updateScreenIndexToBrowser: _changeTabToBrowser),
    webViewScreen,
  ];

  final List<String> _titles = [
    'Notes',
    'Chats',
    'Jobs',
    'Browser',
  ];

  void _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  void _changeTabToBrowser(String url) {
    setState(() {
      _selectedTab = 3;
      webViewScreen.controller.loadRequest(Uri.parse(url));
    });
  }

  @override
  Widget build(BuildContext context) {
    return UpworkScaffold(
      appBar: UpworkAppBar(
        title: _titles[_selectedTab],
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label: 'Notes',
          ),
          BottomNavigationBarItem(
            icon: addSvgImage(
              ImagesAssets.chatsIcon,
              imageHeight: 25,
              imageWidth: 20,
              color: _selectedTab == 1 ? AppColors.green00 : AppColors.grey65,
            ),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: addSvgImage(
              ImagesAssets.jobsListIcon,
              imageHeight: 30,
              imageWidth: 25,
              color: _selectedTab == 2 ? AppColors.green00 : AppColors.grey65,
            ),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: addSvgImage(
              ImagesAssets.webViewIcon,
              imageHeight: 25,
              imageWidth: 20,
              color: _selectedTab == 3 ? AppColors.green00 : AppColors.grey65,
            ),
            label: 'Web',
          ),
        ],
        currentIndex: _selectedTab,
        onTap: _changeTab,
      ),
    );
  }
}
