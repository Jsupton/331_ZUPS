package jupton.gabes_ZUPS;
import java.sql.Connection; 
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * This class encapsulates the required attributes in the GABeS_Customer table.
 * This Java Bean class is used in the GABeS Web system.
 * 
 * Used for the Online Web Bidding System - GABeS
 * @author jsupton
 */
public class GABeS_Customer {

	/**
	 * The following fields correspond to the fields in Table GABeS_Customer in your
	 * GABeS_ZUPS Oracle database
	 */
	private int userID;
	private String email;
	private String phone;
	private String fName;
	private String lName;
	private PreparedStatement preparedStmt;
	  
	
	 /**
	 * A default constructor ... no need for other constructors
   	 */
	public GABeS_Customer() {
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
	 * A getter for class field email
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * A setter for class field email
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * A getter for class field phone
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * A setter for class field phone
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	/**
	 * A getter for class field fName
	 * @return the fName
	 */
	public String getfName() {
		return fName;
	}

	/**
	 * A setter for class field fName
	 * @param fName the fName to set
	 */
	public void setfName(String fName) {
		this.fName = fName;
	}

	/**
	 * A getter for class field lName
	 * @return the lName
	 */
	public String getlName() {
		return lName;
	}

	/**
	 * A setter for class field lName
	 * @param lName the lName to set
	 */
	public void setlName(String lName) {
		this.lName = lName;
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
	 * Responsible for populating the instance variables with the userID of the account
	 * Object. It takes the UserID and populates the rest of the Instance variables from
	 * the retrieved result set.
   	 */
	public void setCustomerInfo() {
		try {
			String query = "Select * from GABeS_CUSTOMER Where UserID=?";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ps.clearParameters();
			ps.setInt(1, this.getUserID());
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				this.setUserID(rs.getInt(1));
				this.setEmail(rs.getString(2));
				this.setPhone(rs.getString(3));
				this.setfName(rs.getString(4));
				this.setlName(rs.getString(5));
			}
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
		}
	}
	
	/**
	 * This method uses the  current userID to get the  
	 * seller rating that the current user has. This method calls the 
	 * GABeS_SELLER_RATING() Function
	 * 
	 * @return a double representing the seller ratings for this user.
   	 */
	public double getSellerRating() {
		try {
			double sellerRating = 0;
			String query = "Select GABeS_SELLER_RATING(?) from DUAL";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ps.clearParameters();
			ps.setInt(1, this.getUserID());
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				sellerRating = rs.getFloat(1);
			}
			return sellerRating;
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return 0;
		}
	}
	
	/**
	 * This method uses the  current userID to get the number 
	 * of seller ratings that the current user has. This method calls the 
	 * GABeS_NUM_SELLER_RATING() Function
	 * 
	 * @return an double representing the number seller ratings for this user.
   	 */
	public double getNumSellerRating() {
		try {
			double sellerRating = 0;
			String query = "Select GABeS_NUM_SELLER_RATING(?) from DUAL";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ps.clearParameters();
			ps.setInt(1, this.getUserID());
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				sellerRating = rs.getFloat(1);
			}
			return sellerRating;
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return 0;
		}
	}
	
	/**
	 * This method uses the  current instance variables to update the specific
	 * customer information in the GABeS_Customer table
	 * 
	 * @return an integer representing the number of records updated
	 */
	public int UpdateCustomerInfo(){
		try {
			String query = "Update GABeS_Customer set FName=?, LName =?, Phone=?, Email=? where UserID =?";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ps.clearParameters();
			ps.setString(1, this.getfName());
			ps.setString(2, this.getlName());
			ps.setString(3, this.getPhone());
			ps.setString(4, this.getEmail());
			ps.setInt(5, this.getUserID());
			int r = ps.executeUpdate();
			return r;
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return -1;
		}
	}
	
	/**
	 * This method allows us to add a new customer to the database.
	 * It performs an Insert query with the current instance variables as values.
	 * @returns int the number of rows added
	 */
	public int addCustomer() throws IllegalStateException {
		try {
			String query = "Insert into GABeS_Customer Values(?,?,?,?,?)";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ps.setInt(1, this.getUserID());
			ps.setString(2, this.getEmail());
			ps.setString(3, this.getPhone());
			ps.setString(4, this.getfName());
			ps.setString(5, this.getlName());
			int r = ps.executeUpdate();
			return r;
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return -1;
		}
	}
	
}
