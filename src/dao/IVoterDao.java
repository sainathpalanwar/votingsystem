package dao;

import java.sql.SQLException;
import java.util.List;

import pojos.Voter;

public interface IVoterDao {
	Voter validateUser(String email,String pwd) throws SQLException;
	boolean updateVotingStatus(String email) throws SQLException;
	boolean isStatus(int voterId) throws SQLException;
	List<Voter> listVoter() throws SQLException;
	boolean registerVoter(String name,String email,String password) throws SQLException;
	
}
