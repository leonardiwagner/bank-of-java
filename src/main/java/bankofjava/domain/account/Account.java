package bankofjava.domain.account;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name="account")
public class Account {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	protected int id;
	private String name;
	private String email;
	private String password;
	private BigDecimal balance;
	private Date created;
	private Date deleted;
	
	
	public Account(){}
	public Account(String name, String email, String password){
		this.name = name;
		this.email = email;
		this.password = password;
		this.balance = new BigDecimal(0);
		this.created = new Date();
	}
	
	public void addCoin(BigDecimal coin){
		balance = this.balance.add(coin);
	}
	
	public void withdrawCoin(BigDecimal coin){
		balance = this.balance.subtract(coin);
	}
	
	public BigDecimal getBalance(){
		return balance;
	}
	
	public int getId(){
		return this.id;
	}
	
	public String getName(){
		return this.name;
	}
	
	public String getEmail(){
		return this.email;
	}
	
	

}
