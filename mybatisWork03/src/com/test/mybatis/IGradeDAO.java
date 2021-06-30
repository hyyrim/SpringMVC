package com.test.mybatis;

import java.util.ArrayList;

public interface IGradeDAO
{
	public ArrayList<GradeDTO> list();
	public int count();
	public int add(GradeDTO g);
	public int remove(GradeDTO g);
}
