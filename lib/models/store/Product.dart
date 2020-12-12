
class Product{

  int id,cartId,rate_count,views,fav=0,quantity=1;
  double rate_average;
  String name,details,price,discount,thumbnail,location,seller,sellerLogo;
List<String > images;
dynamic questions,rates,rating_details;
Product(
    {this.id,this.cartId,this.name,this.price,this.rating_details,this.questions,this.rates,this.thumbnail,this.seller,this.sellerLogo,
  this.details,this.location="",this.fav=0,this.quantity=0,
  this.discount,this.rate_average,this.rate_count,this.views,this.images=const[]}
  );

}