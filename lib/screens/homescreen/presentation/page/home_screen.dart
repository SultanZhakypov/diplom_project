import 'package:dimplom/components/category_card.dart';
import 'package:dimplom/components/logo.dart';
import 'package:dimplom/screens/homescreen/presentation/cubit/home_cubit.dart';
import 'package:dimplom/screens/homescreen/presentation/page/child_page/detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().getDataCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Logo(),
      ),
      body: RefreshIndicator(
        onRefresh: context.read<HomeCubit>().getDataCubit,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'Категории',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              BlocConsumer<HomeCubit, HomeState>(
                listener: (context, state) {
                  if (state is HomeLoading) {
                    EasyLoading.show();
                  }
                },
                buildWhen: (previous, current) => current is HomeSuccess,
                builder: (context, state) {
                  if (state is HomeSuccess) {
                    EasyLoading.dismiss();

                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8.0),
                      itemCount: state.topics.length,
                      itemBuilder: (context, index) {
                        final topJopa = state.topics[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => DetailPage(topJopa),
                              ),
                            );
                          },
                          child: CategoryCard(
                            img:
                                'https://www.cism-ms.ru/upload/iblock/b40/b40467618e29736f592b81bad4200026.jpg',
                            title: topJopa.title,
                            desc: topJopa.content,
                          ),
                        );
                      },
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
