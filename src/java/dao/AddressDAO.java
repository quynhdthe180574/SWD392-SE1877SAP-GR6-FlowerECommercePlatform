package dao;

import entity.Address;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AddressDAO {

    public List<Address> getAddressesByUserId(int userId) {
        List<Address> list = new ArrayList<>();
        String sql = "SELECT address_id, receiver_name, phone, full_address, is_default FROM Address WHERE user_id = ?";
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Address addr = new Address();
                    addr.setAddressId(rs.getInt("address_id"));
                    addr.setUserId(userId);
                    addr.setReceiverName(rs.getString("receiver_name"));
                    addr.setPhone(rs.getString("phone"));
                    addr.setFullAddress(rs.getString("full_address"));
                    addr.setDefault(rs.getBoolean("is_default"));
                    list.add(addr);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Address getDefaultAddress(int userId) {
        String sql = "SELECT TOP 1 address_id, receiver_name, phone, full_address FROM Address WHERE user_id = ? AND is_default = 1";
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Address addr = new Address();
                    addr.setAddressId(rs.getInt("address_id"));
                    addr.setReceiverName(rs.getString("receiver_name"));
                    addr.setPhone(rs.getString("phone"));
                    addr.setFullAddress(rs.getString("full_address"));
                    addr.setDefault(true);
                    return addr;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}