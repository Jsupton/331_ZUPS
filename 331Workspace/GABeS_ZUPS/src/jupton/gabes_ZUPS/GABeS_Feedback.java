package jupton.gabes_ZUPS;
import java.sql.*;
//Load JDBC API functions
import java.sql.*;
import oracle.jdbc.*;

/**
 * This class encapsulates the required attributes in the GABeS_Feedback table.
 * This Java Bean class is used in the GABeS Web system.
 * 
 * Used for the Online Web Bidding System - GABeS
 * @author jsupton
 */
public class GABeS_Feedback {

	/**
	 * The following fields correspond to the fields in Table GABeS_Feedback in your
	 * GABeS_ZUPS Oracle database
	 */
	  private int buyerID;
	  private int itemID;
	  private int rating;
	  private int itemQuality;
	  private int deliveryQuality;
	  private String comments;
	  private PreparedStatement preparedStmt;

	/**
	 * A default constructor ... no need for other constructors
   	 */
	public GABeS_Feedback() {
		
	}
	
	/**
	 * A getter for class field buyerID
	 * @return the buyerID
	 */
	public int getBuyerID() {
		return buyerID;
	}

	/**
	 * A setter for class field buyerID
	 * @param buyerID the buyerID to set
	 */
	public void setBuyerID(int buyerID) {
		this.buyerID = buyerID;
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
	 * A getter for class field rating
	 * @return the rating
	 */
	public int getRating() {
		return rating;
	}

	/**
	 * A setter for class field rating
	 * @param rating the rating to set
	 */
	public void setRating(int rating) {
		this.rating = rating;
	}

	/**
	 * A getter for class field itemQuality
	 * @return the itemQuality
	 */
	public int getItemQuality() {
		return itemQuality;
	}

	/**
	 * A setter for class field itemQuality
	 * @param itemQuality the itemQuality to set
	 */
	public void setItemQuality(int itemQuality) {
		this.itemQuality = itemQuality;
	}

	/**
	 * A getter for class field deliveryQuality
	 * @return the deliveryQuality
	 */
	public int getDeliveryQuality() {
		return deliveryQuality;
	}

	/**
	 * A setter for class field deliveryQuality
	 * @param deliveryQuality the deliveryQuality to set
	 */
	public void setDeliveryQuality(int deliveryQuality) {
		this.deliveryQuality = deliveryQuality;
	}

	/**
	 * A getter for class field comments
	 * @return the comments
	 */
	public String getComments() {
		return comments;
	}

	/**
	 * A setter for class field comments
	 * @param comments the comments to set
	 */
	public void setComments(String comments) {
		this.comments = comments;
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
	 * This method gets the all of the feedbaack records (itemID, Rating, ItemQuality, 
	 * DeliveryQuality, and Comments) that the specified user has.
	 * @param sellerID the Id for the current seller
	 * @return ResultSet containing the specified query
	 */
	public ResultSet getFeedback(int sellerID) {
		try {
			String query = "Select F.ItemID, Rating,ItemQuality,DeliveryQuality,Comments " + 
					"From GABeS_FEEDBACK F, Gabes_ITEM I where F.ItemID = I.ItemID and I.SellerID = ? "
					+ "Order by F.ItemID";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ps.clearParameters();
			ps.setInt(1,sellerID);
			ResultSet rs = ps.executeQuery();
			return rs;
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return null;
		}
	}
	
	/**
	 * This method is responsible for inserting a new feedback into the database.
	 * It takes all of the instance variables and sets them to values in the insert statement
	 * @return int representing the number of rows inserted/updated
	 */
	public int insertNewFeedback() {
		try {
			String query = "Insert into Gabes_Feedback values(?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ps.clearParameters();
			ps.setInt(1, this.getBuyerID());
			ps.setInt(2, this.getItemID());
			ps.setInt(3, this.getRating());
			ps.setInt(4, this.getItemQuality());
			ps.setInt(5, this.getDeliveryQuality());
			ps.setString(6, this.getComments());	
			return ps.executeUpdate();
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return -1;
		}
	}
	
	/**
	 * This method is responsible for checking to see if a user can place feedback on an item they bought.
	 * This method checks to see if there is a feedback in GABeS_Feedback with the given
	 * buyerID and ItemID. If there is this method returns false (The feedback is not open).
	 * @return boolean if true, the user can given feedback on the desired item.
	 */
	public boolean openFeedback(int BuyerID,int ItemID) {
		try {
			boolean b = true;
			String query = "Select * From GABeS_Feedback Where buyerID=? and ItemID=?";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ps.clearParameters();
			ps.setInt(1, BuyerID);
			ps.setInt(2, ItemID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b = false;
			}
			return b;
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return true;
		}
	}
	  
}
