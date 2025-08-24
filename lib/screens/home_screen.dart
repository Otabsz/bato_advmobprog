import '../screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import 'article_screen.dart';
import '../widgets/custom_text.dart';
 
class HomeScreen extends StatefulWidget {
  final String username;
  const HomeScreen({super.key, this.username = ''});
 
  @override
  State<HomeScreen> createState() => HomeScreenState();
}
 
class HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final PageController pageController = PageController();
 
  @override
  Widget build(BuildContext context) {
    context.watch<ThemeProvider>();
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        title: CustomText(     
          text: (selectedIndex == 0) ? 'Articles' : 'Home',
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const settings_screen(),
                ),
              );
            },
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        children: const <Widget>[ArticleScreen(), Placeholder(), Placeholder()],
        onPageChanged: (page) {
          setState(() {
            selectedIndex = page;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: onTappedBar,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: selectedIndex,
      ),
    );
  }
 
  void onTappedBar(int value) {
    setState(() {
      selectedIndex = value;
    });
    pageController.jumpToPage(value);
  }
}