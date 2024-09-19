import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_with_cubit/control/logic/cubit/news_cubit_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubitCubit, NewsCubitState>(
        builder: (context, state) {
          final newsCubit = context.read<NewsCubitCubit>();
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'BBC News',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.sp,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.black,
            ),
            body: state is NewsSuccess
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 10,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Top Headlines',
                            style: TextStyle(
                              fontSize: 30.sp,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          // CarouselSlider(items: items, options: options)
                          SizedBox(
                            height: 130.h,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: newsCubit.bbcModel!.articles!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 1,
                                    ),
                                    child: Container(
                                      width: 300.w,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Center(
                                        child: Image.network(
                                          newsCubit.bbcModel!.articles![index]
                                              .urlToImage
                                              .toString(),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'News',
                            style: TextStyle(
                              fontSize: 30.sp,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          SizedBox(
                            height: 370.h,
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: newsCubit.bbcModel!.articles!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 3,
                                    ),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: ListTile(
                                        leading: Image.network(newsCubit.bbcModel!
                                            .articles![index].urlToImage
                                            .toString()),
                                        title: Text(
                                          'Article ${newsCubit.bbcModel!.articles![index].title}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        subtitle: Text(
                                          'Subtitle ${newsCubit.bbcModel!.articles![index].description}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ),
          );
        },
        listener: (context, state) {});
  }
}







