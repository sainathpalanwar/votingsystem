package dao;

import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;

import pojos.Candidate;

public interface ICandidateDao {
	List<Candidate> listCandidates() throws SQLException;
	boolean incrementVotes(int candidateId) throws SQLException;
	LinkedHashMap<String, Integer> fetchPartyResult()throws SQLException;
	List<Candidate> listResultPoll() throws SQLException;
	boolean registerCandidate(String name, String party)throws SQLException;
}
