package Entity;

public class Users {
	private String username, password;
	private byte isAdmin;
	
	public Users() {
	}

	public Users(String username, String password, byte isAdmin) {
		this.username = username;
		this.password = password;
		this.isAdmin = isAdmin;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public byte getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(byte isAdmin) {
		this.isAdmin = isAdmin;
	}

	@Override
	public String toString() {
		return "Users [username=" + username + ", password=" + password + ", isAdmin=" + isAdmin + "]";
	}
}
