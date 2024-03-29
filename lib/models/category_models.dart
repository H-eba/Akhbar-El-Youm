import 'dart:ui';

class CategoryModels{
  String id;
  String image;
  String title;
  Color color;
  CategoryModels(this.id, this.image,this.title,this.color);

  static List<CategoryModels>gitCategoryModels(){
     return
         [
           CategoryModels('sports', 'assets/images/ball.png', 'sports', Color(0xffC91C22)),
           CategoryModels('general', 'assets/images/Politics.png', 'general', Color(0xff003E90)),
           CategoryModels('health', 'assets/images/health.png', 'health', Color(0xffED1E79)),
           CategoryModels('business', 'assets/images/bussines.png', 'business',Color(0xffCF7E48)),
           CategoryModels('entertainment', 'assets/images/environment.png', 'entertainment', Color(0xff4882CF)),
           CategoryModels('science', 'assets/images/science.png', 'science', Color(0xffF2D352)),
           CategoryModels('technology', 'assets/images/Politics.png', ' technology', Color(0xff003E90)),
         ];
  }
}