package gabes_ZUPS;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * This class encapsulates the required attributes for Searching items in the DB.
 * This Java Bean class is used in the GABeS Web system.
 * 
 * Used for the Online Web Bidding System - GABeS
 * @author jsupton
 */
public class GABeS_Search {
	
	/**
	 * The following fields correspond to the fields for Searching for Items
	 */
	private String itemID;
	private String keyword;
	private String category;
	private String minCurrentBid;
	private String maxCurrentBid;
	private String startDate;
	private String endDate;
	private String soundex;
	private String searchCriteria;
	private String startDay;
	private String endDay;
	private String startMonth;
	private String endMonth;
	private String startYear;
	private String endYear;
	
	/**
	 * Gets the ItemID
	 * @return the itemID
	 */
	public String getItemID() {
		return itemID;
	}
	
	/**
	 * Sets the ItemID to the Parameter value
	 * @param itemID the itemID to set
	 */
	public void setItemID(String itemID) {
		this.itemID = itemID;
	}
	
	/**
	 * Gets the keyword
	 * @return the keyword
	 */
	public String getKeyword() {
		return keyword;
	}
	
	/**
	 * Sets the keyword to the Parameter value
	 * @param keyword the keyword to set
	 */
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	/**
	 * Gets the Category
	 * @return the category
	 */
	public String getCategory() {
		return category;
	}
	
	/**
	 * Sets the Category to the Parameter value
	 * @param category the category to set
	 */
	public void setCategory(String category) {
		this.category = category;
	}
	
	/**
	 * Gets the minCurrentBid
	 * @return the minCurrentBid
	 */
	public String getMinCurrentBid() {
		return minCurrentBid;
	}
	
	/**
	 * Sets the setMinCurrentBid to the Parameter value
	 * @param minCurrentBid the minCurrentBid to set
	 */
	public void setMinCurrentBid(String minCurrentBid) {
		this.minCurrentBid = minCurrentBid;
	}
	
	/**
	 * Gets the maxCurrentBid
	 * @return the maxCurrentBid
	 */
	public String getMaxCurrentBid() {
		return maxCurrentBid;
	}
	
	/**
	 * Sets the setMaxCurrentBid to the Parameter value
	 * @param maxCurrentBid the maxCurrentBid to set
	 */
	public void setMaxCurrentBid(String maxCurrentBid) {
		this.maxCurrentBid = maxCurrentBid;
	}
	
	/**
	 * Gets the startDate
	 * @return the startDate
	 */
	public String getStartDate() {
		return startDate;
	}
	
	/**
	 * Sets the startDate to the Parameter value
	 * @param startDate the startDate to set
	 */
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	
	/**
	 * Gets the endDate
	 * @return the endDate
	 */
	public String getEndDate() {
		return endDate;
	}
	
	/**
	 * Sets the endDate to the Parameter value
	 * @param endDate the endDate to set
	 */
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	/**
	 * Gets the Soundex
	 * @return the soundex
	 */
	public String getSoundex() {
		return soundex;
	}
	
	/**
	 * Sets the soundex to the Parameter value
	 * @param soundex the soundex to set
	 */
	public void setSoundex(String soundex) {
		this.soundex = soundex;
	}
	
	/**
	 * Gets the startDay
	 * @return the startDay
	 */
	public String getStartDay() {
		return startDay;
	}

	/**
	 * Sets the startDay to the Parameter value
	 * @param startDay the startDay to set
	 */
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}

	/**
	 * Gets the endDay
	 * @return the endDay
	 */
	public String getEndDay() {
		return endDay;
	}

	/**
	 * Sets the endDay to the Parameter value
	 * @param endDay the endDay to set
	 */
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}

	/**
	 * Gets the startMonth
	 * @return the startMonth
	 */
	public String getStartMonth() {
		return startMonth;
	}

	/**
	 * Sets the startMonth to the Parameter value
	 * @param startMonth the startMonth to set
	 */
	public void setStartMonth(String startMonth) {
		this.startMonth = startMonth;
	}

	/**
	 * Gets the endMonth
	 * @return the endMonth
	 */
	public String getEndMonth() {
		return endMonth;
	}

	/**
	 * Sets the endMonth to the Parameter value
	 * @param endMonth the endMonth to set
	 */
	public void setEndMonth(String endMonth) {
		this.endMonth = endMonth;
	}

	/**
	 * Gets the startYear
	 * @return the startYear
	 */
	public String getStartYear() {
		return startYear;
	}

	/**
	 * Sets the startYear to the Parameter value
	 * @param startYear the startYear to set
	 */
	public void setStartYear(String startYear) {
		this.startYear = startYear;
	}

	/**
	 * Gets the endYear
	 * @return the endYear
	 */
	public String getEndYear() {
		return endYear;
	}

	/**
	 * Sets the endYear to the Parameter value
	 * @param endYear the endYear to set
	 */
	public void setEndYear(String endYear) {
		this.endYear = endYear;
	}

	/**
	 * Gets the Search Criteria
	 * @return the searchCriteria
	 */
	public String getSearchCriteria() {
		return searchCriteria;
	}
	
	/**
	 * Sets the search Criteria to the Parameter value
	 * @param searchCriteria the searchCriteria to set
	 */
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
	
	/**
	 * Default constructor
	 */
	public GABeS_Search() {
		
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
	  * This method is responsible for performing the search operation. It uses its instance fields to 
	  * determine what kind of search the user is choosing to do and  then execute that query
	  * @param the current UserID, used to exclude all items that the current User is selling.
	  * @return ResultSet containing the desired query
	  */
	public ResultSet Search(int userID) {
		try {
			this.setDates();
			Statement stmt = openDBConnection().createStatement();
			//Create Select statement to select all Items on sale so far
			String query = "Select ItemID, ItemName,Categories,StartTime,EndTime,GABeS_Current_Bid(ItemID) as Current_Bid,GABeS_Current_Winner(itemID) as "
					+ "currentWinner From GABeS_ITEM WHERE EndTime>CURRENT_TIMESTAMP and SellerID<>"+userID+" ";
			this.setSearchCriteria("<span style=\"color:red\"><b>NONE</b></span>");
			//Search by ItemID
			if(!(this.getItemID()==null)) {
				query += " and ItemID ="+this.getItemID();
				this.setSearchCriteria("<span style=\"color:red\"><b>ItemID</b></span> = "+this.getItemID());
			}
			//Search by Soundex
			else if(!(this.getSoundex()==null)) {
				query += " and soundex(ItemName) = soundex('"+this.getSoundex()+"')";
				this.setSearchCriteria("<span style=\"color:red\"><b>Soundex</b></span> = "+this.getSoundex());
			}
			//Search by Keyword, Category, Current Bid Range, and Date Range
			else if(!(this.getKeyword()==null) && !this.getCategory().equals("0") && !(this.getMaxCurrentBid()==null) &&
					!(this.getMinCurrentBid()==null) && !(this.getStartDate()==null) && !(this.getEndDate()==null)) {
				query += " and Categories ='"+this.getCategory()+"' and "
						+ "LOWER(ItemName) like LOWER('%"+this.getKeyword()+"%') "
						+" and GABeS_Current_Bid(ItemID) between "+this.getMinCurrentBid()+" and "+this.getMaxCurrentBid()
						+" and StartTime > '"+this.getStartDate()+"' and EndTime < '"+this.getEndDate()+"'";
				this.setSearchCriteria("<span style=\"color:red\"><b>Category</b></span>="+this.getCategory()+"  :  <span style=\"color:red\"><b>Keyword</b></span>="+this.getKeyword()+
						"  :  "+this.getMinCurrentBid()+" <span style=\"color:red\"><b>&#8804 CurrentBid &#8804</b></span> "+
						this.getMaxCurrentBid()+"  :  <span style=\"color:red\"><b>StartDate &#8805</b></span> "+this.getStartDate()+"  <i>and</i> "+this.getEndDate()+" <span style=\"color:red\"><b>&#8804 EndDate</b></span> ");
			}
			//Search by Keyword, Current Bid Range, and Date Range
			else if(!(this.getKeyword()==null) && !(this.getMaxCurrentBid()==null) && !(this.getMinCurrentBid()==null) && 
					!(this.getStartDate()==null) && !(this.getEndDate()==null)) {
				query += " and LOWER(ItemName) like LOWER('%"+this.getKeyword()+"%') "
						+" and GABeS_Current_Bid(ItemID) between "+this.getMinCurrentBid()+" and "+this.getMaxCurrentBid()
						+" and StartTime > '"+this.getStartDate()+"' and EndTime < '"+this.getEndDate()+"'";
				this.setSearchCriteria("<span style=\"color:red\"><b>Keyword</b></span>="+this.getKeyword()+"  :  "+this.getMinCurrentBid()+" <span style=\"color:red\"><b>&#8804 CurrentBid &#8804</b> </span>"+
						this.getMaxCurrentBid()+"  :  <span style=\"color:red\"><b>StartDate &#8805</b></span> "+this.getStartDate()+"  <i>and</i> "+this.getEndDate()+" <span style=\"color:red\"><b>&#8804 EndDate </b></span>");
			}
			//Search by Keyword, Category, and Date Range
			else if(!(this.getKeyword()==null) && !this.getCategory().equals("0") && !(this.getStartDate()==null) && !(this.getEndDate()==null)) 
			{
				query += " and Categories ='"+this.getCategory()+"' "
						+ "and LOWER(ItemName) like LOWER('%"+this.getKeyword()+"%') "
						+" and StartTime > '"+this.getStartDate()+"' and EndTime < '"+this.getEndDate()+"'";
				this.setSearchCriteria("<span style=\"color:red\"><b>Category</b></span>="+this.getCategory()+"  :  <span style=\"color:red\"><b>Keyword</b></span>="+this.getKeyword()+
						"  :  <span style=\"color:red\"><b>StartDate &#8805</b></span> "+this.getStartDate()+"  <i>and</i> "+this.getEndDate()+" <span style=\"color:red\"><b>&#8804 EndDate</b></span> ");
			}
			//Search by Keyword, Category, and Current Bid Range
			else if(!(this.getKeyword()==null) && !this.getCategory().equals("0") && !(this.getMaxCurrentBid()==null) &&!(this.getMinCurrentBid()==null)) 
			{
				query += " and Categories ='"+this.getCategory()+"' "
						+ "and LOWER(ItemName) like LOWER('%"+this.getKeyword()+"%') "
						+" and GABeS_Current_Bid(ItemID) between "+this.getMinCurrentBid()+" and "+this.getMaxCurrentBid();
				this.setSearchCriteria("<span style=\"color:red\"><b>Category</b></span>="+this.getCategory()+"  :  <span style=\"color:red\"><b>Keyword</b></span>="+this.getKeyword()+"  :  "+
						this.getMinCurrentBid()+" <span style=\"color:red\"><b>&#8804 CurrentBid &#8804</b></span> "+this.getMaxCurrentBid());
			}
			//Search by Keyword and Category
			else if(!(this.getKeyword()==null) && !this.getCategory().equals("0")) 
			{
				query += " and Categories ='"+this.getCategory()+"' and "
						+ "LOWER(ItemName) like LOWER('%"+this.getKeyword()+"%')";
				this.setSearchCriteria("<span style=\"color:red\"><b>Category</b></span>="+this.getCategory()+"  :  <span style=\"color:red\"><b>Keyword</b></span>="+this.getKeyword());
			}
			//Search by Keyword and Current Bid Range
			else if(!(this.getKeyword()==null) && !(this.getMaxCurrentBid()==null) &&!(this.getMinCurrentBid()==null)) 
			{
				query += " and LOWER(ItemName) like LOWER('%"+this.getKeyword()+"%') "
						+" and GABeS_Current_Bid(ItemID) between "+this.getMinCurrentBid()+" and "+this.getMaxCurrentBid();
				this.setSearchCriteria("<span style=\"color:red\"><b>Keyword</b></span>="+this.getKeyword()+" : "+this.getMinCurrentBid()+" <span style=\"color:red\"><b>&#8804 CurrentBid &#8804</b></span> "+this.getMaxCurrentBid());
			}
			//Search by Keyword and Date Range
			else if(!(this.getKeyword()==null) && !(this.getStartDate()==null) && !(this.getEndDate()==null)) 
			{
				query += " and LOWER(ItemName) like LOWER('%"+this.getKeyword()+"%') "
						+" and StartTime > '"+this.getStartDate()+"' and EndTime < '"+this.getEndDate()+"'";
				this.setSearchCriteria("<span style=\"color:red\"><b>Keyword</b></span>="+this.getKeyword()+"  :  <span style=\"color:red\"><b>StartDate &#8805 </b></span>"+this.getStartDate()+
						" <i>and</i> "+this.getEndDate()+" <span style=\"color:red\"><b>&#8804 EndDate</b></span> ");
			}
			//Search by Keyword
			else if(!(this.getKeyword()==null)) 
			{
				query += " and LOWER(ItemName) like LOWER('%"+this.getKeyword()+"%')";
				this.setSearchCriteria("<span style=\"color:red\"><b>Keyword<b/></span>="+this.getKeyword());
			}
			//Execute and return the result set
			query += " Order by ItemID";
			ResultSet rs = stmt.executeQuery(query);
			return rs;
		}
		catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * This combines the startDay,startMonth, and start Year to get a date string.
	 * It also does the same with the endDay,endMonth, and end Year.
	 * The dates are kept as strings because it is easier to use in the search queries.
	 */
	public void setDates() {
		if(this.getStartMonth() != "0" && this.getStartYear() != "0" && this.getEndMonth() != "0" && this.getEndYear() != "0" && this.getStartDay()!=null && this.getEndDay()!=null){
			this.setStartDate(this.getStartDay()+"-"+this.getStartMonth()+"-"+this.getStartYear()+" 12.00.00.000000000 AM");
			this.setEndDate(this.getEndDay()+"-"+this.getEndMonth()+"-"+this.getEndYear()+" 12.00.00.000000000 AM");
		}
	}
}
