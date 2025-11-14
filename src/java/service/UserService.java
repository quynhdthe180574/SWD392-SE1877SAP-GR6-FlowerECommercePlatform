/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

/**
 *
 * @author FPTSHOP
 */
import dao.UserDAO;
import entity.User;
import util.PasswordEncryptor;

public class UserService {
    private UserDAO userDAO = new UserDAO();

    public String register(User user) {
        if (userDAO.checkEmailExists(user.getEmail())) {
            return "Email already registered!";
        }

        String hashed = PasswordEncryptor.encrypt(user.getPassword());
        user.setPassword(hashed);
        user.setRole("user");
        user.setAvatar("default.png");

        userDAO.insertUser(user);
        return "success";
    }

    public User login(String email, String password) {
        String hashed = PasswordEncryptor.encrypt(password);
        return userDAO.login(email, hashed);
    }
}
