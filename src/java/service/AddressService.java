package service;

import dao.AddressDAO;
import entity.Address;
import java.util.List;

public class AddressService {
    private final AddressDAO addressDAO;

    public AddressService() {
        this.addressDAO = new AddressDAO();
    }

    public List<Address> getAddressesByUserId(int userId) {
        return addressDAO.getAddressesByUserId(userId);
    }

    public Address getDefaultAddress(int userId) {
        return addressDAO.getDefaultAddress(userId);
    }
}