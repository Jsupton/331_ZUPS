package gabes_ZUPS;
import java.sql.PreparedStatement;

/**
 * 
 */

/**
 * @author jsupton
 *
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
	
	
	  
}
