import 'package:flutter/material.dart';
class PersonModel{
   IconData leftIcon;
   IconData rightIcon;
   String name;
   String description;
   String nickName;
   String movil;

  PersonModel({
    this.leftIcon,
    this.name,
    this.description,
    this.rightIcon,
    this.nickName,
    this.movil
  });
}

PersonModel person1 = PersonModel(
    name: 'Jose Reyes',
    description: 'Ejemplo de Modelo',
    leftIcon: Icons.person,
    rightIcon: Icons.message,
    nickName: 'braye98',
    movil: "04126717506"
);
PersonModel person2 = PersonModel(
    name: 'Yarexis Hurtado',
    description: 'necesitamos la carta de VIt',
    leftIcon: Icons.person,
    rightIcon: Icons.message,
    nickName: 'Yare',
    movil: "04126717506"
);
PersonModel person3 = PersonModel(
    name: 'Jesus Morales',
    description: 'Viva el Fola',
    leftIcon: Icons.person,
    rightIcon: Icons.message,
    nickName: 'El Yisus',
    movil: "04126717506"
);