package ServiceTO;

import java.sql.Date;

public class ChangeRequestTO {
	
	private int changeRequestId;
	private int personId;
	private String changeRequested;
	private String statusFlag;
	private Date date;
	private String time;
	
	public int getChangeRequestId() {
		return changeRequestId;
	}
	public void setChangeRequestId(int changeRequestId) {
		this.changeRequestId = changeRequestId;
	}
	public int getPersonId() {
		return personId;
	}
	public void setPersonId(int personId) {
		this.personId = personId;
	}
	public String getChangeRequested() {
		return changeRequested;
	}
	public void setChangeRequested(String changeRequested) {
		this.changeRequested = changeRequested;
	}
	public String getStatusFlag() {
		return statusFlag;
	}
	public void setStatusFlag(String statusFlag) {
		this.statusFlag = statusFlag;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}

}
