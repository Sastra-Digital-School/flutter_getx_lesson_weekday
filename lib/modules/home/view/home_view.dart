import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_getx/config/theme/theme_style.dart';
import 'package:flutter_project_getx/modules/home/controller/home_controller.dart';
import 'package:flutter_project_getx/modules/item/item_detail.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: DefaultTabController(length: 3, child: _buildBodyNested),
      ),
    );
  }

  get _buildBodyNested {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [_buildAppBar];
      },
      body: Obx(
        () =>
            controller.lodaing.value
                ? Center(child: CircularProgressIndicator())
                : TabBarView(
                  children: [
                    _buildListTab1,
                    _buildList,
                    Center(child: Text('Tab')),
                  ],
                ),
      ),
    );
  }

  get _buildAppBar => SliverAppBar(
    backgroundColor: Colors.transparent,
    title: Text('Home'),
    centerTitle: true,
    leading: Icon(Icons.menu_rounded),
    actions: [IconButton(onPressed: () {}, icon: Icon(Icons.notifications))],
    expandedHeight: 130,
    flexibleSpace: FlexibleSpaceBar(
      expandedTitleScale: 1,
      title: SizedBox(
        height: 50,
        child: SearchBar(
          leading: Icon(Icons.search, color: Colors.grey),
          hintText: 'Search',
        ),
      ),

      titlePadding: EdgeInsets.only(left: 18, right: 18, bottom: 65),
      background: Container(
        decoration: BoxDecoration(
          color: AppTheme.primarySwatch[900],
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
        ),
      ),
    ),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(120),
      child: TabBar(
        indicatorWeight: 5,
        indicatorColor: Colors.white,
        tabs: List.generate(
          3,
          (index) => Tab(
            child: Text(
              'Tab1',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ),
  );

  get _buildList {
    List<String> title = ['Popular', 'Latest'];
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: title.length,
      itemBuilder: (context, index) {
        var popularData = controller.homeModel.data?.popular;
        var latestData = controller.homeModel.data?.latest;
        return Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title[index]),
              index == 0
                  ? SingleChildScrollView(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        popularData?.length ?? 0,
                        (index) => GestureDetector(
                          onTap: () {
                            Get.to(ItemDetail(id: 0, index: index));
                          },
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Container(
                                height: 200,
                                width: 150,
                                margin: EdgeInsets.only(right: 20),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      popularData?[index].image ?? '',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.8),
                                ),
                                child: Text(
                                  popularData?[index].name ?? '',
                                  style: TextStyle(
                                    color: Colors.cyan,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  : GestureDetector(
                    onTap: () {
                      Get.to(ItemDetail(id: 1, index: index));
                    },
                    child: Column(
                      children: List.generate(
                        latestData?.length ?? 0,
                        (index) => Container(
                          height: 168,
                          margin: EdgeInsets.only(bottom: 20, right: 20),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                '${latestData?[index].image}',
                              ),
                              fit: BoxFit.cover,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 5),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        );
      },
    );
  }

  get _buildListTab1 {
    List<String> title = ['Popular', 'Latest'];
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: title.length,
      itemBuilder: (context, index) {
        var dataImage = controller.productModels.products;

        return Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title[index]),
              index == 0
                  ? SingleChildScrollView(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        dataImage?.length ?? 0,
                        (index) => GestureDetector(
                          onTap: () {
                            Get.to(ItemDetail(id: 0, index: index));
                          },
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              CachedNetworkImage(
                                height: 200,
                                width: 150,
                                imageUrl: dataImage?[index].images?[0] ?? '',
                                imageBuilder:
                                    (context, imageProvider) => Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(25),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                placeholder:
                                    (context, url) => Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                errorWidget:
                                    (context, url, error) => Icon(Icons.error),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  : GestureDetector(
                    onTap: () {
                      Get.to(ItemDetail(id: 1, index: index));
                    },
                    child: Column(
                      children: List.generate(
                        dataImage?.length ?? 0,
                        (index) => Stack(
                          children: [
                            Container(
                              height: 168,
                              margin: EdgeInsets.only(bottom: 20, right: 20),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    dataImage?[index].images?[0] ?? '',
                                  ),
                                  fit: BoxFit.fitHeight,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, blurRadius: 5),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 30,
                              left: 10,
                              child: SizedBox(
                                width: 100,
                                child: Text(
                                  dataImage?[index].title ?? '',
                                  style: TextStyle(
                                    color: AppTheme.primarySwatch.shade900,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        );
      },
    );
  }
}
