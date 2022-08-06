package com.base.housetest.dao;

import com.base.housetest.model.MoveIn;
import com.base.housetest.model.MoveOut;
import com.base.housetest.model.Student;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface MoveOutDao {
    List<MoveOut> findAll();
    void add(@Param("moveOut") MoveOut moveOut);
    @Delete("DELETE FROM move_out WHERE id = #{id}")
    void deleteById(Long id);

    void deleteByListId(Long[] idList);
    List<MoveOut> findSearchLike(String searchLike);
    @Select("SELECT * FROM move_out WHERE id = #{id}")
    MoveOut findById(Long id);

    void update(Long id,@Param("moveOut") MoveOut moveOut);
}
