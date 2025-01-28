// Classe RGB pour la couleur
public class RGB {

  private int rouge;
  private int vert;
  private int bleu;
  
  public RGB (int r, int v, int b) {      // Constructeur
    this.rouge = r;
    this.vert = v;
    this.bleu = b;
  }
  
  public int getRouge() {      // Retourne la valeur de rouge
    return this.rouge;
  }
  
  public int getVert() {      // Retourne la valeur de vert
    return this.vert;
  }
  
  public int getBleu() {      // Retourne la valeur de bleu
    return this.bleu;
  }
}
