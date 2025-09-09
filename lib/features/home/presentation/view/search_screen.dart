import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/widgets/custom_text_field.dart';
import 'package:safarni/core/widgets/spacing.dart';
import 'package:safarni/features/home/presentation/widgets/search_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  final List<Map<String, String>> cities = [
    {'name': 'Paris', 'desc': 'City of Arts'},
    {'name': 'Rome', 'desc': 'History lives here'},
    {'name': 'Rio de Janeiro', 'desc': 'Joy shines here'},
    {'name': 'Dubai', 'desc': 'Dream rises here'},
    {'name': 'London', 'desc': 'City of Culture'},
    {'name': 'Sydney', 'desc': 'Vibes soar here'},
    {'name': 'Beijing', 'desc': 'Lives in tradition'},
    {'name': 'Amsterdam', 'desc': 'City of Flowers'},
    {'name': 'New York', 'desc': 'City that never sleeps'},
    {'name': 'Tokyo', 'desc': 'Land of innovation'},
    {'name': 'Cairo', 'desc': 'Heart of history'},
    {'name': 'Istanbul', 'desc': 'Bridge of worlds'},
    {'name': 'Moscow', 'desc': 'City of power'},
    {'name': 'Berlin', 'desc': 'City of freedom'},
    {'name': 'Barcelona', 'desc': 'City of passion'},
    {'name': 'Venice', 'desc': 'City on water'},
    {'name': 'Athens', 'desc': 'Birthplace of wisdom'},
    {'name': 'Los Angeles', 'desc': 'City of stars'},
    {'name': 'Bangkok', 'desc': 'City of life'},
    {'name': 'Singapore', 'desc': 'Garden city'},
  ];

  List<Map<String, String>> filteredList = [];
  // List<Map<String,String>> getFilteredList(String searchText,int index){
  //   filteredList=cities.where((city)=>city["name"]!.startsWith(searchText)).toList();
  //   return filteredList;
  // }
  List<Map<String, String>> getFilteredList(String searchText) {
    final query = searchText.toLowerCase();
    filteredList = cities.where((city) {
      final name = city['name']!.toLowerCase();
      final desc = city['desc']!.toLowerCase();
      return name.contains(query) || desc.contains(query);
    }).toList();
    return filteredList;
  }

  List<Map<String, String>> finalList = [];
  @override
  void initState() {
    super.initState();
    finalList = cities;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text('Search', style: AppStyles.addressesTextStyle),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.grey900,
            size: 24.sp,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const HeightSpace(height: 24),
            Container(
              width: 343.w,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.sp),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.grey200,
                    blurRadius: 10,
                    spreadRadius: 7,
                  ),
                ],
              ),
              child: CustomTextField(
                controller: _controller,
                isEnabled: true,
                onChanged: (value) {
                  setState(() {
                    finalList = value.isEmpty ? cities : getFilteredList(value);
                  });
                },
              ),
            ),
            const HeightSpace(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: finalList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).pushNamed(
                        AppRoutes.resultSearchScreen,
                        arguments: finalList[index]['name']!,
                      );
                    },
                    child: SearchItem(
                      title: finalList[index]['name']!,
                      description: finalList[index]['desc']!,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
