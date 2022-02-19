import 'package:flutter/material.dart';

void main() {
  runApp(const NavigationScreenMultipage());
}

class NavigationScreenMultipage extends StatefulWidget {
  const NavigationScreenMultipage({Key? key}) : super(key: key);

  @override
  _NavigationScreenMultipageState createState() => _NavigationScreenMultipageState();
}

class _NavigationScreenMultipageState extends State<NavigationScreenMultipage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/"        : (context) => HomeScreen(),
        "/catalog" : (context) => CatalogScreen(),
        "/settings": (context) => SettingsScreen()
      },
    );
  }
}

/////////////// Основной экран ///////////////
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _messengerKey,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int val) {
            _messengerKey.currentState!.showSnackBar(
                SnackBar(content: Text("bottom navbar tapped ${val.toString()}")));
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm),
              label: "Item 0",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined),
              label: "Item 1",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.volunteer_activism),
              label: "Item 2",
            ),
          ],
        ),
        appBar: AppBar(
          title: const Text("Case 2.3.1"),
          actions: [
            IconButton(
              onPressed: (){
                _messengerKey.currentState!.showSnackBar(
                    const SnackBar(content: Text("Icons.account_circle")));
              },
              icon: Icon(Icons.account_circle),
              tooltip: 'Show Snackbar',
            ),
            IconButton(
              onPressed: () {
                _messengerKey.currentState!.showSnackBar(
                    const SnackBar(content: Text("Icons.add_box")));
              },
              icon: Icon(Icons.add_box),
              tooltip: 'Show Snackbar',
            ),
            TextButton(
              onPressed: (){
                _messengerKey.currentState!.showSnackBar(
                    const SnackBar(content: Text("Logout")));
              },
              child: Text("Logout",
                style: TextStyle(
                  color: Colors.white,
                ),),),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Container(
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(50.0))
                          ),
                          child: const Image(image: AssetImage("assets/Google-flutter-logo.svg.png")), //Image.network("url"),
                        ),
                        const Text("Навигация по Flutter"),
                      ],
                    ),
                  )
              ),
              ListTile(
                  leading: const Icon(Icons.one_k),
                  title: const Text ("Каталог"),
                  onTap: (){
                    _messengerKey.currentState!.showSnackBar(
                        const SnackBar(content: Text("Переход в каталог")));
                    Navigator.pushNamed(context, '/catalog');
                  }
              ),
              ListTile(
                  leading: const Icon(Icons.two_k),
                  title: const Text ("Корзина"),
                  onTap: (){
                    _messengerKey.currentState!.showSnackBar(
                        const SnackBar(content: Text("Переход в корзину")));

                  }
              ),
              const Divider(  ),
              const Padding(padding: EdgeInsets.only(left: 10),
                child: Text("Профиль"),
              ),
              ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text ("Настройки"),
                  onTap: (){
                    _messengerKey.currentState!.showSnackBar(
                        const SnackBar(content: Text("Переход в настройки")));
                    Navigator.pushNamed(context, '/settings');
                  }
              ),
              const Divider(  ),
              Text ("Инструкция\n ..."),

            ],
          ),
        ),
      ),
    );
  }
} //HomeScreen

/////////////// Экран "Каталог" ///////////////
class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Каталог'),
      ),
      body: Center(
        child: ElevatedButton(
          // Within the SecondScreen widget
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            Navigator.pop(context);
          },
          child: const Text('Назад'),
        ),
      ),
    );
  }
} //CatalogScreen

/////////////// Экран настроек профиля ///////////////
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
} //SettingsScreen

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: Container(
        width: double.infinity,
        decoration: _background(),
        child: Center(
          child: ElevatedButton(
            // Within the SecondScreen widget
            onPressed: () {
              // Navigate back to the first screen by popping the current route
              // off the stack.
              Navigator.pop(context);
            },
            child: const Text('Назад'),
          ),
        ),
      ),
    );
  }
}  //SettingsScreenState

BoxDecoration _background (){
  return const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/blue-gear-icon.png",
        ),
        opacity: 0.1,
        fit: BoxFit.cover),
  );
}