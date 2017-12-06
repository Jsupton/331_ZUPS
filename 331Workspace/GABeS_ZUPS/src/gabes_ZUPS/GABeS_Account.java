package gabes_ZUPS;
import java.util.*;
import java.lang.*;
import java.io.*;
//Load JDBC API functions
import java.sql.*;
import oracle.jdbc.*;

/**
 * This class encapsulates the required attributes in the GABeS_Account table.
 * This Java Bean class is used in the GABeS Web systems.
 * 
 * Used for the Online Web Bidding System - GABeS
 * @author jsupton
 */
public class GABeS_Account {

	/**
	 * The following fields correspond to the fields in Table GABeS_Account in your
	 * GABeS_ZUPS Oracle database
	 */
	private int userID;
	private String userName;
	private String password;
	private String type;
	private PreparedStatement preparedStmt;
	  
	/**
	 * This instance variable denotes if a user is logged in or not.
	 */
	private boolean isLoggedIn = false;
	
	private boolean alerted = false;
	
	/**
	 * The Deault constructor... No parameters needed
	 */
	public GABeS_Account() {
	}

	/**
	 * A getter for class field userID
	 * @return the userID
	 */
	public int getUserID() {
		return userID;
	}

	/**
	 * A setter for class field userID
	 * @param userID the userID to set
	 */
	public void setUserID(int userID) {
		this.userID = userID;
	}

	/**
	 * A getter for class field userName
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * A setter for class field userName
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * A getter for class field password
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * A setter for class field password
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * A getter for class field type
	 * @return the type
	 */
	public String getType() {
		return type;
	}

	/**
	 * A setter for class field type
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}

	/**
	  * A getter for class field loggedIn
	  * @return whether the Customer is logged in or not
	  */
	 public Boolean isLoggedIn() {
	    return this.isLoggedIn;
	  }
	 
	 /**
	  * A getter for class field loggedIn
	  * @return whether the Customer is logged in or not
	  */
	 public Boolean hasBeenAlerted() {
	    return this.alerted;
	  }
	 
	 /**
	  * A getter for class field loggedIn
	  * @param whether the Customer has been alerted in or not
	  */
	 public void setAlerted() {
	    this.alerted = true;
	  }
	
	/**
	  * This method and creates and returns a Connection object to the database. 
	  * All other methods that need database access should call this method.
	  * @return a Connection object to Oracle
	  */
	 public Connection openDBConnection() {
	    try {
	      // Load driver and link to driver manager
	      Class.forName("oracle.jdbc.OracleDriver");
	      // Create a connection to the specified database
	     Connection myConnection = DriverManager.getConnection("jdbc:oracle:thin:@//cscioraclesrv.ad.csbsju.edu:1521/" +
	                                                            "csci.cscioraclesrv.ad.csbsju.edu","TEAM6", "psuz");
	      return myConnection;
	    } catch (Exception E) {
	      E.printStackTrace();
	      System.out.println("ERROR");
	      return null;
	    }
	  }
	
	/**
	 * responsible for logging in the current Admin/Customer.
	 * It uses the username and password that the user entered, and calls the GABeS_LOGIN 
	 * Procedure which returns either 1,2, or -1. 1 = Customer, 2 = Admin, -1 = Neither.
	 * 
	 * @returns int the number corresponding to either the type of user, or indicating the login
	 * was not successful
	 */
	public int login() {
		try{
			CallableStatement cstmt = openDBConnection().prepareCall( "{call GABeS_LOGIN(?, ?, ?)}");
			cstmt.setString(1, this.getUserName());
			cstmt.setString(2, this.getPassword());
			cstmt.registerOutParameter(3, Types.INTEGER);
			cstmt.execute (); 
			int x = cstmt.getInt(3);
			if(x==1||x==2) {
				isLoggedIn = true;
				this.getAccountInfo();
			}
			else
				isLoggedIn = false;
		 	return x;
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
	       	return 0;
		}
	}
	
	/**
	 * sets loggedIn class field to false
	 * @throws IllegalStateException if then method is called when loggedIn = false
	 */
	public void logout() throws IllegalStateException {
		if(!isLoggedIn())
			throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
		this.isLoggedIn = false;
	}
	
	/**
	 * This method calls the GABeS_UPDATE_STATUS method which sorts through all of the items
	 * in the database and makes sure that the status of each item is set properly
	 */
	public void updateStatus() {
		try {
			CallableStatement cstmt = openDBConnection().prepareCall( "{call GABeS_UPDATE_STATUS}");
			cstmt.execute (); 
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
		}
	}
	
	/**
	 * This method is used to populate the session variable once the user is
	 * successfully logged in. When the User logs in successfully, this method is called
	 * and the UserId and Type instance variables are set to their appropriate values.
	 */
	public void getAccountInfo() {
		try {
			Statement stmt = openDBConnection().createStatement();
			String query = "Select * from GABeS_ACCOUNT Where Username ='"+
					this.getUserName()+"' and Password='"+this.getPassword()+"'";
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()) {
				this.setUserID(rs.getInt("UserID"));
				this.setType(rs.getString("Type"));
			}
		}
		catch(SQLException e) {
			System.out.println(e.toString());
		}
	}
	
	/**
	 * This method updates the current account information with the given instance
	 * variable values. The JSP page loads user input value into the instance 
	 * variables which we used to update the GABeS_ACCOUNT table
	 * @return int showing how many rows were updated
	 * @throws IllegalStateException
	 */
	public int UpdateAccountInfo() throws IllegalStateException {
		try {
			String query = "Update GABeS_Account set Username=?, Password =? where UserID =?";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ps.clearParameters();
			ps.setString(1, this.getUserName());
			ps.setString(2, this.getPassword());
			ps.setInt(3, this.getUserID());
			int r = ps.executeUpdate();
			return r;
			
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return -1;
		}
	}
	
	/**
	 * This method is used for the User Management report. This method returns a result
	 * set that contains all Customers and their basic information.
	 * @return ResultSet containing all customers
	 * @throws illegalStateException
	 */
	public ResultSet getCustomerList() throws IllegalStateException {
		try {
			String query = "Select A.UserID,A.Username,C.FName,C.LName,C.Email,A.Password "
					+ "From GABeS_Account A,GABeS_Customer C Where A.UserID = C.UserID Order by A.UserID";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ResultSet r = ps.executeQuery();
			return r;
			
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return null;
		}
	}
	
	/**
	 * This method gets the next userID. It selects the max UserID in the 
	 * database, and adds one to that. This way we do not increment the counter every
	 * time we try to get the next value.
	 * @return int the next UserID in the DB
	 * @throws illegalStateException
	 */
	public int getNextUserID() throws IllegalStateException {
		try {
			int id = 0;
			String query = "SELECT max(UserID)+1 from GABeS_Account";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				id = rs.getInt(1);
			}
			return id;
			
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return 0;
		}
	}
	
	/**
	 * This method is responsible for adding a new customer to the Database.
	 * It uses the current instance variables to add this new user to the DB.
	 * @return int the number of rows inserted
	 * @throws illegalStateException
	 */
	public int addAccount() throws IllegalStateException {
		try {
			String query = "Insert into GABeS_Account Values(?,?,?,'C')";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ps.setInt(1, this.getUserID());
			ps.setString(2, this.getUserName());
			ps.setString(3, this.getPassword());
			int r = ps.executeUpdate();
			return r;
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return -1;
		}
	}
	
	/**
	 * This method is responsible for generating the Sales Summary report.
	 * It selects the Category, ItemID, ItemName, Final selling price and commission
	 * for each item sold.
	 * @return ResultSet containing the specified query
	 * @throws illegalStateException
	 */
	public ResultSet getSalesSummary() throws IllegalStateException {
		try {
			String query = "Select I.Categories,I.ItemID, I.ItemName, V.Final_Selling_Price, V.Commission "
					+ "From GABeS_Item I,GABeS_View_Items V Where I.ItemID = V.ItemID and V.Final_Selling_Price!= 0 Order by I.Categories,ItemID";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ResultSet r = ps.executeQuery();
			return r;
			
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return null;
		}
	}
	/**
	 * This method is responsible for generating the ratings Summary report.
	 * It selects the seller user name, the buyer user name, the item ID, the rating, and the comments
	 * for each seller
	 * @return ResultSet containing the specified query
	 * @throws illegalStateException
	 */
	public ResultSet getRatingsSummary() throws IllegalStateException {
		try {
			String query = "Select Seller.Username as Seller, Buyer.Username as Buyer, F.ItemID, Round((Sum(F.rating+F.ItemQuality+F.DeliveryQuality)*2)/3,2) as Rating, F.Comments "
					+ "From GABeS_Account Seller, GABeS_Account Buyer, GABeS_Feedback F, GABeS_Item I Where I.ItemID = F.ItemID and I.SellerID = Seller.UserID and Buyer.UserID = F.BuyerID Group by Seller.Username, Buyer.Username, F.ItemID, F.Comments Order by Seller,Rating";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ResultSet r = ps.executeQuery();
			return r;
			
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return null;
		}
	}
	
	/**
	 * This method is used to generate the Commission Report. It gets the UserID
	 * Username, First name, Last name, Email, rating, and total commissions for 
	 * each customer in the database.
	 * @return ResultSet containing the specified query
	 * @throws illegalStateException
	 */
	public ResultSet getCommissionReport() throws IllegalStateException {
		try {
			String query = "Select R.UserID,A.Username, R.Fname, R.Lname, R.Email, R.Rating, (Sum(V.COMMISSION)) Commissions " + 
					"From GABeS_SELLER_RATINGS R full outer join GABES_VIEW_ITEMS V on R.USERID=V.USERID, GABES_ACCOUNT A " + 
					"Where A.USERID = R.USERID " + 
					"Group by R.UserID,A.Username, R.Fname, R.Lname, R.Email,R.Rating";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ResultSet r = ps.executeQuery();
			return r;
			
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return null;
		}
	}
	
	/**
	 * This method gets the current total bids of all items the user is winning
	 * @return double representing the current bid amount
	 */
	public double getCurrentTotalBids() {
		try {
			double bid = 0.0;
			String query = "Select GABeS_Bids_Current_Total_Money(?) from Dual";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ps.clearParameters();
			ps.setInt(1, this.getUserID());
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				bid = rs.getDouble(1);
			}
			return bid;
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return 0.0;
		}
	}
	
	/**
	 * This method gets the number of bids the user is winning
	 * @return double representing the current bid amount
	 */
	public double getCurrentNumBidsWinning() {
		try {
			double bid = 0.0;
			String query = "Select GABeS_Current_Bids_Winning(?) from Dual";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ps.clearParameters();
			ps.setInt(1, this.getUserID());
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				bid = rs.getDouble(1);
			}
			return bid;
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return 0.0;
		}
	}
	
	/**
	 * This method gets the current total  of all items the user has bought
	 * @return double representing the current total
	 */
	public double getAmountItemsBought() {
		try {
			double bid = 0.0;
			String query = "Select GABeS_Bids_Total_Money(?) from Dual";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ps.clearParameters();
			ps.setInt(1, this.getUserID());
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				bid = rs.getDouble(1);
			}
			return bid;
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return 0.0;
		}
	}
	
	/**
	 * This method gets the number of all items the user has bought
	 * @return double representing the current total
	 */
	public double getNumItemsBought() {
		try {
			double bid = 0.0;
			String query = "Select GABeS_Num_Items_Bought(?) from Dual";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ps.clearParameters();
			ps.setInt(1, this.getUserID());
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				bid = rs.getDouble(1);
			}
			return bid;
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return 0.0;
		}
	}
	
	/**
	 * Method responsible for calculating the number of items that the
	 * user currently has on sale
	 * @return double representing the current total
	 */
	public double getNumItemsSelling() {
		try {
			double bid = 0.0;
			String query = "Select GABeS_Current_Num_Selling(?) from Dual";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ps.clearParameters();
			ps.setInt(1, this.getUserID());
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				bid = rs.getDouble(1);
			}
			return bid;
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return 0.0;
		}
	}
	
	/**
	 * Method responsible for calculating the dollar amount of the items
	 * the user is currently selling. It adds up all the current bids of 
	 * the user's items
	 * @return double representing the current amount on sale
	 */
	public double getAmountItemsSelling() {
		try {
			double bid = 0.0;
			String query = "Select GABeS_Current_Amount_Selling(?) from Dual";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ps.clearParameters();
			ps.setInt(1, this.getUserID());
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				bid = rs.getDouble(1);
			}
			return bid*0.95;
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return 0.0;
		}
	}
	
	/**
	 * Method responsible for calculating the total number of items 
	 * that the current user has sold
	 * @return double representing the current number sold
	 */
	public double getNumItemsSold() {
		try {
			double bid = 0.0;
			String query = "Select GABeS_Total_Num_Sold(?) from Dual";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ps.clearParameters();
			ps.setInt(1, this.getUserID());
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				bid = rs.getDouble(1);
			}
			return bid;
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return 0.0;
		}
	}
	
	/**
	 * Method responsible for returning the total dollar amount that the current
	 * user has sold.
	 * @return double representing the current total sold
	 */
	public double getAmountItemsSold() {
		try {
			double bid = 0.0;
			String query = "Select GABeS_Total_Amount_Sold(?) from Dual";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ps.clearParameters();
			ps.setInt(1, this.getUserID());
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				bid = rs.getDouble(1);
			}
			return bid*0.95;
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return 0.0;
		}
	}
	
}
