package entity;

public class Address {
    private int addressId;
    private int userId;
    private String receiverName;
    private String phone;
    private String fullAddress;
    private boolean isDefault;

    public Address() {}

    public Address(int addressId, int userId, String receiverName, String phone, String fullAddress, boolean isDefault) {
        this.addressId = addressId;
        this.userId = userId;
        this.receiverName = receiverName;
        this.phone = phone;
        this.fullAddress = fullAddress;
        this.isDefault = isDefault;
    }

    // Getters and Setters
    public int getAddressId() { return addressId; }
    public void setAddressId(int addressId) { this.addressId = addressId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getReceiverName() { return receiverName; }
    public void setReceiverName(String receiverName) { this.receiverName = receiverName; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getFullAddress() { return fullAddress; }
    public void setFullAddress(String fullAddress) { this.fullAddress = fullAddress; }

    public boolean isDefault() { return isDefault; }
    public void setDefault(boolean isDefault) { this.isDefault = isDefault; }
}