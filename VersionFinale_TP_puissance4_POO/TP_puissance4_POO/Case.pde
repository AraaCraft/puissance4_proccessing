// Classe Case, appelle l'interface IDessinable
public class Case implements IDessinable {      
  
  private int posX;                    // Position X d'une case
  private int posY;                    // Position Y d'une case
  private final int dimension = 90;    // Taille d'une case (carrée)
  private Pion pion;                   // Une case possède un pion

  public Case(int x, int y) {          // Constructeur
    this.posX = x;
    this.posY = y;
  }
  
  public int getPixelCoordX () {
    // El famoso calcul de position absolue à retourner
    return this.posX * this.dimension + Utils.decalageX;
  }
  
  public int getPixelCoordY () {
    return this.posY * this.dimension + Utils.decalageY;
  }
  
  
  public void remplir(Pion p) {        // Pour remplir une case avec un pion.
    this.pion = p;
    }
    

  public void dessine() {         
    // Dessiner une case
    stroke(12, 94, 206);        // Couleur d'une case
    fill(12, 94, 206);          // Couleur du contour d'une case
    // Dessine la forme, l'emplacement et la taille d'une case.
    // Permet de centrer la grille.
    rect((this.posX * this.dimension) + Utils.decalageX, (this.posY * this.dimension) + Utils.decalageY, this.dimension, this.dimension);
    
    // Dessiner un emplacement de pion "vide" sur une case.
    stroke(255, 255, 255);    // Couleur d'une emplacement de pion "vide".
    fill(255, 255, 255);      // Couleur du contour d'un emplacement de pion "vide".   
    // Dessine la forme, l'emplacement et la taille d'un pion "vide".
    circle((this.posX * this.dimension + this.dimension/2) + Utils.decalageX, (this.posY * this.dimension + this.dimension/2) + Utils.decalageY, this.dimension*0.8);
    
    if(this.pion != null) {
      pion.dessine();
    }
  }
}
