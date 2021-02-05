package dao;

import static utils.DBUtils.fetchDBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import pojos.Candidate;

public class CandidateDaoImp implements ICandidateDao {

	private Connection cn;
	private PreparedStatement pst,pst1,pst2,pst3,pst4,pst5;
	
	public CandidateDaoImp() throws ClassNotFoundException, SQLException {
		cn=fetchDBConnection();
		String sql="select * from candidates";
		String sqlResult="SELECT * FROM `candidates` ORDER BY votes desc limit 2";
		String sqlselectcandidate="select * from candidates where id=?";
		String sqlinc="update candidates set votes=votes+1 where id=?";
		String sqlselectpartyresult="select party,sum(votes) from candidates group by party";
		String sqlinsert="insert into candidates(name,party,votes) values(?,?,0)";
		pst=cn.prepareStatement(sql);
		pst4=cn.prepareStatement(sqlResult);
		pst1=cn.prepareStatement(sqlselectcandidate);
		pst2=cn.prepareStatement(sqlinc);
		pst3=cn.prepareStatement(sqlselectpartyresult);
		pst5=cn.prepareStatement(sqlinsert);
	}
	@Override
	public List<Candidate> listCandidates() throws SQLException {
		List<Candidate> candidate=new ArrayList<>();
		try(ResultSet rst=pst.executeQuery()){
		while(rst.next())
			candidate.add(new Candidate(rst.getInt(1),rst.getInt(4), rst.getString(2), rst.getString(3)));
		}
		return candidate;
	}
	
	
	
	@Override
	public List<Candidate> listResultPoll() throws SQLException {
		List<Candidate> candidate=new ArrayList<>();
		try(ResultSet rst=pst4.executeQuery()){
		while(rst.next())
			candidate.add(new Candidate(rst.getInt(1),rst.getInt(4), rst.getString(2), rst.getString(3)));
		}
		return candidate;
		
	}
	@Override
	public boolean incrementVotes(int candidateId) throws SQLException {
		
		pst2.setInt(1, candidateId);
		int i=pst2.executeUpdate();
		if(i!=0)
			return true;
		return false;
		}
	@Override
	public boolean registerCandidate(String name, String party) throws SQLException {
		pst5.setString(1, name);
		pst5.setString(2, party);
	
		try {
		int i=pst5.executeUpdate();
		if(i!=0)
			return true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public LinkedHashMap<String, Integer> fetchPartyResult() throws SQLException {
		LinkedHashMap<String, Integer> resultByParty=new LinkedHashMap<String, Integer>();
		try(ResultSet rst=pst3.executeQuery()){
			while(rst.next()) {
				 resultByParty.put(rst.getString(1), rst.getInt(2));
				 return resultByParty;
			}
		}
		return null;
	}
	
	public void cleanUp() throws SQLException {
		if (pst != null)
			pst.close();
		if (pst1 != null)
			pst1.close();
		if (pst2 != null)
			pst2.close();
		if (cn != null)
			cn.close();

	}


	
}
