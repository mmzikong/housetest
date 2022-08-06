package com.base.housetest.dao;

import com.base.housetest.model.Epidemic;
import com.base.housetest.model.MoveIn;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface EpidemicDao {

    @Select("SELECT risk_region FROM epidemic")
    List<String> findAllArea();

    @Select("SELECT * FROM epidemic")
    List<Epidemic> findAll();

    @Insert("INSERT INTO epidemic(risk_region) values (#{area})")
    void add(String area);

    @Delete("DELETE FROM epidemic WHERE id = #{id}")
    void deleteById(Long id);

    void deleteByListId(Long[] idList);

    List<Epidemic> findSearchLike(String searchLike);

    List<String> findSearchLikeArea(String searchLike);
}
