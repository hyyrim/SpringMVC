package com.test.mybatis;

import java.util.ArrayList;

public interface IStudentDAO
{
	public ArrayList<StudentDTO> list();
	public int count();
	public int add(StudentDTO s);
	public int remove(StudentDTO s);

}
