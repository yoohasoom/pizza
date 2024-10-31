package pizza_30304;

import java.util.Date;

public class dto {
	//피자 관련
    private String saleNo;      // 판매 번호
    private String shopCode;    // 지점 코드
    private String shopName;    // 지점 이름
    private String saleDate;      // 판매 날짜
    private String pizzaCode;    // 피자 코드
    private String pizzaName;    // 피자 이름
    private String amount;         // 판매 수량
    private String total;       // 매출액

//////유저관련
    private String id;
    private String name;
    private String password;

    public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
/////////
    
    // Getter 및 Setter 메서드 pizza
    public String getSaleNo() {
        return saleNo;
    }

    public void setSaleNo(String saleNo) {
        this.saleNo = saleNo;
    }

    public String getShopCode() {
        return shopCode;
    }

    public void setShopCode(String shopCode) {
        this.shopCode = shopCode;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public String getSaleDate() {
        return saleDate;
    }

    public void setSaleDate(String saleDate) {
        this.saleDate = saleDate;
    }

    public String getPizzaCode() {
        return pizzaCode;
    }

    public void setPizzaCode(String pizzaCode) {
        this.pizzaCode = pizzaCode;
    }

    public String getPizzaName() {
        return pizzaName;
    }

    public void setPizzaName(String pizzaName) {
        this.pizzaName = pizzaName;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String string) {
        this.total = string;
    }
}
