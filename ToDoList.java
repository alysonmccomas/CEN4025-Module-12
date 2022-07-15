package toDoListPackage;

import entity.ToDo;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import java.sql.*;
import java.util.ArrayList;

public class ToDoList {
    ArrayList<String> list = new ArrayList<>();
    private Connection connection;
    public void addToDo(String item) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        try {
            transaction.begin();

            ToDo newItem = new ToDo();
            if (item != null) {
                newItem.setItem(item);
                entityManager.persist(newItem);

                transaction.commit();
            }
        } finally {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            entityManager.close();
            entityManagerFactory.close();
        }
    }
    public void webDelete(String ddDelItem){
        //Execute query to remove
        try {
            ResultSet results = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/to_do_list",
                    "root", "password");
            Statement statement = connection.createStatement();
            int rowsAffected = statement.executeUpdate("DELETE FROM to_do WHERE item='"+ddDelItem+"'");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public String deleteToDo(int itemId) {
        int index = itemId - 1;
        String deletedItem = null;
        //Execute query to remove
        try {
            ResultSet results = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/to_do_list",
                    "root", "password");
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT item FROM to_do WHERE id=" + itemId);
            deletedItem = resultSet.getString(1);
            int rowsAffected = statement.executeUpdate("DELETE FROM to_do WHERE id=" + itemId);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return deletedItem;
    }

    public void viewToDo() {
        try {
            ResultSet results = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/to_do_list",
                    "root", "password");
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT item FROM to_do");
            while(resultSet.next()){
                list.add(resultSet.getString(1));
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        for (int i = 0; i < list.size(); i++){
            System.out.print((i + 1) + ".   ");
            System.out.println(list.get(i));
        }
    }
}
