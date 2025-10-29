import 'package:adp_desktop/adp_desktop.dart';

class TextSearchFieldPreview extends StatefulWidget {
  const TextSearchFieldPreview({Key? key}) : super(key: key);

  @override
  State<TextSearchFieldPreview> createState() => _TextSearchFieldPreviewState();
}

class _TextSearchFieldPreviewState extends State<TextSearchFieldPreview> {
  late TextEditingController controller;
  List<UserInfo> filteredList = [];

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    filteredList.addAll(contentList);
  }

  void filterContent(String searchText) {
    setState(() {
      filteredList.clear();
      filteredList.addAll(
        contentList.where(
          (userInfo) =>
              userInfo.name.toLowerCase().contains(searchText.toLowerCase()),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffoldPage(
      content: Column(
        children: [
          Row(
            children: [
              const AdaptiveBackButton(),
              Flexible(
                child: AdaptiveTextSearchField(
                  placeholder: 'Search',
                  controller: controller,
                  onChanged: (value) {
                    if (value.isEmpty || value.length == 2) {
                      setState(() {
                        filteredList.clear();
                        filteredList.addAll(contentList);
                      });
                    }
                  },
                  onSelected: (value) => filterContent(value.searchKey),
                  suggestions: List.generate(
                    contentList.length,
                    (index) =>
                        AdaptiveSearchItem(searchKey: contentList[index].name),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final userInfo = filteredList[index];
                return AdaptiveListTile(
                  useBackgroundColor: controller.text == userInfo.name,
                  title: Text(userInfo.name),
                  subtitle: Text('Age: ${userInfo.age}'),
                  onTap: () {
                    controller.text = userInfo.name;
                    filterContent(userInfo.name);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  final contentList = [
    UserInfo(name: 'Abbas Hussein', age: 19),
    UserInfo(name: 'John Doe', age: 30),
    UserInfo(name: 'Jane Smith', age: 25),
    UserInfo(name: 'Alice Johnson', age: 35),
    UserInfo(name: 'Bob Brown', age: 40),
    UserInfo(name: 'Eve White', age: 28),
    UserInfo(name: 'Michael Johnson', age: 45),
    UserInfo(name: 'Sarah Williams', age: 27),
    UserInfo(name: 'David Wilson', age: 32),
    UserInfo(name: 'Karen Martinez', age: 38),
    UserInfo(name: 'James Taylor', age: 33),
    UserInfo(name: 'Jennifer Anderson', age: 29),
    UserInfo(name: 'Daniel Thomas', age: 42),
    UserInfo(name: 'Linda Hernandez', age: 36),
    UserInfo(name: 'Matthew Moore', age: 31),
    UserInfo(name: 'Samantha Martin', age: 26),
    UserInfo(name: 'Christopher Lee', age: 41),
    UserInfo(name: 'Amanda King', age: 34),
    UserInfo(name: 'Joshua Perez', age: 39),
    UserInfo(name: 'Lauren Young', age: 28),
    UserInfo(name: 'Ryan Scott', age: 43),
    UserInfo(name: 'Ashley Green', age: 24),
    UserInfo(name: 'Andrew Evans', age: 37),
    UserInfo(name: 'Emily Turner', age: 30),
    UserInfo(name: 'Justin Reed', age: 35),
    UserInfo(name: 'Nicole Hall', age: 29),
    UserInfo(name: 'Brandon Diaz', age: 44),
    UserInfo(name: 'Kayla Clark', age: 25),
    UserInfo(name: 'Kevin Hill', age: 40),
    UserInfo(name: 'Taylor Adams', age: 31),
    UserInfo(name: 'Jacob Baker', age: 26),
    UserInfo(name: 'Megan Nelson', age: 32),
    UserInfo(name: 'William Carter', age: 41),
    UserInfo(name: 'Victoria Ramirez', age: 27),
    UserInfo(name: 'Nicholas Torres', age: 33),
    UserInfo(name: 'Christina Sanders', age: 42),
    UserInfo(name: 'Joseph Morris', age: 28),
    UserInfo(name: 'Stephanie Flores', age: 34),
    UserInfo(name: 'Tyler Collins', age: 43),
    UserInfo(name: 'Hannah Murphy', age: 23),
    UserInfo(name: 'Kyle Rivera', age: 39),
    UserInfo(name: 'Rebecca Bennett', age: 35),
    UserInfo(name: 'Benjamin Coleman', age: 30),
    UserInfo(name: 'Alexis Hughes', age: 36),
    UserInfo(name: 'Samuel Washington', age: 25),
    UserInfo(name: 'Marissa Powell', age: 31),
    UserInfo(name: 'Jordan Cooper', age: 37),
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class UserInfo {
  final String name;
  final int age;

  UserInfo({required this.name, required this.age});
}
