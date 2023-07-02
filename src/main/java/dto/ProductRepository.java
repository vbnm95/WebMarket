package dto;

import java.util.ArrayList;

// 상품 데이터 접근 클래스
public class ProductRepository {
	
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	private static ProductRepository instance = new ProductRepository();
	
	public static ProductRepository getInstance() {
		return instance;
	}
	
	public ProductRepository() {
		Product phone = new Product("P1234", "iPhone 6s", 800000);
		phone.setDescription("4.7-inch, 1334X750 Renina HD display, 8-megapixel iSight Camera");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("New");
		phone.setFilename("P1234.png");
		
		Product notebook = new Product("P1235", "LG PC gram", 1500000);
		notebook.setDescription("13.3-inch, IPS LED display, 5rd Generation Intel Core processors");
		notebook.setCategory("Notebook");
		notebook.setManufacturer("LG");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("Refurbished");
		notebook.setFilename("P1235.png");
		
		Product tablet = new Product("P1236", "Galaxy Tab S", 900000);
		tablet.setDescription("212*125*6 mm, super AMOLED display, octa-Core processors");
		tablet.setCategory("Tablet");
		tablet.setManufacturer("SAMSUNG");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
		tablet.setFilename("P1236.png");
		
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
	}
	
	//상품 목록을 가져오는 메소드
	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}
	
	//상품 ID를 받아서 Product 객체를 리턴하는 메소드
	public Product getProcutByID(String productID) {
		Product productByID = null;
		
		for(int i=0; i<listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if(product != null && product.getProductID() != null && product.getProductID().equals(productID)) {
				productByID = product;
				break;
			}
		}
		
		return productByID;
	}
	
	//새로운 상품 정보를 등록하는 메소드
	public void addProduct(Product product) {
		listOfProducts.add(product);	
	}

}
