package bean;

import java.sql.*;

public class User {
	private int id;
	public String username;
	private String password;
	
	public User(){
		
	}
	public User(int id,String username,String password){
		this.id = id;
		this.username = username;
		this.password = password;
	}
	
	public int getId(){
		return id;
	}
	public String getUsername(){
		return username;
	}
	public String getPassword(){
		return password;
	}
	public void setId(int id){
		this.id = id;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public User match(String un,String pw) {
		
		User user = null;
		
		ConnectDataBase cdb = new ConnectDataBase(); 
		Connection conn = cdb.getConn();
		
		String sql ="select * from user where(username=? and password=?)";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,un);
			pstmt.setString(2,pw);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				user = new User();
				System.out.println("user="+user);
				user.username = rs.getString("username");
				user.password = rs.getString("password");
			}
			if(rs!=null){
				rs.close();
			}
			if(pstmt!=null){
				pstmt.close();
			}
			if(conn!=null){
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("这里好像不太对！");
		}
		return user;
	}
	
}
