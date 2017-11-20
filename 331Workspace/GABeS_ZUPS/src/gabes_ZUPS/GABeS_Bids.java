package gabes_ZUPS;
import java.sql.*;
import java.util.Date;

/**
 * 
 */

/**
 * @author jsupton
 *
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
	 * 
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
	 * 
	 * 
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
