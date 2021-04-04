package com.css.login;

import java.util.ArrayList;

public class UsersDB {

	private ArrayList<User> users;
	
	public UsersDB () {
		this.users = new ArrayList();
		
		User defaultUser1 = new User("first@mail.com", "first");
		User defaultUser2 = new User("second@mail.com", "second");
		User defaultUser3 = new User("third@mail.com", "third");
		users.add(defaultUser1);
		users.add(defaultUser2);
		users.add(defaultUser3);
	}

	public ArrayList<User> getUsers() {
		return users;
	}

	public void setUsers(ArrayList<User> users) {
		this.users = users;
	}
	
	public boolean check(String email, String password) {
		
		for (User user : users) {
			if (user.getEmail().equals(email) &
					user.getPasword().equals(password)) {
				return true;
			}
		}
		return false;
	}
	
	public void addUser(User user) {
		this.users.add(user);
	}
	
	
}
