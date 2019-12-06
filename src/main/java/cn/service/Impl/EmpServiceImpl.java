package cn.service.Impl;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import cn.bean.Emp;
import cn.dao.EmpMapper;
import cn.service.EmpService;

import java.util.List;

/**
*@author LR
*@date 2019/12/05
**/
@Service
public class EmpServiceImpl implements EmpService{

    @Resource
    private EmpMapper empMapper;

    @Override
    public int deleteByPrimaryKey(Integer empno) {
        return empMapper.deleteByPrimaryKey(empno);
    }

    @Override
    public int insert(Emp record) {
        return empMapper.insert(record);
    }

    @Override
    public int insertSelective(Emp record) {
        return empMapper.insertSelective(record);
    }

    @Override
    public Emp selectByPrimaryKey(Integer empno) {
        return empMapper.selectByPrimaryKey(empno);
    }

    @Override
    public List<Emp> selectByAll(Emp emp) {
        return empMapper.selectByAll(emp);
    }

    @Override
    public List<Emp> findByEnameLike(String likeEname) {
        return empMapper.findByEnameLike(likeEname);
    }

    @Override
    public int updateByPrimaryKeySelective(Emp record) {
        return empMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Emp record) {
        return empMapper.updateByPrimaryKey(record);
    }

}
