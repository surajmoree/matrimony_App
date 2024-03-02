import 'package:equatable/equatable.dart';

class Property extends Equatable {
  
  const Property({
    required this.id,
    this.propertyTitle,
    this.properyDescription,
    this.propertyPrice,
    this.propertyArea
  });

  final int id;
  final String? propertyTitle, propertyArea, properyDescription, propertyPrice;

  

  @override 
  List<Object> get props => [id, propertyTitle!, propertyArea!, properyDescription!, propertyPrice! ];

}
