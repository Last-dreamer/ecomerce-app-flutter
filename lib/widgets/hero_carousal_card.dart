import 'package:ecom/models/catergory_model.dart';
import 'package:ecom/models/product_model.dart';
import 'package:flutter/material.dart';

class HeroCarousal extends StatelessWidget {
  final CategoryModel? categoryModel;
  final Product? product;
  const HeroCarousal({Key? key, this.categoryModel, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(product == null){
          Navigator.pushNamed(context,"/catalog", arguments: categoryModel);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(product == null ? categoryModel!.imageUrl : product!.imageUrl,
                    fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      product == null ?  categoryModel!.name : "",
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
