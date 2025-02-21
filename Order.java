package model.before;
import lombok.Data;
@Data
public class Order {
	private int id;
	private int busertable_id;
	private double amount;
	private int status;
	private String orderdate;
}
