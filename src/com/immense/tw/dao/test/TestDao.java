package com.immense.tw.dao.test;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class TestDao {
	
	public List<Student> findAll(){
		SqlSession sqlSession =null;
		sqlSession=MybatisUtil.getSession();
		List<Student> selectList = sqlSession.selectList(Student.class.getName()+".testselect");
		
		return selectList;
	}
	

	public static void main(String[] args) {
		TestDao dao=new TestDao();
		List<Student> students = dao.findAll();
		for (Student student : students) {
			System.out.println(student);
		}
	}
}
