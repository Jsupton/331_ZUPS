package gabes_ZUPS;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

/**
 * 
 */

/**
 * @author jsupton
 *
 */
public class GABeS_Item {

	/**
	 * The following fields correspond to the fields in Table GABeS_Item in your
	 * GABeS_ZUPS Oracle database
	 */
	  private int itemID;
	  private String itemName;
	  private String categories;
	  private String startTime;
	  private String endTime;
	  private int startPrice;
	  private String status;
	  private String description;
	  private int seller;
	  private PreparedStatement preparedStmt;

	/**
	 * A default constructor ... no need for other constructors
   	 */
	public GABeS_Item() {
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
	 * A getter for class field itemName
	 * @return the itemName
	 */
	public String getItemName() {
		return itemName;
	}

	/**
	 * A setter for class field itemName
	 * @param itemName the itemName to set
	 */
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	/**
	 * A getter for class field categories
	 * @return the categories
	 */
	public String getCategories() {
		return categories;
	}

	/**
	 * A setter for class field categories
	 * @param categories the categories to set
	 */
	public void setCategories(String categories) {
		this.categories = categories;
	}

	/**
	 * A getter for class field startTime
	 * @return the startTime
	 */
	public String getStartTime() {
		return startTime;
	}

	/**
	 * A setter for class field startTime
	 * @param dtartTime the startTime to set
	 */
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	/**
	 * A getter for class field endTime
	 * @return the endTime
	 */
	public String getEndTime() {
		return endTime;
	}

	/**
	 * A setter for class field endTime
	 * @param endTime the endTime to set
	 */
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	/**
	 * A getter for class field startPrice
	 * @return the startPrice
	 */
	public int getStartPrice() {
		return startPrice;
	}

	/**
	 * A setter for class field startPrice
	 * @param startPrice the startPrice to set
	 */
	public void setStartPrice(int startPrice) {
		this.startPrice = startPrice;
	}

	/**
	 * A getter for class field status
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * A setter for class field status
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	/**
	 * A getter for class field description
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * A setter for class field description
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * A getter for class field seller
	 * @return the seller
	 */
	public int getSeller() {
		return seller;
	}

	/**
	 * A setter for class field seller
	 * @param seller the seller to set
	 */
	public void setSeller(int seller) {
		this.seller = seller;
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
	public ResultSet getAllCategories() {
		try {
			String query = "Select Distinct categories from GABeS_Item Order by categories";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			return rs;
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return null;
		}
	}
	
	/**
	 * 
	 */
	public ResultSet getItemInfo() {
		try {
			String query = "Select ItemID, ItemName, Categories, StartPrice, StartTime, EndTime, Description, GABes_Current_Winner(ItemID) from GABeS_Item Where ItemID =?";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ps.clearParameters();
			ps.setInt(1, this.getItemID());
			ResultSet rs = ps.executeQuery();
			return rs;
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return null;
		}
	}
	
	/**
	 * 
	 */
	public double getCurrentBid() {
		try {
			double bid = 0.0;
			String query = "Select GABeS_Current_Bid(?) from Dual";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ps.clearParameters();
			ps.setInt(1, this.getItemID());
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
	 * 
	 */
	public String getCurrentWinner() {
		try {
			String winner = "";
			String query = "Select GABeS_Current_Winner(?) from Dual";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ps.clearParameters();
			ps.setInt(1, this.getItemID());
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				winner = rs.getString(1);
			}
			return winner;
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return null;
		}
	}
	
	/**
	 * 
	 */
	public void setItemInfo() {
		try {
			String query = "Select ItemName,Categories,StartTime,EndTime,StartPrice,Status,Description,SellerID from Gabes_Item where ItemID =?";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ps.clearParameters();
			ps.setInt(1, this.getItemID());
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				this.setItemName(rs.getString(1));
				this.setCategories(rs.getString(2));
				this.setStartTime(rs.getString(3));
				this.setEndTime(rs.getString(4));
				this.setStartPrice(rs.getInt(5));
				this.setStatus(rs.getString(6));
				this.setDescription(rs.getString(7));
				this.setSeller(rs.getInt(8));
			}
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
		}
	}
	
	/**
	 * 
	 */
	public ResultSet getItemsBidOn(int userID) {
		try {
			String query = "Select Distinct i.ItemID,i.ItemName,i.Categories,i.StartTime,i.EndTime,GABeS_Current_Bid(i.ItemID) as CurrentBid,"
					+ "GABeS_Current_Winner(i.ItemID) as CurrentWinner from Gabes_Item i,Gabes_Bids b where b.UserID=? and i.ItemID=b.ItemID "
					+ "and i.endTime>Current_Timestamp";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ps.clearParameters();
			ps.setInt(1,userID);
			ResultSet rs = ps.executeQuery();
			return rs;
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return null;
		}
	}
	
	public ResultSet getItemsBought(int userID) {
		try {
			String query = "SELECT Distinct b.itemID, i.itemName, i.Categories, i.startTime, i.endtime,i.StartPrice, GABeS_CURRENT_BID(i.itemid) as Final_Selling_Price,\n" + 
					"      	(Select Username From GABeS_ACCOUNT A Where A.UserID = i.SellerID) as Seller_Username,(Select email From GABeS_CUSTOMER C Where C.UserID = i.SellerID) as Seller_Email\n" + 
					"FROM gabes_item i,GABeS_BIDS B, GABeS_ACCOUNT A\n" + 
					"WHERE i.ItemID = b.ItemID and B.UserID = A.UserID and i.endTime < CURRENT_TIMESTAMP and GABeS_CURRENT_WINNER(i.itemid) = A.username and A.UserID = ?";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ps.clearParameters();
			ps.setInt(1,userID);
			ResultSet rs = ps.executeQuery();
			return rs;
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return null;
		}
	}
	/**
	 * 
	 */
	public ResultSet getItemsSelling(int userID) {
		try {
			String query = "Select i.ItemID,i.ItemName,i.Categories,i.StartTime,i.EndTime,startPrice,GABeS_Current_Bid(i.ItemID) as CurrentBid,"
					+ " Status from Gabes_Item i where i.sellerID=? Order by i.itemID ";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ps.clearParameters();
			ps.setInt(1,userID);
			ResultSet rs = ps.executeQuery();
			return rs;
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return null;
		}
	}
	
	public String getDate(Timestamp date) {
		try {
			String newDate = "";
			String query = "SELECT to_char(?, 'DD-MM-YYYY HH.mi AM') as dt from dual";
			PreparedStatement ps = openDBConnection().prepareStatement(query);
			ps.clearParameters();
			ps.setTimestamp(1,date);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				newDate = rs.getString(1);
			}
			return newDate;
		}
		catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return null;
		}
	}
	  
}
