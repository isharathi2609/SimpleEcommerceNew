
package Model;

public class Order {
    private String userEmail;
    private double total;

    public Order(String userEmail, double total) {
        this.userEmail = userEmail;
        this.total = total;
    }

    public double getTotal() { return total; }
}
