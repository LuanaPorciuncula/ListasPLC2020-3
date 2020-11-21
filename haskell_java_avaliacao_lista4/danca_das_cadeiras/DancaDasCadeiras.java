package danca_das_cadeiras;

import java.util.*;
//import java.util.concurrent.*;
import java.util.concurrent.atomic.*;

class DancaDasCadeiras {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        System.out.println("Quantos Jogadores?");
        int nJogadores = in.nextInt();

        ArrayList<Jogador> jogadores = new ArrayList<Jogador>();
        Danca danca = new Danca(nJogadores);

        for (int i = 0; i < nJogadores; i++) {
            jogadores.add(new Jogador(i + 1, danca));
        }

        danca.setJogadores(jogadores);

        danca.startDanca();

        in.close();
    }

}

class Danca {

    private int nCadeirasOcupadas;
    private int nJogadores;
    private AtomicBoolean[] cadeiras;
    private ArrayList<Jogador> jogadores;

    public Danca(int nJogadores) {
        this.nCadeirasOcupadas = 0;
        this.nJogadores = nJogadores;
    }

    public void setJogadores(ArrayList<Jogador> jogadores) {
        this.jogadores = jogadores;
    }

    public int getCadeirasLength() {
        return this.cadeiras.length;
    }

    public boolean temCadeiraLivre() {
        return this.cadeiras.length > nCadeirasOcupadas;
    }

    public void resetCadeiras(){
        this.nCadeirasOcupadas = 0;
        this.cadeiras = new AtomicBoolean[this.jogadores.size() - 1];
        for (int i = 0; i < this.jogadores.size() - 1; i++) {
            this.cadeiras[i] = new AtomicBoolean(false);
        }
    }

    public void startDanca() {

        while (nJogadores > 1) {
            resetCadeiras();

            Thread[] tJogadores = new Thread[this.jogadores.size()];
            for (int i = 0; i < this.jogadores.size(); i++) {
                tJogadores[i] = (new Thread(this.jogadores.get(i)));
                tJogadores[i].start();
            }

            try {
                for (int i = 0; i < nJogadores; i++) {
                    tJogadores[i].join();
                }
            } catch (InterruptedException e) {
            }

            for (int i = 0; i < this.jogadores.size(); i++) {
                if (!this.jogadores.get(i).getSentou()) {
                    System.out.println("O jogador " + this.jogadores.get(i).getId() + " foi eliminado");
                    this.jogadores.remove(i);
                }
            }
            this.nJogadores--;
            //System.out.println("Fim da rodada!");
        }

        System.out.println("O jogador " + this.jogadores.get(0).getId() + " foi o vencedor!");

        

    }

    public boolean sentar(int cadeira, int idJogador) {
        
        if (!this.cadeiras[cadeira].get()) {// Lugar está livre
            this.cadeiras[cadeira].set(true);
            this.nCadeirasOcupadas++;
            System.out.println("O jogador " + idJogador + " sentou na cadeira : " + cadeira);
            return true;
        } else {// Lugar não estava livre
            System.out.println("O jogador " + idJogador + " falhou em sentar na cadeira : " + cadeira);
            return false;
        }
    }
}

class Jogador implements Runnable {
    private int id;
    private Danca danca;
    private boolean sentou;

    public Jogador(int id, Danca danca) {
        this.id = id;
        this.danca = danca;
        this.sentou = false;
    }

    public int getId() {
        return this.id;
    }

    public boolean getSentou() {
        return this.sentou;
    }

    public void run() {
        Random random = new Random();
        this.sentou = false;
        while (!this.sentou && this.danca.temCadeiraLivre()) {
            this.sentou = this.danca.sentar(random.nextInt(this.danca.getCadeirasLength()), this.id);
        }
    }
}
