//Cours USAL22 Bases de la Programmation Orientée Objet (POO) - DEUST1 2025
//TD Programmation d'un Puissance 4 en Java with Proccesing
//Margaux Brun©


// Variables
Grille grille;                 // Déclaration de variable pour la grille.
int nbTour = 1;                // Déclaration de variable pour compter le nombre de tour écoulé.
Pion pionPrev;                 // Déclaration de variable pour le pion de prévisualisation.
int colonneActuelle = 0;       // Déclaration de variable pour savoir quelle colonne est concernée.
Joueur J1;                     // Déclaration de variable pour le joueur 1.
Joueur J2;                     // Déclaration de variable pour le joueur 2.
RGB colorJ1;                   // Déclaration de variable pour la couleur du joueur 1.
RGB colorJ2;                   // Déclaration de variable pour la couleur du joueur 2.
RGB colorActu;                 // Déclaration de variable pour la couleur actuelle.
int joueurActu = 1;            // Déclaration de variable pour pouvoir afficher quel joueur joue.
RGB colorPionPose;             // Déclaration de variable pour récupérer les couleur du pion que l'on vient de poser.
String victoire = null;        // Déclaration de variable pour afficher/récupérer une chaîne de caractère lorsqu'il y a une victoire.


// SETUP
void setup() {
  size(900, 800);               // Taille de la fenêtre (largeur, hauteur)
  background(255, 255, 255);    // Couleur de fond de la fenêtre
  grille = new Grille();        // Crée  la grille de jeu 
  J1 = new Joueur();            // Création du Joueur 1
  J2 = new Joueur();            // Création du Joueur 2
  colorJ1 = new RGB(255, 0, 0); // Couleur du J1 : rouge
  colorJ2 = new RGB(245, 224, 37); // Couleur du J2 : jaune
  colorActu = colorJ1;          // Couleur actuelle démarre au rouge
  pionPrev = new Pion(Utils.decalageX, Utils.decalageY - Utils.dimensionCase, colorActu);    // Dessine initialement le pion de prévisu au dessus de la première colonne.
}

// __________________________________________________________________//
//                                                                   //
// Il y a un bloc caché dans processing, où tout ce qui est déclaré  //
// au niveau du setup et AVANT, sont exécutés qu'une seule fois.     //  
// Ensuite, les fonctions draw, mousePressed et mouseMoved sont      //
// exécutées jusqu'à la fin du programme                             //
//                                                                   //
// __________________________________________________________________//


// DRAW
void draw() {
  background(255, 255, 255);    // Pour "clear" (réinitialiser le fond blanc).
  
  grille.dessine();            // Dessine la grille.
  pionPrev.dessine();          // Dessine le pion prévisuel.

  textSize(60);                                // Taille du texte.
  text("Joueur : " + joueurActu, 500, 750);    // Affiche quel joueur va jouer.
  
  textSize(60);                          // Taille du texte.
  fill(0, 0, 0);                         // Couleur du texte.
  text("Tour : " + nbTour, 150, 750);    // Affiche le nombre de tours.
  
  textSize(10);
  fill(0, 0, 0);
  text("TD Programmation d'un Puissance 4 en Java with Proccesing - Margaux Brun", 5, 795);    // Affiche un texte en bas de la fenêtre.
  
  if (victoire != null) {        // Si il y a une victoire alors...
                                 // on affiche un encadré qui annonce quel joueur a gagné !
                                 
  strokeWeight(8);                                              // Epaisseur du contour de l'encadré
  stroke(colorPionPose.getRouge(), colorPionPose.getVert(), colorPionPose.getBleu());  // contour du cadre de la couleur du gagnant
  fill(255, 255, 255);                                                 // fond du cadre (blanc)
  rect(Utils.decalageX, 330, 630, 100);                                // taille et position du cadre
  
  strokeWeight(1);              // Réanonce une épaisse de contour par défaut pour éviter que le strokeWeight précédent ne change les suivants
  
  textSize(80);                                                              // Taille du texte
  fill(colorPionPose.getRouge(), colorPionPose.getVert(), colorPionPose.getBleu());      // couleur du texte de la couleur du gagnant
  text(victoire, Utils.decalageX, 400);                                      // le texte affiche le contenu de
  }
}


// Lorsque je clique sur la souris.
void mousePressed() {
  if(victoire == null) {              // Si il n'y a pas encore de victoire...
  
    Case[][] cases = grille.getCases();        // Recupère le tableau de tableau de cases pour itérer dessus.
    
        for (int j = Utils.nbCasesY - 1; j > -1; j = j-1) {      // Pour j qui va commencer au nombre de cases en largeur -1 jusqu'à 0, j décrémente.
            if (cases[colonneActuelle][j].pion == null) {          // Si il n'y a PAS de pion
              Pion p = new Pion(cases[colonneActuelle][j].getPixelCoordX(), 50, colorActu);    // On crée un nouvel objet pion
              p.setDestination(cases[colonneActuelle][j].getPixelCoordY());                    
              cases[colonneActuelle][j].remplir(p);    // on met un nouveau pion dans la case concernée.
              
              colorPionPose = cases[colonneActuelle][j].pion.getCouleur();        // on recupère la couleur du pion que l'on vient de poser.
              
              if (grille.detecte4Pions(colonneActuelle, j, colorPionPose) == true) {    // Si on a 4 pions allignés
                if (colorPionPose == colorJ1) {                                            // Si la couleur du dernier pion posé est de la couleur du joueur 1
                  // Joueur 1 a gagné                                                      // alors le joueur 1 a gagné.
                  print("Joueur 1 a gagné !!");       // Affichage console
                  print("\n");
                  victoire = "Joueur 1 a gagné !!";    // La variable victoire prend la "valeur" chaîne de caractères indiquée
                }
              
                else {
                   // Joueur 2 a gagné                                                     // sinon le joueur 2 a gagné.
                   print("Joueur 2 a gagné !!");            // Affichage console
                   print("\n");
                   victoire = "Joueur 2 a gagné !!";      // La variable victoire prend la "valeur" chaîne de caractères indiquée
                }
             }
            
  
              nbTour = nbTour +1;    // Passe au tour suivant à chaque fois qu'un pion a été créé.
              
              if (nbTour%2 != 0) {   // Si le nb de tour est impair alors
                colorActu = colorJ1; // la couleur du pion devient rouge.
              }
              else {                 // sinon
                colorActu = colorJ2; // elle devient jaune.
              }
             pionPrev.setCouleur(colorActu);  // La couleur du pion prévisuel prend la couleur actuelle.
             
             
             // Permet de savoir quel joueur est en train de jouer.
             if ( colorActu == colorJ1) {    // Si la couleur actuelle est cele du joueur 1
               joueurActu = 1;                  // alors c'est le joueur 1 qui joue
             }
             else {                             // sinon c'est le joueurn 2 qui joue.
               joueurActu = 2;
             }
             
              break;   // Pour sortir de la boucle.
            }
        }
  }

}
// Lorsque je bouge la souris.
void mouseMoved() {
  if(victoire == null) {                    // Si il n'y a pas encore de victoire...
  
    Case[][] cases = grille.getCases();
      for (int i = 0; i < Utils.nbCasesX; i++) {                                                                      // Pour i allant de 0 à nb de cases en largeur de la grille, i s'incrémente.
        if (mouseX > cases[i][0].getPixelCoordX() && mouseX < cases[i][0].getPixelCoordX() + Utils.dimensionCase) {        // si la souris se trouve sur la grille alors
          pionPrev.setX(cases[i][0].getPixelCoordX()); 
          pionPrev.setY(cases[i][0].getPixelCoordY() - Utils.dimensionCase);
          
          colonneActuelle = i;
        }
    }
  }
}
