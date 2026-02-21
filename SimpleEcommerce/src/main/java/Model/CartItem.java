package Model;

public class CartItem {
    private String userEmail;
    private Product product;
    private int quantity;

    public CartItem(String userEmail, Product product, int quantity) {
        this.userEmail = userEmail;
        this.product = product;
        this.quantity = quantity;
    }

    public String getUserEmail() { return userEmail; }
    public Product getProduct() { return product; }
    public int getQuantity() { return quantity; }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}