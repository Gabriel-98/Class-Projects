import java.util.ArrayList;

public class Observable{
	protected ArrayList<Observer> observadores;

	public Observable(){
		observadores = new ArrayList<Observer>();
	}

	public void addObserver(Observer observer){
		observadores.add(observer);
	}

	public void deleteObserver(Observer observer){
		observadores.remove(observer);
	}

	public void notifyObserver(){
		for(Observer observer : observadores){
			observer.update();
		}
	}

	public void notifyObserver(Observer observer){
		observer.update();
	}
}