//
//  Recipes.swift
//  Program4
//
//  Created by Orlando Ortega on 02/01/21.
//

import Foundation

func readData() {
    print("Busqueda de recetas por ingrediente. Ingrese el/los ingredientes para buscar separados por ','.")
    guard let input = readLine() else { return }
    let recetary = findRecipes(query: input.components(separatedBy: ","))
    if recetary.isEmpty {
        print("No hay recetas en el recetario.")
    } else {
        recetary.forEach({print($0)})
    }
}

func findRecipes(query: [String]) -> [String]{
    let recipes: [String] = [" Margarita ingredientes:Tequila blanco 60 ml Controy 15 ml Zumo de limon 15 ml Sal 3 g Hielo 100 g procediemiento: Escarcha copa con sal. De forma directa en la copa Matinera agregar los hielos seguidos de las 0z de tequila, Controy, zumo de limon y sal.", "TEQUILA 1,2,3 Ingredientes: Tequila Reposado 45 ml Limón 10 g Sal 5 g procedimiento:Agregar la onza y media de tequila en el caballito. Cortar por la mitad un limon. Colocar la sal en la mano", "CHARRO NEGRO ingredientes: Tequila 60 ml Refresco de cola 240 ml Hielo 100 g procedimiento: Agregar en el vaso Collins hielo seguido de las 2oz de tequila y rellenar con refresco cola", "CUCARACHA ingredientes: Tequila 15ml Kalhua 15ml procedimiento: Agregar en el caballito el kalhua y agregar el tequila mojando la orilla del caballito para posteriormente flambear.", "LAGARTIJA ingredientes: Tequila blanco 60 ml Vodka 30 ml Crema de menta verde 30 ml Jarabe de goma 30 ml Zumo de limon 15 ml Agua Mineral 100 ml Hielo 100 g procedimiento: Agregar los hielos, agregar tequila y vodka, agregar jarabe de goma, zumo de limon, crema de menta verde y rellenar con agua mineral", "MARGARITA DE MANGO ingredientes: Tequila blanco 60 ml Zumo de limon 15 ml Azúcar 5 g Mango 30 g Hielo 100 g procedimiento: Escarcha copa con azucar. Agregar el hielo  en la copa Martinera, agregar el tequila, la pulpa de mago, zumo de limon ", "MEDIAS DE SEDA ingredientes: Tequila blanco 60 ml Crema de cacao blanco 15 ml Granadina 15 ml Leche condesada 30 ml Canela en polvo 5 g Cereza 1 pz Hielo 100 g procedimiento: Mezclar en el shaker todos los ingredientes a excepcion de la canela y la cereza. Decorar con la cereza y la canela. ", "PALOMA ingredientes: Tequila 60 ml Soda de toronja 120 ml Sal 5 g Zumo de limon 15 ml Hielo 100 g procedimientos: Colocar los hielos dentro del vaso y posteriormente  agregar el tequila, un poco de sal y rellanar con refresco de toronja ", "SANGRIA ingredientes: Jugo de tomate 30 ml Jugo de naranja 30 ml Soda de naranja 30 ml Jugo de limon 30 ml VENENO Jugo maggy 30 ml Granadina 30 ml Salsa inglesa 30 ml Salsa tabasco 30 ml Pimienta 5 g procedimiento: Agregar en un vaso Collins todos los ingredientes y mezclar bien ", "SOUR ingredientes: Tequila reposado 60 ml Zumo de limon 30 ml Azucar 5 g Hielo 100 g Jugo de naranja 150 ml procedimiento: Escarchar con azúcar. Agregar en el vaso Collins hielo, tequila y rellenar con jugo de naranja"]
    let queryIngredients = query.map({$0.lowercased()})
    let recipesFound = recipes.filter({queryIngredients.contains(where: $0.lowercased().contains)})
    return recipesFound
}
