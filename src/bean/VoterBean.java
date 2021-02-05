package bean;

import java.sql.SQLException;

import org.apache.catalina.User;

import dao.VoterDaoImp;
import pojos.Voter;

public class VoterBean {
	private String name,email,password;
	private VoterDaoImp voterDao;
	private Voter userDetails;
	private String message;
	public VoterBean() throws ClassNotFoundException, SQLException {
		voterDao=new VoterDaoImp();
		System.out.println("voter Dao Created");
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public VoterDaoImp getVoterDao() {
		return voterDao;
	}
	public void setVoterDao(VoterDaoImp voterDao) {
		this.voterDao = voterDao;
	}
	public Voter getUserDetails() {
		return userDetails;
	}
	public void setUserDetails(Voter userDetails) {
		this.userDetails = userDetails;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String validateUser()throws SQLException{
		message="";
		userDetails=voterDao.validateUser(email, password);
		if(userDetails==null) {
			message="Invalid Login , Please Retry....";
			return "login";
		}
		else if(userDetails.getRole().equalsIgnoreCase("admin")) {
			message="Admin Login successful";
			return "admin_status";
		}
		else if(userDetails.isStatus())
			return "voter_status";
		return "candidate_list";
	}
	
	public boolean changeVoterStatus() throws SQLException {
		if(voterDao.updateVotingStatus(email))
			return true;
		return false;
		
	}
	
	public boolean registerVoter() throws SQLException {
		if(voterDao.registerVoter(name, email, password))
			return true;
		return false;
	}
}
