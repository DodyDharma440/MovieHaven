import 'package:get/get.dart';
import 'package:movie_haven/app/shared/controllers/get_data.dart';

class PaginatedController extends GetData {
  RxInt page = 1.obs;
  RxInt totalPage = 1.obs;

  void nextPage() {
    page.value = page.value + 1;
    update();
  }

  void prevPage() {
    page.value = page.value - 1;
    update();
  }

  bool isCanPrev() {
    return page.value > 1;
  }

  bool isCanNext() {
    return page.value < totalPage.value;
  }
}
