package com.base.housetest.dao;

import com.base.housetest.model.MoveIn;
import com.base.housetest.model.Student;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.Date;
import java.util.List;

@Mapper
public interface MoveInDao {
//    void add(@Param("name") String name, @Param("studentNo") String studentNo,
//             @Param("whereIn") String whereIn, @Param("inDate")Date inDate,@Param("whyIn") String whyIn);
    void add(@Param("moveIn") MoveIn moveIn);

    List<MoveIn> findAll();

    @Delete("DELETE FROM move_in WHERE id = #{id}")
    void deleteById(Long id);

//    @Delete("DELETE FROM move_in WHERE id IN #{idList}")
    void deleteByListId(Long[] idList);

    List<MoveIn> findSearchLike(String searchLike);

    @Select("SELECT * FROM move_in WHERE id = #{id}")
    MoveIn findById(Long id);

    void update(Long id,@Param("moveIn") MoveIn moveIn);
}
