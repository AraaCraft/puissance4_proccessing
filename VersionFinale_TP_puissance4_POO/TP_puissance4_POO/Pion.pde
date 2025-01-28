// Classe pion
public class Pion implements IDessinable {
  private RGB couleur;
  private int coordX;
  private int coordY;
  private int coordY_Desti;
  private final float dimensionPion = 90*0.8;        // Un pion fait 80% de la taille d'une case.


  public Pion(int x, int y, RGB c) {        // Constructeur.
    this.coordX = x;
    this.coordY = y;
    this.couleur = c;
    this.coordY_Desti=y;
  }
  
  public RGB getCouleur() {          // Retourne la valeur de la couleur du pion.
    return this.couleur;
  }
  
  public void setCouleur(RGB c) {    // Pour modifier la couleur du pion.
    this.couleur = c;
  }
  
  public void setX (int x) {        // Pour modifier la coordonnée x.
    this.coordX = x;
  }
  
  public void setY (int y) {        // Pour modifier la coordonnée y.
    this.coordY = y;
  }
  
  public void setDestination (int y) {    // Pour modifier la coordonnée de destination y qui va indiquer la destination du pioin que l'on vient de poser,
    this.coordY_Desti = y;                // pour gérer l'animation de descente du pion.
  }
  
  public void dessine() {
    //Dessiner un pion
    // si coordY_Desti != coordY, alors, on incrémente coordY (pour arriver à coordY_Desti)
    if (coordY_Desti > coordY) {      // Si la coordonnée Y du pion est supér
      coordY = coordY +10;                // alors le pion tombe à une vitesse de 10.
    }
      
      stroke(255);                                                                                             // Couleur du contour du pion
      fill(this.couleur.getRouge(), this.couleur.getVert(), this.couleur.getBleu());                           // Couleur du pion
      circle(this.coordX + Utils.dimensionCase/2, this.coordY + Utils.dimensionCase/2, this.dimensionPion);    // Dessine la forme d'un pion
    
  } 
}
