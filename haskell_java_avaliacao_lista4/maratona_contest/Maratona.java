import java.util.*;

public class Maratona {
    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        boolean ctst = true;
        while (ctst) {
            System.out.println("Iniciar contest? (s/n)");
            String ans = in.nextLine();

            if (ans.equals("s")) {
                System.out.println("Quantos times irão participar?");
                int nTimes = in.nextInt();

                System.out.println("E quantas questões?");
                int xQuestoes = in.nextInt();

                Contest contest = new Contest(nTimes, xQuestoes);
                int[] endResultado = contest.startContest();
                int[][] endResultadoSort = new int[2][nTimes];

                for (int i = 0; i < nTimes; i++) {
                    endResultadoSort[0][i] = i;
                    endResultadoSort[1][i] = endResultado[i];
                }

                ResultadosSort(endResultadoSort, nTimes);

                for (int i = 0; i < nTimes; i++) {
                    System.out.println("Time:" + endResultadoSort[0][i] + " -> Questoes:" + endResultadoSort[1][i]);
                }

            } else if (ans.equals("n")) {
                ctst = false;
                System.out.println("Fim da maratona!");
            } else {
                System.out.println("Não entendi.");
            }
        }
        in.close();
    }

    public static void ResultadosSort(int[][] endResultadoSort, int nTimes){
        for (int i = 0; i < nTimes - 1; i++) {
            for (int j = 0; j < nTimes - 1 - i; j++) {
                if (endResultadoSort[1][j] < endResultadoSort[1][i]) {
                    int aux = endResultadoSort[1][j];
                    endResultadoSort[1][j] = endResultadoSort[1][i];
                    endResultadoSort[1][i] = aux;
                    aux = endResultadoSort[0][j];
                    endResultadoSort[0][j] = endResultadoSort[0][i];
                    endResultadoSort[0][i] = aux;
                }
            }
        }
    }
}

class Contest {
    private int nTimes;
    private int xQuestoes;
    private boolean ctstIsOver;
    private int[] endResultado;

    public Contest(int nTimes, int xQuestoes) {
        this.nTimes = nTimes;
        this.xQuestoes = xQuestoes;
        this.ctstIsOver = false;
        this.endResultado = new int[nTimes];
    }

    public boolean isContestOver() {
        return this.ctstIsOver;
    }

    public int[] startContest() {
        Thread[] times = new Thread[this.nTimes];

        for (int i = 0; i < this.nTimes; i++) {
            times[i] = new Thread(new Time(i, this.xQuestoes, this));
            times[i].start();
        }

        try {
            for (int i = 0; i < this.nTimes; i++) {
                times[i].join();
            }
        } catch (InterruptedException e) {
        }
        return this.endResultado;
    }

    public synchronized void endContest() {
        this.ctstIsOver = true;
    }

    public synchronized void updateEndResult(int nTime, int questoesRes) {
        endResultado[nTime] = questoesRes;
    }
}

class Time implements Runnable {
    private int nTime;
    private int xQuestoes;
    private int questoesRes;
    private Computador computador;
    private Contest contest;

    public Time(int nTime, int xQuestoes, Contest contest) {
        this.nTime = nTime;
        this.xQuestoes = xQuestoes;
        this.questoesRes = 0;
        this.computador = new Computador(this);
        this.contest = contest;
    }

    public int getNTime() {
        return this.nTime;
    }

    public Computador getComputador() {
        return this.computador;
    }

    public int getQuestoesRes() {
        return this.questoesRes;
    }

    public synchronized void addQuestoesRes() {
        if (!contest.isContestOver()) {
            this.questoesRes++;
        }
    }

    public synchronized void timeEndContest() {
        contest.endContest();
        contest.updateEndResult(this.nTime, this.questoesRes);
    }

    public synchronized boolean isNotOver() {
        if ((this.xQuestoes > this.questoesRes) && !contest.isContestOver()) {
            return true;
        } else {
            // Se o time tiver feito todas as questoes e o contest não tiver acabado->
            // finalizar contest
            if (!contest.isContestOver()) {
                contest.endContest();
                System.out.println("O time " + this.nTime + " finalizou o contest");
            }
            return false;
        }
    }

    public void run() {
        Thread[] competidores = new Thread[3];
        for (int i = 0; i < 3; i++) {
            competidores[i] = new Thread(new Competidor(this));
            competidores[i].start();
        }

        try {
            for (int i = 0; i < 3; i++) {
                competidores[i].join();
            }
        } catch (InterruptedException e) {
        }

        // System.out.println("O time " + this.nTime + " terminou o contest com " +
        // this.questoesRes +" questões respondidas");

    }

}

class Competidor implements Runnable {
    private Time time;
    private Computador computador;

    public Competidor(Time time) {
        this.time = time;
        this.computador = this.time.getComputador();
    }

    public void run() {

        while (this.time.isNotOver()) {
            try {
                if (this.time.isNotOver()) {
                    Thread.sleep(1500);
                    /*
                     * System.out.println( "Um competidor do time " + this.time.getNTime() +
                     * " terminou uma questão no papel");
                     */
                    this.computador.Implementa();
                    if (!this.time.isNotOver()) {
                        this.time.timeEndContest();
                    }
                }
            } catch (InterruptedException e) {
            }
        }
    }

}

class Computador {
    private boolean disponibilidade;
    private Time time;

    public Computador(Time time) {
        this.time = time;
        this.disponibilidade = true;
    }

    public synchronized void AtualizarDisponibilidade() {
        this.disponibilidade = !this.disponibilidade;
    }

    public synchronized void Implementa() {
        try {
            while (!disponibilidade) {
                wait();
                //System.out.println("Indisponivel");
            }

            if (disponibilidade && this.time.isNotOver()) {
                AtualizarDisponibilidade();
                Thread.sleep(1000);
                if (this.time.isNotOver()) {
                    this.time.addQuestoesRes();
                }
                /*
                 * System.out.println("o time " + this.time.getNTime() +
                 * " implementou uma questão no computador. Faltam " +
                 * this.time.getQuestoesRestantes());
                 */
                AtualizarDisponibilidade();
                notifyAll();
            }
        } catch (InterruptedException e) {
        }

    }
}