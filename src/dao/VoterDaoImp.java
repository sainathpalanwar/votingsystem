package dao;

import static utils.DBUtils.fetchDBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pojos.Voter;
public class VoterDaoImp implements IVoterDao {

	private Connection cn;
	private PreparedStatement pst,pst1,pst2,pst3,pst4;
	
	public VoterDaoImp() throws ClassNotFoundException, SQLException {
		cn=fetchDBConnection();
		String sql="select * from voters where email=? and password=?";
		String sqlUpdate="update voters set status=1 where email=? and status=0";
		String sqlvoters="select * from voters where role != 'admin' and status=1";
		String sqlRegister="insert into voters (name,email,password,status,role) values (?,?,?,0,'voter')";
		String sqlstatuscheck="select status from voters where id=?";
		pst=cn.prepareStatement(sql);
		pst1=cn.prepareStatement(sqlUpdate);
		pst2=cn.prepareStatement(sqlvoters);
		pst3=cn.prepareStatement(sqlRegister);
		pst4=cn.prepareStatement(sqlstatuscheck);
	}

	@Override
	public Voter validateUser(String email, String pwd) throws SQLException {
		Voter voter=null;
		pst.setString(1, email);
		pst.setString(2,pwd);
		try(ResultSet rst=pst.executeQuery()){
			if(rst.next())
			voter= new Voter(rst.getInt(1), rst.getInt(5), rst.getString(2), rst.getString(3), rst.getString(4), rst.getString(6));		
		}
		return voter;
	}

	@Override
	public boolean updateVotingStatus(String email)throws SQLException {
		pst1.setString(1, email);
		int i=pst1.executeUpdate();
		if(i != 0)
			return true;
	return false;
	}
	
	@Override
	public List<Voter> listVoter() throws SQLException {
		List<Voter> voter=new ArrayList<>();
		try(ResultSet rst=pst2.executeQuery()){
		while(rst.next())
			voter.add(new Voter(rst.getInt(1), rst.getInt(5), rst.getString(2), rst.getString(3), rst.getString(4),rst.getString(6)));
		}
		return voter;
	}

	@Override
	public boolean registerVoter(String name, String email, String password) throws SQLException {
		pst3.setString(1, name);
		pst3.setString(2, email);
		pst3.setString(3, password);
		try {
		int i=pst3.executeUpdate();
		if(i!=0)
			return true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public boolean isStatus(int voterId) throws SQLException {
		pst4.setInt(1, voterId);
		try(ResultSet rst=pst4.executeQuery()){
			if(rst.getInt(1)!=1)
				return true;
		}
		return false;
	}

	public void cleanUp() throws SQLException {
		if (pst != null)
			pst.close();
		if (pst1 != null)
			pst1.close();
		if (cn != null)
			cn.close();

	}




	

	

}
