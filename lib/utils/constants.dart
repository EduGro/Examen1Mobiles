import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';

// home
const String APP_TITLE = "Snacks shop";
// profile
const String PROFILE_TITLE = "Perfil";
const String PROFILE_LOGOUT = "Cerrar sesion";
const String PROFILE_CART = "Lista de compras";
const String PROFILE_WISHES = "Lista de deseos";
const String PROFILE_HISTORY = "Historial de compras";
const String PROFILE_SETTINGS = "Ajustes";
const String PROFILE_NAME = "Anna Doe";
const String PROFILE_EMAIL = "anna@doe.com";
const String PROFILE_PICTURE =
    "https://dkpp.go.id/wp-content/uploads/2018/10/photo.jpg";

// app
const _bluePrimaryValue = 0xFF214254;
const Color PRIMARY_COLOR = const MaterialColor(
  _bluePrimaryValue,
  const <int, Color>{
    50: const Color(0xFF214254),
    100: const Color(0xFF214254),
    200: const Color(0xFF214254),
    300: const Color(0xFF214254),
    400: const Color(0xFF214254),
    500: const Color(_bluePrimaryValue),
    600: const Color(0xFF214254),
    700: const Color(0xFF214254),
    800: const Color(0xFF214254),
    900: const Color(0xFF214254),
  },
);

//Color(0xFF204254); //Colors.blue; //0xFF204254

//Carrito
List<ProductItemCart> cartList = [];