package com.base.housetest.dao;

import com.base.housetest.model.Notice;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface NoticeDao {

    @Select("SELECT * FROM notice")
    List<Notice> findAll();

    @Select("SELECT * FROM notice WHERE id = #{id}")
    Notice findById(Long id);

    @Insert("INSERT INTO notice(title,release_people,content) VALUES (#{notice.title},#{notice.releasePeople},#{notice.content})")
    void add(@Param("notice") Notice notice);

    @Update("UPDATE notice SET title=#{notice.title},release_people=#{notice.releasePeople},content=#{notice.content} WHERE id = #{notice.id}")
    void update(@Param("notice") Notice notice);

    @Delete("DELETE FROM notice WHERE id = #{id}")
    void deleteById(Long id);

    void deleteByListId(Long[] idList);
}
