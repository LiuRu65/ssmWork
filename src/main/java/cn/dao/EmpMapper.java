package cn.dao;
import org.apache.ibatis.annotations.Param;
import java.util.List;
import java.util.Date;

import cn.bean.Emp;

/**
*@author LR
*@date 2019/12/05
**/
public interface EmpMapper {
    int deleteByPrimaryKey(Integer empno);

    int insert(Emp record);

    int insertSelective(Emp record);

    Emp selectByPrimaryKey(Integer empno);

    int updateByPrimaryKeySelective(Emp record);

    int updateByPrimaryKey(Emp record);

    List<Emp> selectByAll(Emp emp);

    List<Emp> findByEnameLike(@Param("likeEname")String likeEname);









}