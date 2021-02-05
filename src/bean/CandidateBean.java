package bean;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

import dao.CandidateDaoImp;
import pojos.Candidate;

/*+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| id    | int         | NO   | PRI | NULL    | auto_increment |
| name  | varchar(20) | YES  | UNI | NULL    |                |
| party | varchar(20) | YES  |     | NULL    |                |
| votes | int         | YES  |     | NULL    |                |
+-------+-------------+------+-----+---------+----------------+*/
public class CandidateBean {
	private int id;
	private String name;
	private String party;
	private int votes;
	private Date dob;
	private CandidateDaoImp candidateDao;
	private Candidate candidateDetails;
	
	public CandidateBean() throws ClassNotFoundException, SQLException {
		candidateDao=new CandidateDaoImp();
		System.out.println("Candidate Dao Created");
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getParty() {
		return party;
	}

	public void setParty(String party) {
		this.party = party;
	}

	public int getVotes() {
		return votes;
	}

	public void setVotes(int votes) {
		this.votes = votes;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public CandidateDaoImp getCandidateDao() {
		return candidateDao;
	}

	public void setCandidateDao(CandidateDaoImp candidateDao) {
		this.candidateDao = candidateDao;
	}

	public Candidate getCandidateDetails() {
		return candidateDetails;
	}

	public void setCandidateDetails(Candidate candidateDetails) {
		this.candidateDetails = candidateDetails;
	}
	
	public List<Candidate> candidateList() throws SQLException{
		List<Candidate> candidateList=new ArrayList<>();
		candidateList=candidateDao.listCandidates();
		return candidateList;
	}
	
	public List<Candidate> resultCandidateList() throws SQLException{
		List<Candidate> candidateList=new ArrayList<>();
		candidateList=candidateDao.listResultPoll();
		return candidateList;
	}
	
	public LinkedHashMap<String, Integer> resultPartyWise() throws SQLException{
		LinkedHashMap<String, Integer> resultByParty=new LinkedHashMap<String, Integer>();
		resultByParty=candidateDao.fetchPartyResult();
		return resultByParty;
	}
	
	public boolean addVote() throws SQLException {
		if(candidateDao.incrementVotes(id))
			return true;
		return false;
	}
	

	public boolean registercandidate() throws SQLException {
		if(candidateDao.registerCandidate(name, party))
			return true;
		return false;
	}
}
