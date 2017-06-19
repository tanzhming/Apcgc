package com.immense.tw.dao.test;

import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * 工具类
 * @author dell
 *
 */
public class MybatisUtil {

	private static ThreadLocal<SqlSession> threadLocal = new ThreadLocal<SqlSession>();
	private static SqlSessionFactory sqlSessionFactory;
	
	/**
	 * 加载位于src/mybatis.xml配置文件
	 */
	static{  // 静态方法加载，只加载一次，速度最快
		try {
			Reader reader = Resources.getResourceAsReader("com/immense/tw/dao/test/mybatis.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 禁止外键通过new方法创建
	 */
	private MybatisUtil(){}
	
	/**
	 * 获取SQLSession
	 * @return
	 */
	public static SqlSession getSession(){
		
		// 从当期线程中获取sqlSession对象
		SqlSession sqlSession = threadLocal.get();
		// 如果sqlSession对象为空
		if(sqlSession == null){
			// 在SQLSessionFactory非空的情况下，获取sqlSession对象
			sqlSession = sqlSessionFactory.openSession();
			// 将sqlSession与当前线程绑定在一起
			threadLocal.set(sqlSession);
		}
		// 返回sqlSession对象
		return sqlSession;
	}
	
	/**
	 * 关闭SQLSession与当前线程分离
	 * @return
	 */
	public static void closeSession() {
		// 从当期线程中获取sqlSession对象
		SqlSession sqlSession = threadLocal.get();
		
		// 如果sqlSession对象非空
		if(sqlSession!=null){
			// 关闭
			sqlSession.close();
			// 分离当前线程与sqlSession对象的关系，目的是让垃圾尽早回收
			threadLocal.remove();
		}
		
	}
	
	
	
	
	
	/**
	 * 测试
	 */
	public static void main(String[] args) {
		SqlSession sqlSession = MybatisUtil.getSession();
		Connection conn = sqlSession.getConnection();
		System.out.println(conn!=null?"连接成功":"连接失败");
	}
	
	
	
	
	
	
}
