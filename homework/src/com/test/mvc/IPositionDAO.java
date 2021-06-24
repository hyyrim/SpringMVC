/*============================
    #08. IPositionDAO.java
    - 인터페이스
============================*/

package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IPositionDAO
{
	public ArrayList<Position> List() throws SQLException;
	
	public int add(Position position) throws SQLException;
	public Position searchId(String positionId) throws SQLException;
	public int remove(String positionId) throws SQLException;
	public int modify(Position position) throws SQLException;
	public int count(String positionName) throws SQLException;
}