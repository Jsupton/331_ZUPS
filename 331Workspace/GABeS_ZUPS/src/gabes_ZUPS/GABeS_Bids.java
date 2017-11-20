package gabes_ZUPS;
import java.util.Date;
//Load JDBC API functions
import java.sql.*;
import oracle.jdbc.*;

/**
 * This class encapsulates the required attributes in the GABeS_Bids table.
 * This Java Bean class is used in the GABeS Web system.
 * 
 * Used for the Online Web Bidding System - GABeS
 * @author jsupton
 */
public class GABeS_Bids {
	
	/**
	 * The following fields correspond to the fields in Table GABeS_Bids in your
	 * GABeS_ZUPS Oracle database
	 */
	private int userID;
	private int itemID;
	private int maxBid;
	private String bidTime;
	private PreparedStatement preparedStmt;
	  
	/**
	 * A default constructor ... no need for other constructors
   	 */
	public GABeS_Bids() {
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
	 * A getter for class field itemID
	 * @return the itemID
	 */
	public int getItemID() {
		return itemID;
	}

	/**
	 * A setter for class field itemID
	 * @param itemID the itemID to set
	 */
	public void setItemID(int itemID) {
		this.itemID = itemID;
	}

	/**
	 * A getter for class field maxBid
	 * @return the maxBid
	 */
	public int getMaxBid() {
		return maxBid;
	}

	/**
	 * A setter for class field maxBid
	 * @param maxBid the maxBid to set
	 */
	public void setMaxBid(int maxBid) {
		this.maxBid = maxBid;
	}

	/**
	 * A getter for class field bidTime
	 * @return the bidTime
	 */
	public String getBidTime() {
		return bidTime;
	}

	/**
	 * A setter for class field bidTime
	 * @param bidTime the bidTime to set
	 */
	public void setBidTime(String bidTime) {
		this.bidTime = bidTime;
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
	 * This method allows a customer to bid on an item. It executes an insert query
	 * using the instance variables in the current GABeS_Bids object.
	 */
	public void bidOnItem(){
		try {
			String query = "INSERT into GABeS_Bids values (?,?,?,CURRENT_TIMESTAMP)";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ps.clearParameters();
			ps.setInt(1, this.getUserID());
			ps.setInt(2, this.getItemID());
			ps.setInt(3, this.getMaxBid());
			ps.executeUpdate();
		}
		catch(SQLException sql) {
			System.out.println(sql.toString());
		}
	}
	
	/**
	 * This method allows a customer to view the list of everyone bidding
	 * on their specified item. It performs a query that gets the BidTime, username and max
	 * bid from the Bids table for each bid on the specific item.
	 * @return ResultSet containing the specified query.
	 */
	public ResultSet viewListOfBidders(){
		try {
			String query = "Select bidtime as Bid_Time, username, b.MaxBid From GABES_Bids b,GABES_Account a where b.UserID=a.UserID and b.ItemID=? Order by Bid_Time";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ps.clearParameters();
			ps.setInt(1, this.getItemID());
			ResultSet rs = ps.executeQuery();
			return rs;
		}
		catch(SQLException sql) {
			System.out.println(sql.toString());
			return null;
		}
	}
	
}
