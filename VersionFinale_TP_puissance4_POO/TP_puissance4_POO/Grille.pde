// Classe grille
public class Grille implements IDessinable {        
  public final int nbCasesX = 7;      // Nombre de cases en largeur de la grille.
  public final int nbCasesY = 6;      // Nombre de cases en hauteur de la grille.
  public final int offsetTop = 100;
  private Case[][] cases;             // cases est un tableau de tableau de Case.
  
  public Grille() {                        // Constructeur
    cases = new Case[nbCasesX][nbCasesY];      // cases est un tableau de tableaux de Case.
    for (int i = 0; i < nbCasesX; i++) {       // Largeur de la grille.
      for (int j = 0; j < nbCasesY; j++) {     // Hauteur de la grille.
        this.cases[i][j] = new Case(i, j);
      }
    }
  }
  
  
  public Case[][] getCases() {          // Pour récupérer les valeur d'une case de la grille.
    return this.cases;
  }
  
  public int getColonneOver() {
  /*Case[][] cases = grille.getCases();
      for (int i = 0; i < Utils.nbCasesX; i++) {                                                                      // Pour i allant de 0 à nb de cases en largeur de la grille, i s'incrémente.
        if (mouseX > cases[i][0].getPixelCoordX() && mouseX < cases[i][0].getPixelCoordX() + Utils.dimensionCase) {        // si la souris se trouve sur la grille alors
          pionPrev.setX(cases[i][0].getPixelCoordX()); 
          pionPrev.setY(cases[i][0].getPixelCoordY() - Utils.dimensionCase);
          
          colonneActuelle = i;
        }*/
    return 0;                           //En attendant la suite du code.

   // }
  }
  
  
// ----------------------------------------------------------------------------------------------------------------------------------------

  public boolean detecte4Pions(int x, int y, RGB colorPionPose) {
    int compteur = 0; // Déclaration de variable pour utiliser un compteur.
    
    // DETECTION LIGNE !!
    
            // tmpX représente la coordonnée X, et y représente la coordonnée Y de la case parcourue.
            for (int tmpX = 0; tmpX < Utils.nbCasesX; tmpX++) {
             if(cases[tmpX][y].pion == null) {
               compteur = 0;
             } 
             else {
               if (cases[tmpX][y].pion.getCouleur().equals(colorPionPose)) {
                 compteur++;
                 if (compteur == 4) {
                   return true;
                 }
               } 
               else {
                 compteur = 0;
               }
             }
            }      
            // Au cas où on a fait un mauvais traitement...
            compteur = 0;
            
   // FIN DETECTION LIGNE
   
   // ----------------------------------------------------------------------------------------------------------------------------------------
   
   // DETECTION COLONNE !!
   
   // x représente la coordonnée X, et tmpY représente la coordonnée Y de la case parcourue.
            for (int tmpY = 0; tmpY < Utils.nbCasesY; tmpY++) {
             if(cases[x][tmpY].pion == null) {
               compteur = 0;
             } 
             else {
               if (cases[x][tmpY].pion.getCouleur().equals(colorPionPose)) {
                 compteur++;
                 if (compteur == 4) {
                   return true;
                 }
               } 
               else {
                 compteur = 0;
               }
             }
            }  
            // Au cas où on a fait un mauvais traitement...
            compteur = 0;
   
   // FIN DETECTION COLONNE
   
   // ----------------------------------------------------------------------------------------------------------------------------------------
   
   // DETECTION DIAGONALE
       //GAUCHE
       int xMinimalDeLaDiagonale = x; 
       int yMinimalDeLaDiagonale = y;
       
       int xMaximumDeLaDiagonale = x;
       int yMaximumDeLaDiagonale = y;
       
       while(xMinimalDeLaDiagonale > 0 && yMinimalDeLaDiagonale > 0) {      // Limite haute de la diagonale gauche : xMinimalDeLaDiagonale == 0 OU yMinimalDeLaDiagonale == 0.
         xMinimalDeLaDiagonale = xMinimalDeLaDiagonale - 1;
         yMinimalDeLaDiagonale = yMinimalDeLaDiagonale - 1;
       }
       
       while(xMaximumDeLaDiagonale < Utils.nbCasesX - 1 && yMaximumDeLaDiagonale < Utils.nbCasesY - 1) {      // Limite basse de la diagonale gauche : 
         xMaximumDeLaDiagonale = xMaximumDeLaDiagonale + 1;                                                     // xMaximumDeLaDiagonale == 6 OU yMaximumDeLaDiagonale == 5.
         yMaximumDeLaDiagonale = yMaximumDeLaDiagonale + 1;
       }

   // tmpX représente la coordonnée X, et tmpY représente la coordonnée Y de la case parcourue.
         int tmpX = xMinimalDeLaDiagonale;
         int tmpY = yMinimalDeLaDiagonale;
         while(tmpX < xMaximumDeLaDiagonale + 1 && tmpY < yMaximumDeLaDiagonale + 1) {        // Tant que tmpX est inférieur à la limite basse ET tmpY est inférieur à la limite basse
           if(cases[tmpX][tmpY].pion == null) {
               compteur = 0;
             } 
             else {
               if (cases[tmpX][tmpY].pion.getCouleur().equals(colorPionPose)) {
                 compteur++;
                 if (compteur == 4) {
                   return true;
                 }
               } 
               else {
                 compteur = 0;
               }
             }
             tmpX++;
             tmpY++;
         }
         
           // Au cas où on a fait un mauvais traitement...
            compteur = 0;
       //FIN GAUCHE
       
       
       //DROITE
       
       xMinimalDeLaDiagonale = x; 
       yMinimalDeLaDiagonale = y;
       
       xMaximumDeLaDiagonale = x;
       yMaximumDeLaDiagonale = y;
       
       while(xMinimalDeLaDiagonale > 0 && yMinimalDeLaDiagonale < Utils.nbCasesY - 1) { 
         xMinimalDeLaDiagonale--;
         yMinimalDeLaDiagonale++;
       }
       
       while(xMaximumDeLaDiagonale < Utils.nbCasesX - 1 && yMaximumDeLaDiagonale > 0) { 
         xMaximumDeLaDiagonale++;
         yMaximumDeLaDiagonale--;
       }

       // tmpX représente la coordonnée X, et tmpY représente la coordonnée Y de la case parcourue.
       // Rappel : xMinimalDeLaDiagonale tend vers 0
       // Rappel : yMinimalDeLaDiagonale tend vers 5
       tmpX = xMinimalDeLaDiagonale;
       tmpY = yMinimalDeLaDiagonale;
       // Rappel : xMaximumDeLaDiagonale tend vers 6
       // Rappel : yMaximumDeLaDiagonale tend vers 0
       
         while(tmpX < xMaximumDeLaDiagonale + 1 && tmpY > yMaximumDeLaDiagonale - 1) {        // Tant que tmpX est inférieur à la limite basse ET tmpY est inférieur à la limite basse
           if(cases[tmpX][tmpY].pion == null) {
               compteur = 0;
             } 
             else {
               if (cases[tmpX][tmpY].pion.getCouleur().equals(colorPionPose)) {
                 compteur++;
                 if (compteur == 4) {
                   return true;
                 }
               } 
               else {
                 compteur = 0;
               }
             }
             tmpX++;
             tmpY--;
           } 
           
             // Au cas où on a fait un mauvais traitement...
            compteur = 0;
       //FIN DROITE
    
   // FIN DETECTION DIAGONALE
   
       return false;              // Par défaut retourne false si il n'y a pas un compteur de 4.
  }
  
  // ----------------------------------------------------------------------------------------------------------------------------------------
  
  public void dessine() {          // Double boucle pour dessiner la grille composée de plusieurs Case.
    for (int q = 0; q < nbCasesX; q++) {
      for (int k = 0; k < nbCasesY; k++) {
        this.cases[q][k].dessine();
      }
    }
  }
}
