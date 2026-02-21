package Service;

import java.util.ArrayList;
import Model.*;

public class DataStorage {

    public static ArrayList<User> users = new ArrayList<>();
    public static ArrayList<Product> products = new ArrayList<>();
    public static ArrayList<CartItem> cartItems = new ArrayList<>();
    public static ArrayList<Order> orders = new ArrayList<>();

    static {
        products.add(new Product(1, "Laptop", "HP 15s i5", 50000));
        products.add(new Product(2, "Mobile", "Samsung Galaxy", 20000));
        products.add(new Product(3, "Headphones", "Boat Wireless", 2000));
        products.add(new Product(4, "Keyboard", "Mechanical RGB", 3500));
        products.add(new Product(5, "Mouse", "Logitech Wireless", 1200));
        products.add(new Product(6, "Monitor", "24 inch IPS", 11000));
        products.add(new Product(7, "Tablet", "Lenovo Tab", 15000));
        products.add(new Product(8, "Smartwatch", "Noise ColorFit", 4000));
        products.add(new Product(9, "Speaker", "JBL Bluetooth", 3000));
        products.add(new Product(10, "Power Bank", "Mi 20000mAh", 1800));
    }
}